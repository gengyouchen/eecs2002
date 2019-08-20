#!/bin/sh
#
# generated.sh - shell script fragment - not very useful on its own
#
# Machine generated for a CPU named "CPU" as defined in:
# c:\EECS2002\Lab1\software\Lab1_software_syslib\..\..\Lab1_SOPC.ptf
#
# Generated: 2011-03-24 19:00:44.416

# DO NOT MODIFY THIS FILE
#
#   Changing this file will have subtle consequences
#   which will almost certainly lead to a nonfunctioning
#   system. If you do modify this file, be aware that your
#   changes will be overwritten and lost when this file
#   is generated again.
#
# DO NOT MODIFY THIS FILE

# This variable indicates where the PTF file for this design is located
ptf=c:\EECS2002\Lab1\software\Lab1_software_syslib\..\..\Lab1_SOPC.ptf

# This variable indicates whether there is a CPU debug core
nios2_debug_core=yes

# This variable indicates how to connect to the CPU debug core
nios2_instance=0

# This variable indicates the CPU module name
nios2_cpu_name=CPU

# These variables indicate what the System ID peripheral should hold
sidp=0x094110a8
id=0u
timestamp=1300963752u

# Include operating system specific parameters, if they are supplied.

if test -f /cygdrive/c/altera/10.1/nios2eds/components/micrium_uc_osii/build/os.sh ; then
   . /cygdrive/c/altera/10.1/nios2eds/components/micrium_uc_osii/build/os.sh
fi
