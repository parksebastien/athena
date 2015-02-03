#-----------------------------------------------------------------------
# TITLE:
#    field_types.tcl
#
# AUTHOR:
#    Will Duquette
#
# DESCRIPTION:
#    athena_sim(1): dynaform(n) field type aliases
#
#    This module defines dynaform(n) field types and aliases for use in order
#    dialogs and other data entry forms.  It should be loaded before any order
#    dialogs are defined.
#
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Aliases

# actorlist: pick a list of actors by name
dynaform fieldtype alias actorlist enumlonglist \
    -showkeys yes \
    -width    30  \
    -dictcmd {::actor namedict}

# cap: Pick a cap by name.
dynaform fieldtype alias cap enumlong \
    -showkeys yes \
    -dictcmd  {::cap namedict}

# comparator: An ecomparator value
dynaform fieldtype alias comparator enumlong \
    -dictcmd {ecomparator deflist}

# concern: An econcern value
dynaform fieldtype alias concern enum \
    -listcmd {econcern names}

dynaform fieldtype alias concernlist enumlonglist \
    -showkeys yes \
    -width 30     \
    -dictcmd {econcern deflist}

# curse: pick a curse by name.
dynaform fieldtype alias curse enum -listcmd {::curse names}

# expr: A text field for editing expressions.
dynaform fieldtype alias expr text -width 60

# frclist: Pick from a list of force groups; longname shown
dynaform fieldtype alias frclist enumlonglist \
    -showkeys yes \
    -width    30  \
    -dictcmd {::frcgroup namedict}

# group: Pick a group by name.
dynaform fieldtype alias group enum -listcmd {::group names}

# grouplist: Pick a list of groups; longname shown
dynaform fieldtype alias grouplist enumlonglist \
    -showkeys yes \
    -width    30  \
    -dictcmd  {::group namedict}

# hook: Pick a hook ID
dynaform fieldtype alias hook dbkey \
    -table hooks \
    -keys  hook_id

# inject: Pick an inject by its ID.
dynaform fieldtype alias inject dbkey \
    -table gui_injects  \
    -keys  {curse_id inject_num}

# mad: Magic Attitude Driver ID
dynaform fieldtype alias mad dbkey \
    -table    gui_mads  \
    -keys     mad_id    \
    -dispcols longid    \
    -widths   40

# mag: qmag(n) values
dynaform fieldtype alias mag range \
    -datatype    ::qmag \
    -showsymbols yes    \
    -resetvalue  0.0    \
    -resolution  0.5    \
    -min         -40.0  \
    -max         40.0

# localn: Pick a local neighborhood by name
dynaform fieldtype alias localn enumlong \
    -showkeys yes \
    -dictcmd {::nbhood local namedict}


# payload: Pick a payload by its ID.
dynaform fieldtype alias payload dbkey \
    -table gui_payloads \
    -keys  {iom_id payload_num}

# percent: Pick a percentage.
dynaform fieldtype alias percent range -datatype ::ipercent

# plant: Pick a plant by its ID.
dynaform fieldtype alias plant dbkey \
    -table gui_plants_na  \
    -keys  {n a}

# posfrac: Fraction, 0.01 to 1.0
dynaform fieldtype alias posfrac range \
    -datatype   ::rposfrac             \
    -resolution 0.01

# rel: Relationship value
dynaform fieldtype alias rel range \
    -datatype   ::qaffinity \
    -resolution 0.1

# roles: Pick one or more roles to group(s) mapping
dynaform fieldtype alias roles rolemap \
    -listheight 6 \
    -liststripe 1 \
    -listwidth  20

# sat: Pick a satisfaction level
dynaform fieldtype alias sat range \
    -datatype    ::qsat \
    -showsymbols yes    \
    -resetvalue  0.0

# sal: Pick a saliency
dynaform fieldtype alias sal range \
    -datatype    ::qsaliency \
    -showsymbols yes         \
    -resetvalue  1.0 


