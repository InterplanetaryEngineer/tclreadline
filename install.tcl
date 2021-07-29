#!/usr/bin/env tclsh

set version 2.3.8
set lib_path /usr/lib
set tcl_version 8.6

set source_file tclreadline.c
set header_file tclreadline.h
set shared_lib libtclreadline.so
set readline_init_file [file join [file dirname [info script]] tclreadlineInit.tcl]
set module_file [file join $lib_path tcl8 $tcl_version tclreadline-$version.tm]

# (Re)compile if compilee is not present or older than the source files
if {![file exists $shared_lib] || \
    [file mtime $source_file] >= [file mtime $shared_lib] || \
    [file mtime $header_file.in] >= [file mtime $shared_lib]} {

    # Generate header
    set header [open $header_file.in]
    set header_prototype [read $header]
    close $header
    set header [open $header_file w]
    puts $header \
        [string map "@TCLRL_DIR@ $shared_lib @VERSION@ 2.3.8 @PATCHLEVEL_STR@ 2.3.8" $header_prototype]
    close $header

    # Compile with default c compiler
    exec cc -DHAVE_CONFIG_H -Wall -g -O2 -fPIC -DPIC \
        -I. -I/usr/include -L$lib_path -ltcl$tcl_version -lreadline -shared $source_file -o $shared_lib
}

# install module
set modfile [open $module_file w]
puts $modfile "source $readline_init_file"
close $modfile

puts "
Installed to $module_file; to uninstall, just delete that file.

All other files have remained in this directory; re-run this script if you move it.

To use tclreadline in your interactive tclsh sesssions, copy the
relevant sections from sample.tclshrc into your .tclshrc or .wishrc file.
"

