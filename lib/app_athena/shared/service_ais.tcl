#-----------------------------------------------------------------------
# TITLE:
#    service_ais.tcl
#
# AUTHOR:
#    Dave Hanks
#
# DESCRIPTION:
#    athena_sim(1): Abstract Infrastructure Service (AIS) Manager
#
#    This module is the API used by tactics to set and update
#    abstract infrastructure services to civilian groups.  An abstact
#    insfrastructure service is one that does not require funding or have
#    any explicit infrastructure (such as power plants or roads) associated
#    with it.  It exists to allow an agent to adjust the actual level of
#    service (ALOS) which, in turn, will cause AIS rules to fire which
#    affect civilian group attitudes.
#
#    For methods that are shared across all services (eg. ENERGY, etc...)
#    the service module is used.
#
#-----------------------------------------------------------------------

snit::type service_ais {
    # Make it a singleton
    pragma -hasinstances no

    typemethod assess {} {
        foreach s [eabservice names] {
            $type LogLOSChanges $s
            $type ComputeLOS $s
            profile 1 driver::$s assess
        }
    }

    typemethod ComputeLOS {s} {
        set parms(gainNeeds)  [parm get service.$s.gainNeeds]
        set parms(gainExpect) [parm get service.$s.gainExpect]

        foreach {g urb pop oldX Ag Rg} [rdb eval {
            SELECT G.g                AS g,
                   G.urbanization     AS urb,
                   D.population       AS pop,
                   SG.expected        AS oldX,
                   SG.new_actual      AS Ag,
                   SG.required        AS Rg
            FROM local_civgroups AS G 
            JOIN demog_g    AS D   ON (D.g = G.g)
            JOIN service_sg AS SG  ON (SG.g = G.g AND SG.s=$s)
            GROUP BY G.g
        }] {
            # FIRST, set actual and required, abstract service gets 
            # ALOS set from outside
            set parms(Ag) $Ag
            set parms(Rg) $Rg

            # NEXT, default other service parms to 0.0
            set parms(Xg) 0.0
            set parms(expectf) 0.0
            set parms(needs) 0.0

            # NEXT, if the group has population, it needs service
            if {$pop > 0} {
                # Compute the actual value

                # The status quo expected value is the same as the
                # status quo actual value (but not more than 1.0).
                if {[strategy locking]} {
                    let oldX {min(1.0,$parms(Ag))}
                }

                # Get the smoothing constant.
                if {$parms(Ag) > $oldX} {
                    set alpha [parm get service.$s.alphaA]
                } else {
                    set alpha [parm get service.$s.alphaX]
                }

                # Compute the expected value
                let parms(Xg) {$oldX + $alpha*(min(1.0,$parms(Ag)) - $oldX)}

                # Compute expectf and needs factor
                set parms(expectf) [service expectf [array get parms]]
                set parms(needs)   [service needs [array get parms]]
            }

            # Save the new values
            rdb eval {
                UPDATE service_sg
                SET required    = $parms(Rg),
                    expected    = $parms(Xg),
                    actual      = $parms(Ag),
                    expectf     = $parms(expectf),
                    needs       = $parms(needs)
                WHERE g=$g AND s=$s;
            }
        }
    }

    # LogLOSChanges  s
    #
    # s   - an eabservice(n) value
    #
    # This method logs changes to actual level of service provided to
    # civilian groups.  Only changes greater than 0.001 to the
    # current level of service are logged.

    typemethod LogLOSChanges {s} {
        rdb eval {
            SELECT SG.new_actual  AS new,
                   SG.actual      AS actual,
                   SG.new_actual-actual AS delta,
                   SG.g           AS g,
                   SG.s           AS s,
                   G.n            AS n
            FROM service_sg AS SG
            JOIN local_civgroups AS G ON (G.g = SG.g)
            WHERE abs(delta) > 0.001
            AND s=$s
            ORDER BY delta DESC, g
        } {
            set dir "increased"
            if {$delta < 0} {
                set dir "decreased"
                let delta {-$delta}
            }

            sigevent log 1 strategy "
                Civilian group {group:$g} has actual level of $s
                service $dir by [format %.3f $delta] to
                [format %.3f $new].
            " $g $n
        }
    }
}

