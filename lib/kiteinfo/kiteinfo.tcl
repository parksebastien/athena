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
        url-docs/aug.docx https://pepper.jpl.nasa.gov/kite/xdocs/athena/6.3/aug-20141028.docx
        apptype-athena exe
        reqver-Tktable 2.11
        reqver-ctext 3.3
        local-Marsbin 1
        local-Img 0
        local-kitedocs 1
        reqver-tdom 0.8
        force-athena_batch 0
        exclude-helptool {}
        reqver-comm 4.6
        local-Tktable 0
        local-simlib 1
        exclude-cellide {}
        xfiles {docs/aag.docx docs/aug.docx docs/rules.pptx docs/mag.docx}
        local-Tkhtml 0
        apps {athena athena_batch cellide helptool}
        local-fileutil 0
        dists {install-%platform src docs}
        reqver-kitedocs 0.4.5
        icon-athena_batch {}
        local-textutil::adjust 0
        force-helptool 0
        local-tablelist 0
        local-treectrl 0
        icon-athena {}
        reqver-kiteutils 0.4.5
        reqver-fileutil 1.14
        url-docs/mag.docx https://pepper.jpl.nasa.gov/kite/xdocs/mars/3.0/mag-20140826.docx
        local-marsutil 1
        exclude-athena_batch {Img BWidget Tktable treectrl tablelist Tkhtml}
        reqver-marsgui 3.0.9
        reqver-uri 1.2
        apptype-athena_batch exe
        distpat-install-%platform {
    LICENSE
    README.md
    %apps
    docs/*.html
    docs/*.png
    docs/man1/athena.html
    docs/man1/athena_batch.html
    docs/man1/cellide.html
    docs/athena.helpdb
    docs/*.docx
    docs/*.pptx
}
        reqver-textutil::adjust 0.7
        gui-cellide 1
        url-docs/rules.pptx https://pepper.jpl.nasa.gov/kite/xdocs/athena/6.3/rules-20141010.pptx
        reqver-tls 1.6
        icon-helptool {}
        build-help {make clean all}
        local-snit 0
        reqver-treectrl 2.4
        local-marsgui 1
        local-uri 0
        reqver-BWidget 1.9
        apptype-cellide exe
        reqver-marsutil 3.0.9
        local-tls 0
        provides {}
        description {Athena Regional Stability Simulation}
        gui-athena_batch 0
        local-BWidget 0
        apptype-helptool kit
        reqver-sqlite3 3.8.5
        local-ctext 0
        reqver-textutil::expander 1.3
        shell {
    catch {rename echo ""}
    package require projectlib
    namespace import projectlib::*
}
        icon-cellide {}
        reqver-snit 2.3
        name athena
        gui-athena 1
        url-docs/aag.docx https://pepper.jpl.nasa.gov/kite/xdocs/athena/6.3/aag-20141010.docx
        force-athena 0
        local-sqlite3 0
        force-cellide 0
        reqver-tablelist 5.11
        distpat-docs {
    docs/*.html
    docs/*.png
    docs/man*/*.html
    docs/man*/*.png
    docs/*.docx
    docs/*.pptx
}
        reqver-struct::set 2.2
        exclude-athena {}
        gui-helptool 1
        reqver-simlib 3.0.9
        local-struct::set 0
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
        requires {snit comm Img BWidget Tktable treectrl sqlite3 tablelist textutil::expander textutil::adjust Tkhtml uri fileutil ctext tls tdom struct::set kiteutils kitedocs marsutil marsgui simlib Marsbin}
        clean-help {make clean}
        poc William.H.Duquette@jpl.nasa.gov
        srcs help
        local-tdom 0
        local-comm 0
        reqver-Marsbin 3.0.9
        local-kiteutils 1
        local-textutil::expander 0
        version 6.3.0a5
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
