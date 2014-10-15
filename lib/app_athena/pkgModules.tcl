#-----------------------------------------------------------------------
# TITLE:
#    pkgModules.tcl
#
# PROJECT:
#    athena-sim - Athena Regional Stability Simulation
#
# DESCRIPTION:
#    app_athena(n) package modules file
#
#    Generated by Kite.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Package Definition

# -kite-provide-start  DO NOT EDIT THIS BLOCK BY HAND
package provide app_athena 6.3.1a0
# -kite-provide-end


#-----------------------------------------------------------------------
# Required Packages

# Add 'package require' statements for this package's external 
# dependencies to the following block.  Kite will update the versions 
# numbers automatically as they change in project.kite.

# -kite-require-start ADD EXTERNAL DEPENDENCIES
package require snit 2.3
package require sqlite3 3.8.5
package require textutil::adjust 0.7
package require kiteutils 0.4.0a0
package require marsutil 3.0.2a0
package require simlib 3.0.2a0
package require projectlib

namespace import ::projectlib::*

# For Tk applications
if {$::loadTk} {
    package require Tk 8.6
    package require ctext 3.3
    package require projectgui

    namespace import ::projectgui::*
}

# -kite-require-end

#-----------------------------------------------------------------------
# Namespace definition

namespace eval ::app_athena:: {
    variable library [file dirname [info script]]
}

#-----------------------------------------------------------------------
# Load app_athena(n) modules

source [file join $::app_athena::library app.tcl      ]
source [file join $::app_athena::library scenario.tcl ]
source [file join $::app_athena::library sim.tcl      ]
source [file join $::app_athena::library engine.tcl   ]
source [file join $::app_athena::library log.tcl      ]
source [file join $::app_athena::library cif.tcl      ]
source [file join $::app_athena::library map.tcl      ]
source [file join $::app_athena::library sanity.tcl   ]
source [file join $::app_athena::library axdb.tcl     ]

#-----------------------------------------------------------------------
# Load app_athena(n) subpackages

source [file join $::app_athena::library shared modules.tcl]

# For Tk applications
if {$::loadTk} {
    source [file join $::app_athena::library ui      modules.tcl]
    source [file join $::app_athena::library wnbhood modules.tcl]
    source [file join $::app_athena::library wintel  modules.tcl]
}







