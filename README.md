# tclreadline -- gnu readline for tcl

Copyright (c) 1998 - 2014, Johannes Zellner <johannes@zellner.org>
This software is copyright under the BSD license.

This directory contains the sources and documentation for tclreadline,
which builds a connection between tcl and the gnu readline.

This is a fork of the project maintained at https://github.com/flightaware/tclreadline,
to use a simple Tcl script for building and installing.

Documentation
================

The tclreadline.n nroff man page in this release contains the reference
manual entries for tclreadline.  If you only want to use tclreadline as
a tool for interactive script development,  you don't have to read this
manual page at all.  Simply change your .tclshrc according to the section
later in this file.

Compiling and installing tclreadline
=======================================

This release requires Tcl 8.0 or higher and GNU readline 2.2 or higher
and will probably only build under UNIX (Linux).

Move this folder where it should stay, then simply run ./install.tcl
(depending on your Tcl installation, you may want to edit the `lib_path`
and `tcl_version`). The installation will only drop a module file
referencing this directory in Tcl's package path.


Using tclreadline for interactive tcl scripting.
================================================

Copy the relevant sections from sample.tclshrc into your
`$HOME/.tclshrc` or `$HOME/.wishrc`.

