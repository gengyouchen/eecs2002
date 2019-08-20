# TCL File Generated by Component Editor 10.1sp1
# Thu Apr 07 15:58:50 CST 2011
# DO NOT MODIFY


# +-----------------------------------
# | 
# | seg7 "Seven Segment Displays Controller" v1.0
# | Geng You Chen 2011.04.07.15:58:50
# | This IP can controll 7-segment displays on DE2-70 board.
# | 
# | C:/EECS2002/Lab3/seg7.v
# | 
# |    ./seg7.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 10.1
# | 
package require -exact sopc 10.1
# | 
# +-----------------------------------

# +-----------------------------------
# | module seg7
# | 
set_module_property DESCRIPTION "This IP can controll 7-segment displays on DE2-70 board."
set_module_property NAME seg7
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP EECS2002
set_module_property AUTHOR "Geng You Chen"
set_module_property DISPLAY_NAME "Seven Segment Displays Controller"
set_module_property TOP_LEVEL_HDL_FILE seg7.v
set_module_property TOP_LEVEL_HDL_MODULE seg7
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL TRUE
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file seg7.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point s0
# | 
add_interface s0 clock end
set_interface_property s0 clockRate 0

set_interface_property s0 ENABLED true

add_interface_port s0 csi_s0_clk clk Input 1
add_interface_port s0 csi_s0_reset_n reset_n Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point s1
# | 
add_interface s1 avalon end
set_interface_property s1 addressAlignment NATIVE
set_interface_property s1 addressUnits WORDS
set_interface_property s1 associatedClock s0
set_interface_property s1 burstOnBurstBoundariesOnly false
set_interface_property s1 explicitAddressSpan 0
set_interface_property s1 holdTime 0
set_interface_property s1 isMemoryDevice false
set_interface_property s1 isNonVolatileStorage false
set_interface_property s1 linewrapBursts false
set_interface_property s1 maximumPendingReadTransactions 0
set_interface_property s1 printableDevice false
set_interface_property s1 readLatency 0
set_interface_property s1 readWaitTime 1
set_interface_property s1 setupTime 0
set_interface_property s1 timingUnits Cycles
set_interface_property s1 writeWaitTime 0

set_interface_property s1 ENABLED true

add_interface_port s1 avs_s1_write_n write_n Input 1
add_interface_port s1 avs_s1_read_n read_n Input 1
add_interface_port s1 avs_s1_address address Input 3
add_interface_port s1 avs_s1_writedata writedata Input 4
add_interface_port s1 avs_s1_readdata readdata Output 4
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point s2
# | 
add_interface s2 conduit end

set_interface_property s2 ENABLED true

add_interface_port s2 coe_s2_export_oHEX0_D export Output 7
add_interface_port s2 coe_s2_export_oHEX1_D export Output 7
add_interface_port s2 coe_s2_export_oHEX2_D export Output 7
add_interface_port s2 coe_s2_export_oHEX3_D export Output 7
add_interface_port s2 coe_s2_export_oHEX4_D export Output 7
add_interface_port s2 coe_s2_export_oHEX5_D export Output 7
add_interface_port s2 coe_s2_export_oHEX6_D export Output 7
add_interface_port s2 coe_s2_export_oHEX7_D export Output 7
add_interface_port s2 coe_s2_export_oHEX7_DP export Output 1
add_interface_port s2 coe_s2_export_oHEX0_DP export Output 1
add_interface_port s2 coe_s2_export_oHEX1_DP export Output 1
add_interface_port s2 coe_s2_export_oHEX2_DP export Output 1
add_interface_port s2 coe_s2_export_oHEX3_DP export Output 1
add_interface_port s2 coe_s2_export_oHEX4_DP export Output 1
add_interface_port s2 coe_s2_export_oHEX5_DP export Output 1
add_interface_port s2 coe_s2_export_oHEX6_DP export Output 1
# | 
# +-----------------------------------
