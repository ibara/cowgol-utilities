Cowgol utilities
================
This repository contains some single-file utilities written in the
[Cowgol](http://cowlark.com/cowgol/) programming language.

The utilities here are written on and built on an OpenBSD/amd64
system. These utilities are tested on OpenBSD/amd64 using the cgen
backend, PDP-11 with the unixv7 backend, and Intel 8080 with the
CP/M backend. They should work on all supported Cowgol systems.

Utilities list
--------------
* bin2hex.cow: Binary to Intel HEX converter
* bfc.cow: Brainfuck to Cowgol transpiler
* cat.cow: Clone of Unix cat(1) utility
* dis8080.cow: Intel 8080 disassembler
* even.cow: Basic pager similar to more(1) or less(1)
* hexdump.cow: Hexdump utility
* rpn.cow: Reverse Polish notation calculator

stdcow
------
These utilties use stdcow, my standard library for Cowgol.
If you'd like to make changes to `stdcow.coh`, please submit those
changes to the [stdcow repository](https://github.com/ibara/stdcow).

License
-------
ISC License. See individual files for more details.
