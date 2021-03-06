#-----------------------------------------------------------------------
# TITLE:
#   kiteinfo.tcl
#
# PROJECT:
#   athena - Athena Regional Stability Simulation
#
# DESCRIPTION:
#   Kite: kiteinfo(n) Package
#
#   This package was auto-generated by Kite to provide the 
#   project athena's code with access to the contents of its 
#   project.kite file at runtime.
#
#   Generated by Kite.
#-----------------------------------------------------------------------

namespace eval ::kiteinfo:: {
    variable kiteInfo

    array set kiteInfo {
        reqver-Tktable 2.11
        mansec-5 {File Formats}
        apptype-athena exe
        exclude-athenawb {}
        local-json 0
        reqver-ctext 3.3
        local-Marsbin 1
        local-Img 0
        local-kitedocs 1
        reqver-tdom 0.8
        reqver-comm 4.6
        exclude-helptool {}
        local-Tktable 0
        local-simlib 1
        local-ncgi 0
        exclude-cellide {}
        xfiles {}
        reqver-json 1.3.3
        local-Tkhtml 0
        apps {athena arachne athenawb athena_log cellide helptool}
        gui-arachne 0
        gui-athena_log 1
        local-html 0
        local-fileutil 0
        force-athenawb 0
        force-athena_log 0
        dists {install-%platform src docs}
        reqver-kitedocs 0.5.0
        local-textutil::adjust 0
        apptype-arachne exe
        reqver-ncgi 1.4.3
        force-helptool 0
        local-tablelist 0
        local-treectrl 0
        reqver-base64 2.4.2
        reqver-html 1.4.3
        icon-athena {}
        after-docs {{
    # Copy the Arachne I/F Spec to htdocs.
    if {[file exists docs/arachne.html]} {
        file copy -force docs/arachne.html htdocs/
    }

    # Copy the Mars Analyst's Guide to the docs directory.
    if {[file exists ../mars/docs/mag.docx]} {
        file copy -force ../mars/docs/mag.docx docs/
    }
}}
        reqver-kiteutils 0.5.0
        reqver-fileutil 1.14
        icon-arachne {}
        icon-athenawb {}
        local-marsutil 1
        reqver-marsgui 3.0.23
        reqver-uri 1.2
        distpat-install-%platform {
    LICENSE
    README.md
    %apps
    docs/*.html
    docs/*.png
    docs/man1/athenawb.html
    docs/man1/athena.html
    docs/man1/arachne.html
    docs/*.helpdb
    docs/*.docx
    docs/*.pptx
    htdocs/*
    htdocs/*/*
    htdocs/*/*/*
    htdocs/*/*/*/*
    maps/*
}
        reqver-textutil::adjust 0.7
        gui-cellide 1
        reqver-tls 1.6.4
        icon-helptool {}
        local-snit 0
        build-help {make clean all}
        force-arachne 0
        reqver-treectrl 2.4
        local-marsgui 1
        reqver-md5 2.0.7
        local-uri 0
        reqver-BWidget 1.9
        apptype-athenawb exe
        apptype-athena_log kit
        apptype-cellide exe
        reqver-marsutil 3.0.23
        local-tls 0
        provides {athena ahttpd}
        description {Athena Regional Stability Simulation}
        local-md5 0
        local-BWidget 0
        reqver-sqlite3 3.8.5
        apptype-helptool kit
        binary-ahttpd 0
        local-ctext 0
        reqver-textutil::expander 1.3
        reqver-snit 2.3
        shell {
    catch {rename echo ""}
    package require projectlib
    namespace import projectlib::*
}
        icon-cellide {}
        name athena
        reqver-counter 2.0
        gui-athena 0
        gui-athenawb 1
        local-base64 0
        local-sqlite3 0
        force-athena 0
        reqver-tablelist 5.11
        force-cellide 0
        distpat-docs {
    docs/*.html
    docs/*.png
    docs/man*/*.html
    docs/man*/*.png
    docs/*.docx
    docs/*.pptx
}
        reqver-struct::set 2.2
        local-counter 0
        exclude-athena {
    Img
    BWidget
    Tktable
    treectrl
    tablelist
    Tkhtml
    ctext
    marsgui
}
        exclude-athena_log {}
        gui-helptool 1
        reqver-simlib 3.0.23
        mansecs {1 5 i n}
        binary-athena 0
        local-struct::set 0
        mansec-i {Tcl Interfaces}
        distpat-src {
    project.kite
    LICENSE
    README.md
    TODO.md
    bin/*.tcl
    data/*/*
    docs/*.ehtml
    docs/*.png
    docs/*.mm
    docs/*.graphml
    docs/*/*.ehtml
    src/help/*.help
    src/help/img/*.png
    installer/*
    lib/*/*
    lib/*/*/*
    scenarios/*.tcl
    test/*/*
}
        reqver-Tkhtml 3.0
        requires {snit comm Img BWidget Tktable treectrl sqlite3 tablelist textutil::expander textutil::adjust Tkhtml uri fileutil ctext tls tdom struct::set json md5 counter ncgi html base64 kiteutils kitedocs marsutil marsgui simlib Marsbin}
        icon-athena_log {}
        clean-help {make clean}
        exclude-arachne {
    Img
    BWidget
    Tktable
    treectrl
    tablelist
    Tkhtml
    ctext
    marsgui
}
        poc William.H.Duquette@jpl.nasa.gov
        mansec-n {Tcl Commands}
        srcs help
        local-tdom 0
        local-comm 0
        mansec-1 Executables
        reqver-Marsbin 3.0.23
        local-kiteutils 1
        local-textutil::expander 0
        version 6.3.3
        reqver-Img 1.4.1
    }

    namespace export \
        project      \
        version      \
        description  \
        includes     \
        gui          \
        require

    namespace ensemble create
}

#-----------------------------------------------------------------------
# Commands

# project
#
# Returns the project name.
# FIXME: should be kiteinfo(project) when project.tcl is updated.

proc ::kiteinfo::project {} {
    variable kiteInfo

    return $kiteInfo(name)
}

# version
#
# Returns the project version number.

proc ::kiteinfo::version {} {
    variable kiteInfo

    return $kiteInfo(version)
}

# description
#
# Returns the project description.

proc ::kiteinfo::description {} {
    variable kiteInfo

    return $kiteInfo(description)
}

# includes
#
# Returns the names of the "include" libraries.

proc ::kiteinfo::includes {} {
    variable kiteInfo

    return $kiteInfo(includes)
}

# gui app
#
# app  - An application name
#
# Returns 1 if the app is supposed to have a GUI, and 0 otherwise.

proc ::kiteinfo::gui {app} {
    variable kiteInfo

    return $kiteInfo(gui-$app)
}
