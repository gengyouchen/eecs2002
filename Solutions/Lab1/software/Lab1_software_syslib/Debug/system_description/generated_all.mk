# generated_all.mk
#
# Machine generated for a CPU named "CPU" as defined in:
# c:\EECS2002\Lab1\software\Lab1_software_syslib\..\..\Lab1_SOPC.ptf
#
# Generated: 2011-03-24 18:57:59.471

# ******************************************************************************
# *                                                                            *
# * License Agreement                                                          *
# *                                                                            *
# * Copyright (c) 2003 Altera Corporation, San Jose, California, USA.          *
# * All rights reserved.                                                       *
# *                                                                            *
# * Permission is hereby granted, free of charge, to any person obtaining a    *
# * copy of this software and associated documentation files (the "Software"), *
# * to deal in the Software without restriction, including without limitation  *
# * the rights to use, copy, modify, merge, publish, distribute, sublicense,   *
# * and/or sell copies of the Software, and to permit persons to whom the      *
# * Software is furnished to do so, subject to the following conditions:       *
# *                                                                            *
# * The above copyright notice and this permission notice shall be included in *
# * all copies or substantial portions of the Software.                        *
# *                                                                            *
# * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR *
# * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *
# * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *
# * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *
# * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *
# * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER        *
# * DEALINGS IN THE SOFTWARE.                                                  *
# *                                                                            *
# * This agreement shall be governed in all respects by the laws of the State  *
# * of California and by the laws of the United States of America.             *
# *                                                                            *
# * Altera does not recommend, suggest or require that this reference design   *
# * file be used in conjunction or combination with any other product.         *
# ******************************************************************************

# DO NOT MODIFY THIS FILE
#
#   Changing this file will have subtle consequences
#   which will almost certainly lead to a nonfunctioning
#   system. If you do modify this file, be aware that your
#   changes will be overwritten and lost when this file
#   is generated again.
#
# DO NOT MODIFY THIS FILE



ifeq ($(HOST_OS),cyg)
remove_spaces_in_path = $(shell cygpath --unix "$(shell cygpath --windows --short-name "$1")")
else
# There is no support for spaces in your IP dir on a non-Windows file system
remove_spaces_in_path = $1
endif


COMPONENTS_PROCESSOR      := /cygdrive/c/altera/10.1/ip/altera/nios2_ip/altera_nios2

COMPONENTS_OS             := /cygdrive/c/altera/10.1/nios2eds/components/micrium_uc_osii

COMPONENTS_DEVICE_DRIVERS := /cygdrive/c/altera/10.1/ip/altera/sopc_builder_ip/altera_avalon_cfi_flash \
                             /cygdrive/c/altera/10.1/ip/altera/sopc_builder_ip/altera_avalon_jtag_uart \
                             /cygdrive/c/altera/10.1/ip/altera/sopc_builder_ip/altera_avalon_lcd_16207 \
                             /cygdrive/c/altera/10.1/ip/altera/sopc_builder_ip/altera_avalon_pio \
                             /cygdrive/c/altera/10.1/ip/altera/sopc_builder_ip/altera_avalon_timer \
                             /cygdrive/c/altera/10.1/ip/altera/sopc_builder_ip/altera_avalon_sysid


CPU = CPU

CPPFLAGS += -DSYSTEM_BUS_WIDTH=32 -DALT_NO_INSTRUCTION_EMULATION
CFLAGS   += -mhw-mul -mno-hw-mulx -mno-hw-div

#
# MicroC/OS-II macros
#

ALT_SIM_OPTIMIZE = 0
