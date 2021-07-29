# FILE: tclreadlineInit.tcl.in
# $Id$
# ---
# tclreadline -- gnu readline for tcl
# https://github.com/flightaware/tclreadline/
# Copyright (c) 1998 - 2014, Johannes Zellner <johannes@zellner.org>
# This software is copyright under the BSD license.
# ---

namespace eval tclreadline:: {
    namespace export Init
}

proc ::tclreadline::Init {} {
    uplevel #0 {
        if {![info exists tclreadline::library]} {
            load [file join [file dirname [info script]] libtclreadline[info sharedlibextension]]
        }
    }
}

tclreadline::Init
::tclreadline::readline customcompleter ::tclreadline::ScriptCompleter

source [file join [file dirname [info script]] tclreadlineSetup.tcl]

set auto_index(::tclreadline::ScriptCompleter) \
    [list source [file join [file dirname [info script]] tclreadlineCompleter.tcl]]
