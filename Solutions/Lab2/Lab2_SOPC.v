//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_jtag_debug_module_arbitrator (
                                          // inputs:
                                           CPU_data_master_address_to_slave,
                                           CPU_data_master_byteenable,
                                           CPU_data_master_debugaccess,
                                           CPU_data_master_latency_counter,
                                           CPU_data_master_read,
                                           CPU_data_master_write,
                                           CPU_data_master_writedata,
                                           CPU_instruction_master_address_to_slave,
                                           CPU_instruction_master_latency_counter,
                                           CPU_instruction_master_read,
                                           CPU_jtag_debug_module_readdata,
                                           CPU_jtag_debug_module_resetrequest,
                                           clk,
                                           reset_n,

                                          // outputs:
                                           CPU_data_master_granted_CPU_jtag_debug_module,
                                           CPU_data_master_qualified_request_CPU_jtag_debug_module,
                                           CPU_data_master_read_data_valid_CPU_jtag_debug_module,
                                           CPU_data_master_requests_CPU_jtag_debug_module,
                                           CPU_instruction_master_granted_CPU_jtag_debug_module,
                                           CPU_instruction_master_qualified_request_CPU_jtag_debug_module,
                                           CPU_instruction_master_read_data_valid_CPU_jtag_debug_module,
                                           CPU_instruction_master_requests_CPU_jtag_debug_module,
                                           CPU_jtag_debug_module_address,
                                           CPU_jtag_debug_module_begintransfer,
                                           CPU_jtag_debug_module_byteenable,
                                           CPU_jtag_debug_module_chipselect,
                                           CPU_jtag_debug_module_debugaccess,
                                           CPU_jtag_debug_module_readdata_from_sa,
                                           CPU_jtag_debug_module_reset_n,
                                           CPU_jtag_debug_module_resetrequest_from_sa,
                                           CPU_jtag_debug_module_write,
                                           CPU_jtag_debug_module_writedata,
                                           d1_CPU_jtag_debug_module_end_xfer
                                        )
;

  output           CPU_data_master_granted_CPU_jtag_debug_module;
  output           CPU_data_master_qualified_request_CPU_jtag_debug_module;
  output           CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  output           CPU_data_master_requests_CPU_jtag_debug_module;
  output           CPU_instruction_master_granted_CPU_jtag_debug_module;
  output           CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  output           CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  output           CPU_instruction_master_requests_CPU_jtag_debug_module;
  output  [  8: 0] CPU_jtag_debug_module_address;
  output           CPU_jtag_debug_module_begintransfer;
  output  [  3: 0] CPU_jtag_debug_module_byteenable;
  output           CPU_jtag_debug_module_chipselect;
  output           CPU_jtag_debug_module_debugaccess;
  output  [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  output           CPU_jtag_debug_module_reset_n;
  output           CPU_jtag_debug_module_resetrequest_from_sa;
  output           CPU_jtag_debug_module_write;
  output  [ 31: 0] CPU_jtag_debug_module_writedata;
  output           d1_CPU_jtag_debug_module_end_xfer;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input            CPU_data_master_debugaccess;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input   [  2: 0] CPU_instruction_master_latency_counter;
  input            CPU_instruction_master_read;
  input   [ 31: 0] CPU_jtag_debug_module_readdata;
  input            CPU_jtag_debug_module_resetrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_CPU_jtag_debug_module;
  wire             CPU_data_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_data_master_requests_CPU_jtag_debug_module;
  wire             CPU_data_master_saved_grant_CPU_jtag_debug_module;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_CPU_jtag_debug_module;
  wire             CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_instruction_master_requests_CPU_jtag_debug_module;
  wire             CPU_instruction_master_saved_grant_CPU_jtag_debug_module;
  wire    [  8: 0] CPU_jtag_debug_module_address;
  wire             CPU_jtag_debug_module_allgrants;
  wire             CPU_jtag_debug_module_allow_new_arb_cycle;
  wire             CPU_jtag_debug_module_any_bursting_master_saved_grant;
  wire             CPU_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] CPU_jtag_debug_module_arb_addend;
  wire             CPU_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] CPU_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] CPU_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] CPU_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] CPU_jtag_debug_module_arb_winner;
  wire             CPU_jtag_debug_module_arbitration_holdoff_internal;
  wire             CPU_jtag_debug_module_beginbursttransfer_internal;
  wire             CPU_jtag_debug_module_begins_xfer;
  wire             CPU_jtag_debug_module_begintransfer;
  wire    [  3: 0] CPU_jtag_debug_module_byteenable;
  wire             CPU_jtag_debug_module_chipselect;
  wire    [  3: 0] CPU_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] CPU_jtag_debug_module_chosen_master_rot_left;
  wire             CPU_jtag_debug_module_debugaccess;
  wire             CPU_jtag_debug_module_end_xfer;
  wire             CPU_jtag_debug_module_firsttransfer;
  wire    [  1: 0] CPU_jtag_debug_module_grant_vector;
  wire             CPU_jtag_debug_module_in_a_read_cycle;
  wire             CPU_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] CPU_jtag_debug_module_master_qreq_vector;
  wire             CPU_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  reg              CPU_jtag_debug_module_reg_firsttransfer;
  wire             CPU_jtag_debug_module_reset_n;
  wire             CPU_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] CPU_jtag_debug_module_saved_chosen_master_vector;
  reg              CPU_jtag_debug_module_slavearbiterlockenable;
  wire             CPU_jtag_debug_module_slavearbiterlockenable2;
  wire             CPU_jtag_debug_module_unreg_firsttransfer;
  wire             CPU_jtag_debug_module_waits_for_read;
  wire             CPU_jtag_debug_module_waits_for_write;
  wire             CPU_jtag_debug_module_write;
  wire    [ 31: 0] CPU_jtag_debug_module_writedata;
  reg              d1_CPU_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_CPU_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module;
  reg              last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module;
  wire    [ 27: 0] shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master;
  wire    [ 27: 0] shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master;
  wire             wait_for_CPU_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~CPU_jtag_debug_module_end_xfer;
    end


  assign CPU_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_CPU_jtag_debug_module | CPU_instruction_master_qualified_request_CPU_jtag_debug_module));
  //assign CPU_jtag_debug_module_readdata_from_sa = CPU_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_jtag_debug_module_readdata_from_sa = CPU_jtag_debug_module_readdata;

  assign CPU_data_master_requests_CPU_jtag_debug_module = ({CPU_data_master_address_to_slave[27 : 11] , 11'b0} == 28'h9410800) & (CPU_data_master_read | CPU_data_master_write);
  //CPU_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign CPU_jtag_debug_module_arb_share_set_values = 1;

  //CPU_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign CPU_jtag_debug_module_non_bursting_master_requests = CPU_data_master_requests_CPU_jtag_debug_module |
    CPU_instruction_master_requests_CPU_jtag_debug_module |
    CPU_data_master_requests_CPU_jtag_debug_module |
    CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign CPU_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //CPU_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign CPU_jtag_debug_module_arb_share_counter_next_value = CPU_jtag_debug_module_firsttransfer ? (CPU_jtag_debug_module_arb_share_set_values - 1) : |CPU_jtag_debug_module_arb_share_counter ? (CPU_jtag_debug_module_arb_share_counter - 1) : 0;

  //CPU_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign CPU_jtag_debug_module_allgrants = (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector) |
    (|CPU_jtag_debug_module_grant_vector);

  //CPU_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign CPU_jtag_debug_module_end_xfer = ~(CPU_jtag_debug_module_waits_for_read | CPU_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_CPU_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_CPU_jtag_debug_module = CPU_jtag_debug_module_end_xfer & (~CPU_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //CPU_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign CPU_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & CPU_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & ~CPU_jtag_debug_module_non_bursting_master_requests);

  //CPU_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_arb_share_counter <= 0;
      else if (CPU_jtag_debug_module_arb_counter_enable)
          CPU_jtag_debug_module_arb_share_counter <= CPU_jtag_debug_module_arb_share_counter_next_value;
    end


  //CPU_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|CPU_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_CPU_jtag_debug_module) | (end_xfer_arb_share_counter_term_CPU_jtag_debug_module & ~CPU_jtag_debug_module_non_bursting_master_requests))
          CPU_jtag_debug_module_slavearbiterlockenable <= |CPU_jtag_debug_module_arb_share_counter_next_value;
    end


  //CPU/data_master CPU/jtag_debug_module arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = CPU_jtag_debug_module_slavearbiterlockenable & CPU_data_master_continuerequest;

  //CPU_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign CPU_jtag_debug_module_slavearbiterlockenable2 = |CPU_jtag_debug_module_arb_share_counter_next_value;

  //CPU/data_master CPU/jtag_debug_module arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = CPU_jtag_debug_module_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master CPU/jtag_debug_module arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = CPU_jtag_debug_module_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master CPU/jtag_debug_module arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = CPU_jtag_debug_module_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted CPU/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module <= CPU_instruction_master_saved_grant_CPU_jtag_debug_module ? 1 : (CPU_jtag_debug_module_arbitration_holdoff_internal | ~CPU_instruction_master_requests_CPU_jtag_debug_module) ? 0 : last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_CPU_jtag_debug_module & CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign CPU_jtag_debug_module_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_CPU_jtag_debug_module = CPU_data_master_requests_CPU_jtag_debug_module & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))) | CPU_instruction_master_arbiterlock);
  //local readdatavalid CPU_data_master_read_data_valid_CPU_jtag_debug_module, which is an e_mux
  assign CPU_data_master_read_data_valid_CPU_jtag_debug_module = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_read & ~CPU_jtag_debug_module_waits_for_read;

  //CPU_jtag_debug_module_writedata mux, which is an e_mux
  assign CPU_jtag_debug_module_writedata = CPU_data_master_writedata;

  assign CPU_instruction_master_requests_CPU_jtag_debug_module = (({CPU_instruction_master_address_to_slave[27 : 11] , 11'b0} == 28'h9410800) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted CPU/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module <= CPU_data_master_saved_grant_CPU_jtag_debug_module ? 1 : (CPU_jtag_debug_module_arbitration_holdoff_internal | ~CPU_data_master_requests_CPU_jtag_debug_module) ? 0 : last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_CPU_jtag_debug_module & CPU_data_master_requests_CPU_jtag_debug_module;

  assign CPU_instruction_master_qualified_request_CPU_jtag_debug_module = CPU_instruction_master_requests_CPU_jtag_debug_module & ~((CPU_instruction_master_read & ((CPU_instruction_master_latency_counter != 0))) | CPU_data_master_arbiterlock);
  //local readdatavalid CPU_instruction_master_read_data_valid_CPU_jtag_debug_module, which is an e_mux
  assign CPU_instruction_master_read_data_valid_CPU_jtag_debug_module = CPU_instruction_master_granted_CPU_jtag_debug_module & CPU_instruction_master_read & ~CPU_jtag_debug_module_waits_for_read;

  //allow new arb cycle for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_master_qreq_vector[0] = CPU_instruction_master_qualified_request_CPU_jtag_debug_module;

  //CPU/instruction_master grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_instruction_master_granted_CPU_jtag_debug_module = CPU_jtag_debug_module_grant_vector[0];

  //CPU/instruction_master saved-grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_instruction_master_saved_grant_CPU_jtag_debug_module = CPU_jtag_debug_module_arb_winner[0] && CPU_instruction_master_requests_CPU_jtag_debug_module;

  //CPU/data_master assignment into master qualified-requests vector for CPU/jtag_debug_module, which is an e_assign
  assign CPU_jtag_debug_module_master_qreq_vector[1] = CPU_data_master_qualified_request_CPU_jtag_debug_module;

  //CPU/data_master grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_data_master_granted_CPU_jtag_debug_module = CPU_jtag_debug_module_grant_vector[1];

  //CPU/data_master saved-grant CPU/jtag_debug_module, which is an e_assign
  assign CPU_data_master_saved_grant_CPU_jtag_debug_module = CPU_jtag_debug_module_arb_winner[1] && CPU_data_master_requests_CPU_jtag_debug_module;

  //CPU/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign CPU_jtag_debug_module_chosen_master_double_vector = {CPU_jtag_debug_module_master_qreq_vector, CPU_jtag_debug_module_master_qreq_vector} & ({~CPU_jtag_debug_module_master_qreq_vector, ~CPU_jtag_debug_module_master_qreq_vector} + CPU_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign CPU_jtag_debug_module_arb_winner = (CPU_jtag_debug_module_allow_new_arb_cycle & | CPU_jtag_debug_module_grant_vector) ? CPU_jtag_debug_module_grant_vector : CPU_jtag_debug_module_saved_chosen_master_vector;

  //saved CPU_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (CPU_jtag_debug_module_allow_new_arb_cycle)
          CPU_jtag_debug_module_saved_chosen_master_vector <= |CPU_jtag_debug_module_grant_vector ? CPU_jtag_debug_module_grant_vector : CPU_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign CPU_jtag_debug_module_grant_vector = {(CPU_jtag_debug_module_chosen_master_double_vector[1] | CPU_jtag_debug_module_chosen_master_double_vector[3]),
    (CPU_jtag_debug_module_chosen_master_double_vector[0] | CPU_jtag_debug_module_chosen_master_double_vector[2])};

  //CPU/jtag_debug_module chosen master rotated left, which is an e_assign
  assign CPU_jtag_debug_module_chosen_master_rot_left = (CPU_jtag_debug_module_arb_winner << 1) ? (CPU_jtag_debug_module_arb_winner << 1) : 1;

  //CPU/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_arb_addend <= 1;
      else if (|CPU_jtag_debug_module_grant_vector)
          CPU_jtag_debug_module_arb_addend <= CPU_jtag_debug_module_end_xfer? CPU_jtag_debug_module_chosen_master_rot_left : CPU_jtag_debug_module_grant_vector;
    end


  assign CPU_jtag_debug_module_begintransfer = CPU_jtag_debug_module_begins_xfer;
  //CPU_jtag_debug_module_reset_n assignment, which is an e_assign
  assign CPU_jtag_debug_module_reset_n = reset_n;

  //assign CPU_jtag_debug_module_resetrequest_from_sa = CPU_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign CPU_jtag_debug_module_resetrequest_from_sa = CPU_jtag_debug_module_resetrequest;

  assign CPU_jtag_debug_module_chipselect = CPU_data_master_granted_CPU_jtag_debug_module | CPU_instruction_master_granted_CPU_jtag_debug_module;
  //CPU_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign CPU_jtag_debug_module_firsttransfer = CPU_jtag_debug_module_begins_xfer ? CPU_jtag_debug_module_unreg_firsttransfer : CPU_jtag_debug_module_reg_firsttransfer;

  //CPU_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign CPU_jtag_debug_module_unreg_firsttransfer = ~(CPU_jtag_debug_module_slavearbiterlockenable & CPU_jtag_debug_module_any_continuerequest);

  //CPU_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (CPU_jtag_debug_module_begins_xfer)
          CPU_jtag_debug_module_reg_firsttransfer <= CPU_jtag_debug_module_unreg_firsttransfer;
    end


  //CPU_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign CPU_jtag_debug_module_beginbursttransfer_internal = CPU_jtag_debug_module_begins_xfer;

  //CPU_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign CPU_jtag_debug_module_arbitration_holdoff_internal = CPU_jtag_debug_module_begins_xfer & CPU_jtag_debug_module_firsttransfer;

  //CPU_jtag_debug_module_write assignment, which is an e_mux
  assign CPU_jtag_debug_module_write = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_write;

  assign shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master = CPU_data_master_address_to_slave;
  //CPU_jtag_debug_module_address mux, which is an e_mux
  assign CPU_jtag_debug_module_address = (CPU_data_master_granted_CPU_jtag_debug_module)? (shifted_address_to_CPU_jtag_debug_module_from_CPU_data_master >> 2) :
    (shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master >> 2);

  assign shifted_address_to_CPU_jtag_debug_module_from_CPU_instruction_master = CPU_instruction_master_address_to_slave;
  //d1_CPU_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_CPU_jtag_debug_module_end_xfer <= 1;
      else 
        d1_CPU_jtag_debug_module_end_xfer <= CPU_jtag_debug_module_end_xfer;
    end


  //CPU_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign CPU_jtag_debug_module_waits_for_read = CPU_jtag_debug_module_in_a_read_cycle & CPU_jtag_debug_module_begins_xfer;

  //CPU_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign CPU_jtag_debug_module_in_a_read_cycle = (CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_read) | (CPU_instruction_master_granted_CPU_jtag_debug_module & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = CPU_jtag_debug_module_in_a_read_cycle;

  //CPU_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign CPU_jtag_debug_module_waits_for_write = CPU_jtag_debug_module_in_a_write_cycle & 0;

  //CPU_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign CPU_jtag_debug_module_in_a_write_cycle = CPU_data_master_granted_CPU_jtag_debug_module & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = CPU_jtag_debug_module_in_a_write_cycle;

  assign wait_for_CPU_jtag_debug_module_counter = 0;
  //CPU_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign CPU_jtag_debug_module_byteenable = (CPU_data_master_granted_CPU_jtag_debug_module)? CPU_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign CPU_jtag_debug_module_debugaccess = (CPU_data_master_granted_CPU_jtag_debug_module)? CPU_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_granted_CPU_jtag_debug_module + CPU_instruction_master_granted_CPU_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_CPU_jtag_debug_module + CPU_instruction_master_saved_grant_CPU_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_data_master_arbitrator (
                                    // inputs:
                                     CPU_data_master_address,
                                     CPU_data_master_byteenable,
                                     CPU_data_master_byteenable_Flash_controller_s1,
                                     CPU_data_master_granted_CPU_jtag_debug_module,
                                     CPU_data_master_granted_Flash_controller_s1,
                                     CPU_data_master_granted_JTAG_controller_avalon_jtag_slave,
                                     CPU_data_master_granted_LCD_controller_control_slave,
                                     CPU_data_master_granted_Lab2_SOPC_clock_0_in,
                                     CPU_data_master_granted_Lab2_SOPC_clock_2_in,
                                     CPU_data_master_granted_SSRAM_controller_s1,
                                     CPU_data_master_granted_green_LEDs_controller_s1,
                                     CPU_data_master_granted_on_chip_memory_s1,
                                     CPU_data_master_granted_push_button_switches_controller_s1,
                                     CPU_data_master_granted_red_LEDs_controller_s1,
                                     CPU_data_master_granted_seven_segment_displays_controller_s1,
                                     CPU_data_master_granted_sysid_control_slave,
                                     CPU_data_master_granted_system_clock_timer_s1,
                                     CPU_data_master_granted_timestamp_timer_s1,
                                     CPU_data_master_granted_toggle_switches_controller_s1,
                                     CPU_data_master_qualified_request_CPU_jtag_debug_module,
                                     CPU_data_master_qualified_request_Flash_controller_s1,
                                     CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave,
                                     CPU_data_master_qualified_request_LCD_controller_control_slave,
                                     CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in,
                                     CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in,
                                     CPU_data_master_qualified_request_SSRAM_controller_s1,
                                     CPU_data_master_qualified_request_green_LEDs_controller_s1,
                                     CPU_data_master_qualified_request_on_chip_memory_s1,
                                     CPU_data_master_qualified_request_push_button_switches_controller_s1,
                                     CPU_data_master_qualified_request_red_LEDs_controller_s1,
                                     CPU_data_master_qualified_request_seven_segment_displays_controller_s1,
                                     CPU_data_master_qualified_request_sysid_control_slave,
                                     CPU_data_master_qualified_request_system_clock_timer_s1,
                                     CPU_data_master_qualified_request_timestamp_timer_s1,
                                     CPU_data_master_qualified_request_toggle_switches_controller_s1,
                                     CPU_data_master_read,
                                     CPU_data_master_read_data_valid_CPU_jtag_debug_module,
                                     CPU_data_master_read_data_valid_Flash_controller_s1,
                                     CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave,
                                     CPU_data_master_read_data_valid_LCD_controller_control_slave,
                                     CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in,
                                     CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in,
                                     CPU_data_master_read_data_valid_SSRAM_controller_s1,
                                     CPU_data_master_read_data_valid_green_LEDs_controller_s1,
                                     CPU_data_master_read_data_valid_on_chip_memory_s1,
                                     CPU_data_master_read_data_valid_push_button_switches_controller_s1,
                                     CPU_data_master_read_data_valid_red_LEDs_controller_s1,
                                     CPU_data_master_read_data_valid_seven_segment_displays_controller_s1,
                                     CPU_data_master_read_data_valid_sysid_control_slave,
                                     CPU_data_master_read_data_valid_system_clock_timer_s1,
                                     CPU_data_master_read_data_valid_timestamp_timer_s1,
                                     CPU_data_master_read_data_valid_toggle_switches_controller_s1,
                                     CPU_data_master_requests_CPU_jtag_debug_module,
                                     CPU_data_master_requests_Flash_controller_s1,
                                     CPU_data_master_requests_JTAG_controller_avalon_jtag_slave,
                                     CPU_data_master_requests_LCD_controller_control_slave,
                                     CPU_data_master_requests_Lab2_SOPC_clock_0_in,
                                     CPU_data_master_requests_Lab2_SOPC_clock_2_in,
                                     CPU_data_master_requests_SSRAM_controller_s1,
                                     CPU_data_master_requests_green_LEDs_controller_s1,
                                     CPU_data_master_requests_on_chip_memory_s1,
                                     CPU_data_master_requests_push_button_switches_controller_s1,
                                     CPU_data_master_requests_red_LEDs_controller_s1,
                                     CPU_data_master_requests_seven_segment_displays_controller_s1,
                                     CPU_data_master_requests_sysid_control_slave,
                                     CPU_data_master_requests_system_clock_timer_s1,
                                     CPU_data_master_requests_timestamp_timer_s1,
                                     CPU_data_master_requests_toggle_switches_controller_s1,
                                     CPU_data_master_write,
                                     CPU_data_master_writedata,
                                     CPU_jtag_debug_module_readdata_from_sa,
                                     Flash_controller_s1_wait_counter_eq_0,
                                     JTAG_controller_avalon_jtag_slave_irq_from_sa,
                                     JTAG_controller_avalon_jtag_slave_readdata_from_sa,
                                     JTAG_controller_avalon_jtag_slave_waitrequest_from_sa,
                                     LCD_controller_control_slave_readdata_from_sa,
                                     LCD_controller_control_slave_wait_counter_eq_0,
                                     Lab2_SOPC_clock_0_in_readdata_from_sa,
                                     Lab2_SOPC_clock_0_in_waitrequest_from_sa,
                                     Lab2_SOPC_clock_2_in_readdata_from_sa,
                                     Lab2_SOPC_clock_2_in_waitrequest_from_sa,
                                     clk,
                                     d1_CPU_jtag_debug_module_end_xfer,
                                     d1_Flash_bridge_avalon_slave_end_xfer,
                                     d1_JTAG_controller_avalon_jtag_slave_end_xfer,
                                     d1_LCD_controller_control_slave_end_xfer,
                                     d1_Lab2_SOPC_clock_0_in_end_xfer,
                                     d1_Lab2_SOPC_clock_2_in_end_xfer,
                                     d1_SSRAM_bridge_avalon_slave_end_xfer,
                                     d1_green_LEDs_controller_s1_end_xfer,
                                     d1_on_chip_memory_s1_end_xfer,
                                     d1_push_button_switches_controller_s1_end_xfer,
                                     d1_red_LEDs_controller_s1_end_xfer,
                                     d1_seven_segment_displays_controller_s1_end_xfer,
                                     d1_sysid_control_slave_end_xfer,
                                     d1_system_clock_timer_s1_end_xfer,
                                     d1_timestamp_timer_s1_end_xfer,
                                     d1_toggle_switches_controller_s1_end_xfer,
                                     green_LEDs_controller_s1_readdata_from_sa,
                                     incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0,
                                     incoming_data_to_and_from_the_SSRAM_controller,
                                     on_chip_memory_s1_readdata_from_sa,
                                     push_button_switches_controller_s1_readdata_from_sa,
                                     red_LEDs_controller_s1_readdata_from_sa,
                                     reset_n,
                                     seven_segment_displays_controller_s1_readdata_from_sa,
                                     sysid_control_slave_readdata_from_sa,
                                     system_clock_timer_s1_irq_from_sa,
                                     system_clock_timer_s1_readdata_from_sa,
                                     timestamp_timer_s1_irq_from_sa,
                                     timestamp_timer_s1_readdata_from_sa,
                                     toggle_switches_controller_s1_readdata_from_sa,

                                    // outputs:
                                     CPU_data_master_address_to_slave,
                                     CPU_data_master_dbs_address,
                                     CPU_data_master_dbs_write_16,
                                     CPU_data_master_irq,
                                     CPU_data_master_latency_counter,
                                     CPU_data_master_readdata,
                                     CPU_data_master_readdatavalid,
                                     CPU_data_master_waitrequest
                                  )
;

  output  [ 27: 0] CPU_data_master_address_to_slave;
  output  [  1: 0] CPU_data_master_dbs_address;
  output  [ 15: 0] CPU_data_master_dbs_write_16;
  output  [ 31: 0] CPU_data_master_irq;
  output  [  2: 0] CPU_data_master_latency_counter;
  output  [ 31: 0] CPU_data_master_readdata;
  output           CPU_data_master_readdatavalid;
  output           CPU_data_master_waitrequest;
  input   [ 27: 0] CPU_data_master_address;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_byteenable_Flash_controller_s1;
  input            CPU_data_master_granted_CPU_jtag_debug_module;
  input            CPU_data_master_granted_Flash_controller_s1;
  input            CPU_data_master_granted_JTAG_controller_avalon_jtag_slave;
  input            CPU_data_master_granted_LCD_controller_control_slave;
  input            CPU_data_master_granted_Lab2_SOPC_clock_0_in;
  input            CPU_data_master_granted_Lab2_SOPC_clock_2_in;
  input            CPU_data_master_granted_SSRAM_controller_s1;
  input            CPU_data_master_granted_green_LEDs_controller_s1;
  input            CPU_data_master_granted_on_chip_memory_s1;
  input            CPU_data_master_granted_push_button_switches_controller_s1;
  input            CPU_data_master_granted_red_LEDs_controller_s1;
  input            CPU_data_master_granted_seven_segment_displays_controller_s1;
  input            CPU_data_master_granted_sysid_control_slave;
  input            CPU_data_master_granted_system_clock_timer_s1;
  input            CPU_data_master_granted_timestamp_timer_s1;
  input            CPU_data_master_granted_toggle_switches_controller_s1;
  input            CPU_data_master_qualified_request_CPU_jtag_debug_module;
  input            CPU_data_master_qualified_request_Flash_controller_s1;
  input            CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave;
  input            CPU_data_master_qualified_request_LCD_controller_control_slave;
  input            CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in;
  input            CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in;
  input            CPU_data_master_qualified_request_SSRAM_controller_s1;
  input            CPU_data_master_qualified_request_green_LEDs_controller_s1;
  input            CPU_data_master_qualified_request_on_chip_memory_s1;
  input            CPU_data_master_qualified_request_push_button_switches_controller_s1;
  input            CPU_data_master_qualified_request_red_LEDs_controller_s1;
  input            CPU_data_master_qualified_request_seven_segment_displays_controller_s1;
  input            CPU_data_master_qualified_request_sysid_control_slave;
  input            CPU_data_master_qualified_request_system_clock_timer_s1;
  input            CPU_data_master_qualified_request_timestamp_timer_s1;
  input            CPU_data_master_qualified_request_toggle_switches_controller_s1;
  input            CPU_data_master_read;
  input            CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  input            CPU_data_master_read_data_valid_Flash_controller_s1;
  input            CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave;
  input            CPU_data_master_read_data_valid_LCD_controller_control_slave;
  input            CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in;
  input            CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in;
  input            CPU_data_master_read_data_valid_SSRAM_controller_s1;
  input            CPU_data_master_read_data_valid_green_LEDs_controller_s1;
  input            CPU_data_master_read_data_valid_on_chip_memory_s1;
  input            CPU_data_master_read_data_valid_push_button_switches_controller_s1;
  input            CPU_data_master_read_data_valid_red_LEDs_controller_s1;
  input            CPU_data_master_read_data_valid_seven_segment_displays_controller_s1;
  input            CPU_data_master_read_data_valid_sysid_control_slave;
  input            CPU_data_master_read_data_valid_system_clock_timer_s1;
  input            CPU_data_master_read_data_valid_timestamp_timer_s1;
  input            CPU_data_master_read_data_valid_toggle_switches_controller_s1;
  input            CPU_data_master_requests_CPU_jtag_debug_module;
  input            CPU_data_master_requests_Flash_controller_s1;
  input            CPU_data_master_requests_JTAG_controller_avalon_jtag_slave;
  input            CPU_data_master_requests_LCD_controller_control_slave;
  input            CPU_data_master_requests_Lab2_SOPC_clock_0_in;
  input            CPU_data_master_requests_Lab2_SOPC_clock_2_in;
  input            CPU_data_master_requests_SSRAM_controller_s1;
  input            CPU_data_master_requests_green_LEDs_controller_s1;
  input            CPU_data_master_requests_on_chip_memory_s1;
  input            CPU_data_master_requests_push_button_switches_controller_s1;
  input            CPU_data_master_requests_red_LEDs_controller_s1;
  input            CPU_data_master_requests_seven_segment_displays_controller_s1;
  input            CPU_data_master_requests_sysid_control_slave;
  input            CPU_data_master_requests_system_clock_timer_s1;
  input            CPU_data_master_requests_timestamp_timer_s1;
  input            CPU_data_master_requests_toggle_switches_controller_s1;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  input            Flash_controller_s1_wait_counter_eq_0;
  input            JTAG_controller_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] JTAG_controller_avalon_jtag_slave_readdata_from_sa;
  input            JTAG_controller_avalon_jtag_slave_waitrequest_from_sa;
  input   [  7: 0] LCD_controller_control_slave_readdata_from_sa;
  input            LCD_controller_control_slave_wait_counter_eq_0;
  input   [ 31: 0] Lab2_SOPC_clock_0_in_readdata_from_sa;
  input            Lab2_SOPC_clock_0_in_waitrequest_from_sa;
  input   [ 31: 0] Lab2_SOPC_clock_2_in_readdata_from_sa;
  input            Lab2_SOPC_clock_2_in_waitrequest_from_sa;
  input            clk;
  input            d1_CPU_jtag_debug_module_end_xfer;
  input            d1_Flash_bridge_avalon_slave_end_xfer;
  input            d1_JTAG_controller_avalon_jtag_slave_end_xfer;
  input            d1_LCD_controller_control_slave_end_xfer;
  input            d1_Lab2_SOPC_clock_0_in_end_xfer;
  input            d1_Lab2_SOPC_clock_2_in_end_xfer;
  input            d1_SSRAM_bridge_avalon_slave_end_xfer;
  input            d1_green_LEDs_controller_s1_end_xfer;
  input            d1_on_chip_memory_s1_end_xfer;
  input            d1_push_button_switches_controller_s1_end_xfer;
  input            d1_red_LEDs_controller_s1_end_xfer;
  input            d1_seven_segment_displays_controller_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_system_clock_timer_s1_end_xfer;
  input            d1_timestamp_timer_s1_end_xfer;
  input            d1_toggle_switches_controller_s1_end_xfer;
  input   [  7: 0] green_LEDs_controller_s1_readdata_from_sa;
  input   [ 15: 0] incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0;
  input   [ 31: 0] incoming_data_to_and_from_the_SSRAM_controller;
  input   [ 31: 0] on_chip_memory_s1_readdata_from_sa;
  input   [  3: 0] push_button_switches_controller_s1_readdata_from_sa;
  input   [ 17: 0] red_LEDs_controller_s1_readdata_from_sa;
  input            reset_n;
  input   [  3: 0] seven_segment_displays_controller_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            system_clock_timer_s1_irq_from_sa;
  input   [ 15: 0] system_clock_timer_s1_readdata_from_sa;
  input            timestamp_timer_s1_irq_from_sa;
  input   [ 15: 0] timestamp_timer_s1_readdata_from_sa;
  input   [ 17: 0] toggle_switches_controller_s1_readdata_from_sa;

  reg     [ 27: 0] CPU_data_master_address_last_time;
  wire    [ 27: 0] CPU_data_master_address_to_slave;
  reg     [  3: 0] CPU_data_master_byteenable_last_time;
  reg     [  1: 0] CPU_data_master_dbs_address;
  wire    [  1: 0] CPU_data_master_dbs_increment;
  reg     [  1: 0] CPU_data_master_dbs_rdv_counter;
  wire    [  1: 0] CPU_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] CPU_data_master_dbs_write_16;
  wire    [ 31: 0] CPU_data_master_irq;
  wire             CPU_data_master_is_granted_some_slave;
  reg     [  2: 0] CPU_data_master_latency_counter;
  wire    [  1: 0] CPU_data_master_next_dbs_rdv_counter;
  reg              CPU_data_master_read_but_no_slave_selected;
  reg              CPU_data_master_read_last_time;
  wire    [ 31: 0] CPU_data_master_readdata;
  wire             CPU_data_master_readdatavalid;
  wire             CPU_data_master_run;
  wire             CPU_data_master_waitrequest;
  reg              CPU_data_master_write_last_time;
  reg     [ 31: 0] CPU_data_master_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  2: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  2: 0] p1_CPU_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_CPU_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_requests_CPU_jtag_debug_module) & (CPU_data_master_granted_CPU_jtag_debug_module | ~CPU_data_master_qualified_request_CPU_jtag_debug_module) & ((~CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_read | (1 & ~d1_CPU_jtag_debug_module_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_CPU_jtag_debug_module | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Flash_controller_s1 | (CPU_data_master_write & !CPU_data_master_byteenable_Flash_controller_s1 & CPU_data_master_dbs_address[1]) | ~CPU_data_master_requests_Flash_controller_s1) & (CPU_data_master_granted_Flash_controller_s1 | ~CPU_data_master_qualified_request_Flash_controller_s1) & ((~CPU_data_master_qualified_request_Flash_controller_s1 | ~CPU_data_master_read | (1 & ((Flash_controller_s1_wait_counter_eq_0 & ~d1_Flash_bridge_avalon_slave_end_xfer)) & (CPU_data_master_dbs_address[1]) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_Flash_controller_s1 | ~CPU_data_master_write | (1 & ((Flash_controller_s1_wait_counter_eq_0 & ~d1_Flash_bridge_avalon_slave_end_xfer)) & (CPU_data_master_dbs_address[1]) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave | ~CPU_data_master_requests_JTAG_controller_avalon_jtag_slave) & ((~CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~JTAG_controller_avalon_jtag_slave_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~JTAG_controller_avalon_jtag_slave_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_LCD_controller_control_slave | ~CPU_data_master_requests_LCD_controller_control_slave) & ((~CPU_data_master_qualified_request_LCD_controller_control_slave | ~CPU_data_master_read | (1 & ((LCD_controller_control_slave_wait_counter_eq_0 & ~d1_LCD_controller_control_slave_end_xfer)) & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_LCD_controller_control_slave | ~CPU_data_master_write | (1 & ((LCD_controller_control_slave_wait_counter_eq_0 & ~d1_LCD_controller_control_slave_end_xfer)) & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in | ~CPU_data_master_requests_Lab2_SOPC_clock_0_in);

  //cascaded wait assignment, which is an e_assign
  assign CPU_data_master_run = r_0 & r_1 & r_2 & r_3;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~Lab2_SOPC_clock_0_in_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~Lab2_SOPC_clock_0_in_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in | ~CPU_data_master_requests_Lab2_SOPC_clock_2_in) & ((~CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~Lab2_SOPC_clock_2_in_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in | ~(CPU_data_master_read | CPU_data_master_write) | (1 & ~Lab2_SOPC_clock_2_in_waitrequest_from_sa & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_SSRAM_controller_s1 | ~CPU_data_master_requests_SSRAM_controller_s1) & (CPU_data_master_granted_SSRAM_controller_s1 | ~CPU_data_master_qualified_request_SSRAM_controller_s1) & ((~CPU_data_master_qualified_request_SSRAM_controller_s1 | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_SSRAM_controller_s1 | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & 1 & (CPU_data_master_qualified_request_green_LEDs_controller_s1 | ~CPU_data_master_requests_green_LEDs_controller_s1) & ((~CPU_data_master_qualified_request_green_LEDs_controller_s1 | ~CPU_data_master_read | (1 & ~d1_green_LEDs_controller_s1_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_green_LEDs_controller_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_on_chip_memory_s1 | ~CPU_data_master_requests_on_chip_memory_s1) & (CPU_data_master_granted_on_chip_memory_s1 | ~CPU_data_master_qualified_request_on_chip_memory_s1) & ((~CPU_data_master_qualified_request_on_chip_memory_s1 | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write)))) & ((~CPU_data_master_qualified_request_on_chip_memory_s1 | ~(CPU_data_master_read | CPU_data_master_write) | (1 & (CPU_data_master_read | CPU_data_master_write))));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (CPU_data_master_qualified_request_push_button_switches_controller_s1 | ~CPU_data_master_requests_push_button_switches_controller_s1) & ((~CPU_data_master_qualified_request_push_button_switches_controller_s1 | ~CPU_data_master_read | (1 & ~d1_push_button_switches_controller_s1_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_push_button_switches_controller_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_red_LEDs_controller_s1 | ~CPU_data_master_requests_red_LEDs_controller_s1) & ((~CPU_data_master_qualified_request_red_LEDs_controller_s1 | ~CPU_data_master_read | (1 & ~d1_red_LEDs_controller_s1_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_red_LEDs_controller_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_seven_segment_displays_controller_s1 | ~CPU_data_master_requests_seven_segment_displays_controller_s1) & ((~CPU_data_master_qualified_request_seven_segment_displays_controller_s1 | ~CPU_data_master_read | (1 & ~d1_seven_segment_displays_controller_s1_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_seven_segment_displays_controller_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_sysid_control_slave | ~CPU_data_master_requests_sysid_control_slave) & ((~CPU_data_master_qualified_request_sysid_control_slave | ~CPU_data_master_read | (1 & ~d1_sysid_control_slave_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_sysid_control_slave | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_system_clock_timer_s1 | ~CPU_data_master_requests_system_clock_timer_s1) & ((~CPU_data_master_qualified_request_system_clock_timer_s1 | ~CPU_data_master_read | (1 & ~d1_system_clock_timer_s1_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_system_clock_timer_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write)));

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = 1 & (CPU_data_master_qualified_request_timestamp_timer_s1 | ~CPU_data_master_requests_timestamp_timer_s1) & ((~CPU_data_master_qualified_request_timestamp_timer_s1 | ~CPU_data_master_read | (1 & ~d1_timestamp_timer_s1_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_timestamp_timer_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write))) & 1 & (CPU_data_master_qualified_request_toggle_switches_controller_s1 | ~CPU_data_master_requests_toggle_switches_controller_s1) & ((~CPU_data_master_qualified_request_toggle_switches_controller_s1 | ~CPU_data_master_read | (1 & ~d1_toggle_switches_controller_s1_end_xfer & CPU_data_master_read))) & ((~CPU_data_master_qualified_request_toggle_switches_controller_s1 | ~CPU_data_master_write | (1 & CPU_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign CPU_data_master_address_to_slave = CPU_data_master_address[27 : 0];

  //CPU_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_but_no_slave_selected <= 0;
      else 
        CPU_data_master_read_but_no_slave_selected <= CPU_data_master_read & CPU_data_master_run & ~CPU_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign CPU_data_master_is_granted_some_slave = CPU_data_master_granted_CPU_jtag_debug_module |
    CPU_data_master_granted_Flash_controller_s1 |
    CPU_data_master_granted_JTAG_controller_avalon_jtag_slave |
    CPU_data_master_granted_LCD_controller_control_slave |
    CPU_data_master_granted_Lab2_SOPC_clock_0_in |
    CPU_data_master_granted_Lab2_SOPC_clock_2_in |
    CPU_data_master_granted_SSRAM_controller_s1 |
    CPU_data_master_granted_green_LEDs_controller_s1 |
    CPU_data_master_granted_on_chip_memory_s1 |
    CPU_data_master_granted_push_button_switches_controller_s1 |
    CPU_data_master_granted_red_LEDs_controller_s1 |
    CPU_data_master_granted_seven_segment_displays_controller_s1 |
    CPU_data_master_granted_sysid_control_slave |
    CPU_data_master_granted_system_clock_timer_s1 |
    CPU_data_master_granted_timestamp_timer_s1 |
    CPU_data_master_granted_toggle_switches_controller_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_CPU_data_master_readdatavalid = (CPU_data_master_read_data_valid_Flash_controller_s1 & dbs_rdv_counter_overflow) |
    CPU_data_master_read_data_valid_SSRAM_controller_s1 |
    CPU_data_master_read_data_valid_on_chip_memory_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign CPU_data_master_readdatavalid = CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_CPU_jtag_debug_module |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_LCD_controller_control_slave |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_green_LEDs_controller_s1 |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_push_button_switches_controller_s1 |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_red_LEDs_controller_s1 |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_seven_segment_displays_controller_s1 |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_sysid_control_slave |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_system_clock_timer_s1 |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_timestamp_timer_s1 |
    CPU_data_master_read_but_no_slave_selected |
    pre_flush_CPU_data_master_readdatavalid |
    CPU_data_master_read_data_valid_toggle_switches_controller_s1;

  //CPU/data_master readdata mux, which is an e_mux
  assign CPU_data_master_readdata = ({32 {~(CPU_data_master_qualified_request_CPU_jtag_debug_module & CPU_data_master_read)}} | CPU_jtag_debug_module_readdata_from_sa) &
    ({32 {~CPU_data_master_read_data_valid_Flash_controller_s1}} | {incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave & CPU_data_master_read)}} | JTAG_controller_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_LCD_controller_control_slave & CPU_data_master_read)}} | LCD_controller_control_slave_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in & CPU_data_master_read)}} | Lab2_SOPC_clock_0_in_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in & CPU_data_master_read)}} | Lab2_SOPC_clock_2_in_readdata_from_sa) &
    ({32 {~CPU_data_master_read_data_valid_SSRAM_controller_s1}} | incoming_data_to_and_from_the_SSRAM_controller) &
    ({32 {~(CPU_data_master_qualified_request_green_LEDs_controller_s1 & CPU_data_master_read)}} | green_LEDs_controller_s1_readdata_from_sa) &
    ({32 {~CPU_data_master_read_data_valid_on_chip_memory_s1}} | on_chip_memory_s1_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_push_button_switches_controller_s1 & CPU_data_master_read)}} | push_button_switches_controller_s1_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_red_LEDs_controller_s1 & CPU_data_master_read)}} | red_LEDs_controller_s1_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_seven_segment_displays_controller_s1 & CPU_data_master_read)}} | seven_segment_displays_controller_s1_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_sysid_control_slave & CPU_data_master_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_system_clock_timer_s1 & CPU_data_master_read)}} | system_clock_timer_s1_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_timestamp_timer_s1 & CPU_data_master_read)}} | timestamp_timer_s1_readdata_from_sa) &
    ({32 {~(CPU_data_master_qualified_request_toggle_switches_controller_s1 & CPU_data_master_read)}} | toggle_switches_controller_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign CPU_data_master_waitrequest = ~CPU_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_latency_counter <= 0;
      else 
        CPU_data_master_latency_counter <= p1_CPU_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_CPU_data_master_latency_counter = ((CPU_data_master_run & CPU_data_master_read))? latency_load_value :
    (CPU_data_master_latency_counter)? CPU_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({3 {CPU_data_master_requests_Flash_controller_s1}} & 2) |
    ({3 {CPU_data_master_requests_SSRAM_controller_s1}} & 4) |
    ({3 {CPU_data_master_requests_on_chip_memory_s1}} & 1);

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & CPU_data_master_requests_Flash_controller_s1 & CPU_data_master_write & !CPU_data_master_byteenable_Flash_controller_s1)) |
    ((CPU_data_master_granted_Flash_controller_s1 & CPU_data_master_read & 1 & 1 & ({Flash_controller_s1_wait_counter_eq_0 & ~d1_Flash_bridge_avalon_slave_end_xfer}))) |
    ((CPU_data_master_granted_Flash_controller_s1 & CPU_data_master_write & 1 & 1 & ({Flash_controller_s1_wait_counter_eq_0 & ~d1_Flash_bridge_avalon_slave_end_xfer})));

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((CPU_data_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign CPU_data_master_dbs_write_16 = (CPU_data_master_dbs_address[1])? CPU_data_master_writedata[31 : 16] :
    CPU_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign CPU_data_master_dbs_increment = (CPU_data_master_requests_Flash_controller_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = CPU_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = CPU_data_master_dbs_address + CPU_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          CPU_data_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign CPU_data_master_next_dbs_rdv_counter = CPU_data_master_dbs_rdv_counter + CPU_data_master_dbs_rdv_counter_inc;

  //CPU_data_master_rdv_inc_mux, which is an e_mux
  assign CPU_data_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = CPU_data_master_read_data_valid_Flash_controller_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          CPU_data_master_dbs_rdv_counter <= CPU_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = CPU_data_master_dbs_rdv_counter[1] & ~CPU_data_master_next_dbs_rdv_counter[1];

  //irq assign, which is an e_assign
  assign CPU_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    timestamp_timer_s1_irq_from_sa,
    system_clock_timer_s1_irq_from_sa,
    JTAG_controller_avalon_jtag_slave_irq_from_sa};


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_address_last_time <= 0;
      else 
        CPU_data_master_address_last_time <= CPU_data_master_address;
    end


  //CPU/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= CPU_data_master_waitrequest & (CPU_data_master_read | CPU_data_master_write);
    end


  //CPU_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_data_master_address != CPU_data_master_address_last_time))
        begin
          $write("%0d ns: CPU_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //CPU_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_byteenable_last_time <= 0;
      else 
        CPU_data_master_byteenable_last_time <= CPU_data_master_byteenable;
    end


  //CPU_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_data_master_byteenable != CPU_data_master_byteenable_last_time))
        begin
          $write("%0d ns: CPU_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //CPU_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_last_time <= 0;
      else 
        CPU_data_master_read_last_time <= CPU_data_master_read;
    end


  //CPU_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_data_master_read != CPU_data_master_read_last_time))
        begin
          $write("%0d ns: CPU_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //CPU_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_write_last_time <= 0;
      else 
        CPU_data_master_write_last_time <= CPU_data_master_write;
    end


  //CPU_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_data_master_write != CPU_data_master_write_last_time))
        begin
          $write("%0d ns: CPU_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //CPU_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_writedata_last_time <= 0;
      else 
        CPU_data_master_writedata_last_time <= CPU_data_master_writedata;
    end


  //CPU_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_data_master_writedata != CPU_data_master_writedata_last_time) & CPU_data_master_write)
        begin
          $write("%0d ns: CPU_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module CPU_instruction_master_arbitrator (
                                           // inputs:
                                            CPU_instruction_master_address,
                                            CPU_instruction_master_granted_CPU_jtag_debug_module,
                                            CPU_instruction_master_granted_Flash_controller_s1,
                                            CPU_instruction_master_granted_Lab2_SOPC_clock_1_in,
                                            CPU_instruction_master_granted_SSRAM_controller_s1,
                                            CPU_instruction_master_granted_on_chip_memory_s1,
                                            CPU_instruction_master_qualified_request_CPU_jtag_debug_module,
                                            CPU_instruction_master_qualified_request_Flash_controller_s1,
                                            CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in,
                                            CPU_instruction_master_qualified_request_SSRAM_controller_s1,
                                            CPU_instruction_master_qualified_request_on_chip_memory_s1,
                                            CPU_instruction_master_read,
                                            CPU_instruction_master_read_data_valid_CPU_jtag_debug_module,
                                            CPU_instruction_master_read_data_valid_Flash_controller_s1,
                                            CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in,
                                            CPU_instruction_master_read_data_valid_SSRAM_controller_s1,
                                            CPU_instruction_master_read_data_valid_on_chip_memory_s1,
                                            CPU_instruction_master_requests_CPU_jtag_debug_module,
                                            CPU_instruction_master_requests_Flash_controller_s1,
                                            CPU_instruction_master_requests_Lab2_SOPC_clock_1_in,
                                            CPU_instruction_master_requests_SSRAM_controller_s1,
                                            CPU_instruction_master_requests_on_chip_memory_s1,
                                            CPU_jtag_debug_module_readdata_from_sa,
                                            Flash_controller_s1_wait_counter_eq_0,
                                            Lab2_SOPC_clock_1_in_readdata_from_sa,
                                            Lab2_SOPC_clock_1_in_waitrequest_from_sa,
                                            clk,
                                            d1_CPU_jtag_debug_module_end_xfer,
                                            d1_Flash_bridge_avalon_slave_end_xfer,
                                            d1_Lab2_SOPC_clock_1_in_end_xfer,
                                            d1_SSRAM_bridge_avalon_slave_end_xfer,
                                            d1_on_chip_memory_s1_end_xfer,
                                            incoming_data_to_and_from_the_Flash_controller,
                                            incoming_data_to_and_from_the_SSRAM_controller,
                                            on_chip_memory_s1_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            CPU_instruction_master_address_to_slave,
                                            CPU_instruction_master_dbs_address,
                                            CPU_instruction_master_latency_counter,
                                            CPU_instruction_master_readdata,
                                            CPU_instruction_master_readdatavalid,
                                            CPU_instruction_master_waitrequest
                                         )
;

  output  [ 27: 0] CPU_instruction_master_address_to_slave;
  output  [  1: 0] CPU_instruction_master_dbs_address;
  output  [  2: 0] CPU_instruction_master_latency_counter;
  output  [ 31: 0] CPU_instruction_master_readdata;
  output           CPU_instruction_master_readdatavalid;
  output           CPU_instruction_master_waitrequest;
  input   [ 27: 0] CPU_instruction_master_address;
  input            CPU_instruction_master_granted_CPU_jtag_debug_module;
  input            CPU_instruction_master_granted_Flash_controller_s1;
  input            CPU_instruction_master_granted_Lab2_SOPC_clock_1_in;
  input            CPU_instruction_master_granted_SSRAM_controller_s1;
  input            CPU_instruction_master_granted_on_chip_memory_s1;
  input            CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  input            CPU_instruction_master_qualified_request_Flash_controller_s1;
  input            CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in;
  input            CPU_instruction_master_qualified_request_SSRAM_controller_s1;
  input            CPU_instruction_master_qualified_request_on_chip_memory_s1;
  input            CPU_instruction_master_read;
  input            CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  input            CPU_instruction_master_read_data_valid_Flash_controller_s1;
  input            CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in;
  input            CPU_instruction_master_read_data_valid_SSRAM_controller_s1;
  input            CPU_instruction_master_read_data_valid_on_chip_memory_s1;
  input            CPU_instruction_master_requests_CPU_jtag_debug_module;
  input            CPU_instruction_master_requests_Flash_controller_s1;
  input            CPU_instruction_master_requests_Lab2_SOPC_clock_1_in;
  input            CPU_instruction_master_requests_SSRAM_controller_s1;
  input            CPU_instruction_master_requests_on_chip_memory_s1;
  input   [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  input            Flash_controller_s1_wait_counter_eq_0;
  input   [ 31: 0] Lab2_SOPC_clock_1_in_readdata_from_sa;
  input            Lab2_SOPC_clock_1_in_waitrequest_from_sa;
  input            clk;
  input            d1_CPU_jtag_debug_module_end_xfer;
  input            d1_Flash_bridge_avalon_slave_end_xfer;
  input            d1_Lab2_SOPC_clock_1_in_end_xfer;
  input            d1_SSRAM_bridge_avalon_slave_end_xfer;
  input            d1_on_chip_memory_s1_end_xfer;
  input   [ 15: 0] incoming_data_to_and_from_the_Flash_controller;
  input   [ 31: 0] incoming_data_to_and_from_the_SSRAM_controller;
  input   [ 31: 0] on_chip_memory_s1_readdata_from_sa;
  input            reset_n;

  reg     [ 27: 0] CPU_instruction_master_address_last_time;
  wire    [ 27: 0] CPU_instruction_master_address_to_slave;
  reg     [  1: 0] CPU_instruction_master_dbs_address;
  wire    [  1: 0] CPU_instruction_master_dbs_increment;
  reg     [  1: 0] CPU_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] CPU_instruction_master_dbs_rdv_counter_inc;
  wire             CPU_instruction_master_is_granted_some_slave;
  reg     [  2: 0] CPU_instruction_master_latency_counter;
  wire    [  1: 0] CPU_instruction_master_next_dbs_rdv_counter;
  reg              CPU_instruction_master_read_but_no_slave_selected;
  reg              CPU_instruction_master_read_last_time;
  wire    [ 31: 0] CPU_instruction_master_readdata;
  wire             CPU_instruction_master_readdatavalid;
  wire             CPU_instruction_master_run;
  wire             CPU_instruction_master_waitrequest;
  reg              active_and_waiting_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  2: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  2: 0] p1_CPU_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_CPU_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (CPU_instruction_master_qualified_request_CPU_jtag_debug_module | ~CPU_instruction_master_requests_CPU_jtag_debug_module) & (CPU_instruction_master_granted_CPU_jtag_debug_module | ~CPU_instruction_master_qualified_request_CPU_jtag_debug_module) & ((~CPU_instruction_master_qualified_request_CPU_jtag_debug_module | ~CPU_instruction_master_read | (1 & ~d1_CPU_jtag_debug_module_end_xfer & CPU_instruction_master_read))) & 1 & (CPU_instruction_master_qualified_request_Flash_controller_s1 | ~CPU_instruction_master_requests_Flash_controller_s1) & (CPU_instruction_master_granted_Flash_controller_s1 | ~CPU_instruction_master_qualified_request_Flash_controller_s1) & ((~CPU_instruction_master_qualified_request_Flash_controller_s1 | ~CPU_instruction_master_read | (1 & ((Flash_controller_s1_wait_counter_eq_0 & ~d1_Flash_bridge_avalon_slave_end_xfer)) & (CPU_instruction_master_dbs_address[1]) & CPU_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign CPU_instruction_master_run = r_0 & r_1;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in | ~CPU_instruction_master_requests_Lab2_SOPC_clock_1_in) & ((~CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in | ~(CPU_instruction_master_read) | (1 & ~Lab2_SOPC_clock_1_in_waitrequest_from_sa & (CPU_instruction_master_read)))) & 1 & (CPU_instruction_master_qualified_request_SSRAM_controller_s1 | ~CPU_instruction_master_requests_SSRAM_controller_s1) & (CPU_instruction_master_granted_SSRAM_controller_s1 | ~CPU_instruction_master_qualified_request_SSRAM_controller_s1) & ((~CPU_instruction_master_qualified_request_SSRAM_controller_s1 | ~(CPU_instruction_master_read) | (1 & (CPU_instruction_master_read)))) & 1 & (CPU_instruction_master_qualified_request_on_chip_memory_s1 | ~CPU_instruction_master_requests_on_chip_memory_s1) & (CPU_instruction_master_granted_on_chip_memory_s1 | ~CPU_instruction_master_qualified_request_on_chip_memory_s1) & ((~CPU_instruction_master_qualified_request_on_chip_memory_s1 | ~(CPU_instruction_master_read) | (1 & (CPU_instruction_master_read))));

  //optimize select-logic by passing only those address bits which matter.
  assign CPU_instruction_master_address_to_slave = CPU_instruction_master_address[27 : 0];

  //CPU_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_but_no_slave_selected <= 0;
      else 
        CPU_instruction_master_read_but_no_slave_selected <= CPU_instruction_master_read & CPU_instruction_master_run & ~CPU_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign CPU_instruction_master_is_granted_some_slave = CPU_instruction_master_granted_CPU_jtag_debug_module |
    CPU_instruction_master_granted_Flash_controller_s1 |
    CPU_instruction_master_granted_Lab2_SOPC_clock_1_in |
    CPU_instruction_master_granted_SSRAM_controller_s1 |
    CPU_instruction_master_granted_on_chip_memory_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_CPU_instruction_master_readdatavalid = (CPU_instruction_master_read_data_valid_Flash_controller_s1 & dbs_rdv_counter_overflow) |
    CPU_instruction_master_read_data_valid_SSRAM_controller_s1 |
    CPU_instruction_master_read_data_valid_on_chip_memory_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign CPU_instruction_master_readdatavalid = CPU_instruction_master_read_but_no_slave_selected |
    pre_flush_CPU_instruction_master_readdatavalid |
    CPU_instruction_master_read_data_valid_CPU_jtag_debug_module |
    CPU_instruction_master_read_but_no_slave_selected |
    pre_flush_CPU_instruction_master_readdatavalid |
    CPU_instruction_master_read_but_no_slave_selected |
    pre_flush_CPU_instruction_master_readdatavalid |
    CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in |
    CPU_instruction_master_read_but_no_slave_selected |
    pre_flush_CPU_instruction_master_readdatavalid |
    CPU_instruction_master_read_but_no_slave_selected |
    pre_flush_CPU_instruction_master_readdatavalid;

  //CPU/instruction_master readdata mux, which is an e_mux
  assign CPU_instruction_master_readdata = ({32 {~(CPU_instruction_master_qualified_request_CPU_jtag_debug_module & CPU_instruction_master_read)}} | CPU_jtag_debug_module_readdata_from_sa) &
    ({32 {~CPU_instruction_master_read_data_valid_Flash_controller_s1}} | {incoming_data_to_and_from_the_Flash_controller[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in & CPU_instruction_master_read)}} | Lab2_SOPC_clock_1_in_readdata_from_sa) &
    ({32 {~CPU_instruction_master_read_data_valid_SSRAM_controller_s1}} | incoming_data_to_and_from_the_SSRAM_controller) &
    ({32 {~CPU_instruction_master_read_data_valid_on_chip_memory_s1}} | on_chip_memory_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign CPU_instruction_master_waitrequest = ~CPU_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_latency_counter <= 0;
      else 
        CPU_instruction_master_latency_counter <= p1_CPU_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_CPU_instruction_master_latency_counter = ((CPU_instruction_master_run & CPU_instruction_master_read))? latency_load_value :
    (CPU_instruction_master_latency_counter)? CPU_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({3 {CPU_instruction_master_requests_Flash_controller_s1}} & 2) |
    ({3 {CPU_instruction_master_requests_SSRAM_controller_s1}} & 4) |
    ({3 {CPU_instruction_master_requests_on_chip_memory_s1}} & 1);

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = incoming_data_to_and_from_the_Flash_controller;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((CPU_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign CPU_instruction_master_dbs_increment = (CPU_instruction_master_requests_Flash_controller_s1)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = CPU_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = CPU_instruction_master_dbs_address + CPU_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          CPU_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign CPU_instruction_master_next_dbs_rdv_counter = CPU_instruction_master_dbs_rdv_counter + CPU_instruction_master_dbs_rdv_counter_inc;

  //CPU_instruction_master_rdv_inc_mux, which is an e_mux
  assign CPU_instruction_master_dbs_rdv_counter_inc = 2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = CPU_instruction_master_read_data_valid_Flash_controller_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          CPU_instruction_master_dbs_rdv_counter <= CPU_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = CPU_instruction_master_dbs_rdv_counter[1] & ~CPU_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = CPU_instruction_master_granted_Flash_controller_s1 & CPU_instruction_master_read & 1 & 1 & ({Flash_controller_s1_wait_counter_eq_0 & ~d1_Flash_bridge_avalon_slave_end_xfer});


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //CPU_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_address_last_time <= 0;
      else 
        CPU_instruction_master_address_last_time <= CPU_instruction_master_address;
    end


  //CPU/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= CPU_instruction_master_waitrequest & (CPU_instruction_master_read);
    end


  //CPU_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_instruction_master_address != CPU_instruction_master_address_last_time))
        begin
          $write("%0d ns: CPU_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //CPU_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_last_time <= 0;
      else 
        CPU_instruction_master_read_last_time <= CPU_instruction_master_read;
    end


  //CPU_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (CPU_instruction_master_read != CPU_instruction_master_read_last_time))
        begin
          $write("%0d ns: CPU_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Flash_bridge_avalon_slave_arbitrator (
                                              // inputs:
                                               CPU_data_master_address_to_slave,
                                               CPU_data_master_byteenable,
                                               CPU_data_master_dbs_address,
                                               CPU_data_master_dbs_write_16,
                                               CPU_data_master_latency_counter,
                                               CPU_data_master_read,
                                               CPU_data_master_write,
                                               CPU_instruction_master_address_to_slave,
                                               CPU_instruction_master_dbs_address,
                                               CPU_instruction_master_latency_counter,
                                               CPU_instruction_master_read,
                                               clk,
                                               reset_n,

                                              // outputs:
                                               CPU_data_master_byteenable_Flash_controller_s1,
                                               CPU_data_master_granted_Flash_controller_s1,
                                               CPU_data_master_qualified_request_Flash_controller_s1,
                                               CPU_data_master_read_data_valid_Flash_controller_s1,
                                               CPU_data_master_requests_Flash_controller_s1,
                                               CPU_instruction_master_granted_Flash_controller_s1,
                                               CPU_instruction_master_qualified_request_Flash_controller_s1,
                                               CPU_instruction_master_read_data_valid_Flash_controller_s1,
                                               CPU_instruction_master_requests_Flash_controller_s1,
                                               Flash_controller_s1_wait_counter_eq_0,
                                               address_to_the_Flash_controller,
                                               d1_Flash_bridge_avalon_slave_end_xfer,
                                               data_to_and_from_the_Flash_controller,
                                               incoming_data_to_and_from_the_Flash_controller,
                                               incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0,
                                               read_n_to_the_Flash_controller,
                                               select_n_to_the_Flash_controller,
                                               write_n_to_the_Flash_controller
                                            )
;

  output  [  1: 0] CPU_data_master_byteenable_Flash_controller_s1;
  output           CPU_data_master_granted_Flash_controller_s1;
  output           CPU_data_master_qualified_request_Flash_controller_s1;
  output           CPU_data_master_read_data_valid_Flash_controller_s1;
  output           CPU_data_master_requests_Flash_controller_s1;
  output           CPU_instruction_master_granted_Flash_controller_s1;
  output           CPU_instruction_master_qualified_request_Flash_controller_s1;
  output           CPU_instruction_master_read_data_valid_Flash_controller_s1;
  output           CPU_instruction_master_requests_Flash_controller_s1;
  output           Flash_controller_s1_wait_counter_eq_0;
  output  [ 22: 0] address_to_the_Flash_controller;
  output           d1_Flash_bridge_avalon_slave_end_xfer;
  inout   [ 15: 0] data_to_and_from_the_Flash_controller;
  output  [ 15: 0] incoming_data_to_and_from_the_Flash_controller;
  output  [ 15: 0] incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0;
  output           read_n_to_the_Flash_controller;
  output           select_n_to_the_Flash_controller;
  output           write_n_to_the_Flash_controller;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  1: 0] CPU_data_master_dbs_address;
  input   [ 15: 0] CPU_data_master_dbs_write_16;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input   [  1: 0] CPU_instruction_master_dbs_address;
  input   [  2: 0] CPU_instruction_master_latency_counter;
  input            CPU_instruction_master_read;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire    [  1: 0] CPU_data_master_byteenable_Flash_controller_s1;
  wire    [  1: 0] CPU_data_master_byteenable_Flash_controller_s1_segment_0;
  wire    [  1: 0] CPU_data_master_byteenable_Flash_controller_s1_segment_1;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Flash_controller_s1;
  wire             CPU_data_master_qualified_request_Flash_controller_s1;
  wire             CPU_data_master_read_data_valid_Flash_controller_s1;
  reg     [  1: 0] CPU_data_master_read_data_valid_Flash_controller_s1_shift_register;
  wire             CPU_data_master_read_data_valid_Flash_controller_s1_shift_register_in;
  wire             CPU_data_master_requests_Flash_controller_s1;
  wire             CPU_data_master_saved_grant_Flash_controller_s1;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_Flash_controller_s1;
  wire             CPU_instruction_master_qualified_request_Flash_controller_s1;
  wire             CPU_instruction_master_read_data_valid_Flash_controller_s1;
  reg     [  1: 0] CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register;
  wire             CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register_in;
  wire             CPU_instruction_master_requests_Flash_controller_s1;
  wire             CPU_instruction_master_saved_grant_Flash_controller_s1;
  wire             Flash_bridge_avalon_slave_allgrants;
  wire             Flash_bridge_avalon_slave_allow_new_arb_cycle;
  wire             Flash_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             Flash_bridge_avalon_slave_any_continuerequest;
  reg     [  1: 0] Flash_bridge_avalon_slave_arb_addend;
  wire             Flash_bridge_avalon_slave_arb_counter_enable;
  reg     [  1: 0] Flash_bridge_avalon_slave_arb_share_counter;
  wire    [  1: 0] Flash_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  1: 0] Flash_bridge_avalon_slave_arb_share_set_values;
  wire    [  1: 0] Flash_bridge_avalon_slave_arb_winner;
  wire             Flash_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             Flash_bridge_avalon_slave_beginbursttransfer_internal;
  wire             Flash_bridge_avalon_slave_begins_xfer;
  wire    [  3: 0] Flash_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] Flash_bridge_avalon_slave_chosen_master_rot_left;
  wire             Flash_bridge_avalon_slave_end_xfer;
  wire             Flash_bridge_avalon_slave_firsttransfer;
  wire    [  1: 0] Flash_bridge_avalon_slave_grant_vector;
  wire    [  1: 0] Flash_bridge_avalon_slave_master_qreq_vector;
  wire             Flash_bridge_avalon_slave_non_bursting_master_requests;
  wire             Flash_bridge_avalon_slave_read_pending;
  reg              Flash_bridge_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] Flash_bridge_avalon_slave_saved_chosen_master_vector;
  reg              Flash_bridge_avalon_slave_slavearbiterlockenable;
  wire             Flash_bridge_avalon_slave_slavearbiterlockenable2;
  wire             Flash_bridge_avalon_slave_unreg_firsttransfer;
  wire             Flash_bridge_avalon_slave_write_pending;
  wire    [  3: 0] Flash_controller_s1_counter_load_value;
  wire             Flash_controller_s1_in_a_read_cycle;
  wire             Flash_controller_s1_in_a_write_cycle;
  reg     [  3: 0] Flash_controller_s1_wait_counter;
  wire             Flash_controller_s1_wait_counter_eq_0;
  wire             Flash_controller_s1_waits_for_read;
  wire             Flash_controller_s1_waits_for_write;
  wire             Flash_controller_s1_with_write_latency;
  reg     [ 22: 0] address_to_the_Flash_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_Flash_bridge_avalon_slave_end_xfer;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 15: 0] d1_outgoing_data_to_and_from_the_Flash_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  wire    [ 15: 0] data_to_and_from_the_Flash_controller;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Flash_bridge_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 15: 0] incoming_data_to_and_from_the_Flash_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_0_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_10_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_11_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_12_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_13_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_14_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_15_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_1_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_2_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_3_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_4_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_5_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_6_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_7_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_8_is_x;
  wire             incoming_data_to_and_from_the_Flash_controller_bit_9_is_x;
  wire    [ 15: 0] incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0;
  reg              last_cycle_CPU_data_master_granted_slave_Flash_controller_s1;
  reg              last_cycle_CPU_instruction_master_granted_slave_Flash_controller_s1;
  wire    [ 15: 0] outgoing_data_to_and_from_the_Flash_controller;
  wire    [  1: 0] p1_CPU_data_master_read_data_valid_Flash_controller_s1_shift_register;
  wire    [  1: 0] p1_CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register;
  wire    [ 22: 0] p1_address_to_the_Flash_controller;
  wire             p1_read_n_to_the_Flash_controller;
  wire             p1_select_n_to_the_Flash_controller;
  wire             p1_write_n_to_the_Flash_controller;
  reg              read_n_to_the_Flash_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              select_n_to_the_Flash_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             wait_for_Flash_controller_s1_counter;
  reg              write_n_to_the_Flash_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Flash_bridge_avalon_slave_end_xfer;
    end


  assign Flash_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Flash_controller_s1 | CPU_instruction_master_qualified_request_Flash_controller_s1));
  assign CPU_data_master_requests_Flash_controller_s1 = ({CPU_data_master_address_to_slave[27 : 23] , 23'b0} == 28'h8800000) & (CPU_data_master_read | CPU_data_master_write);
  //~select_n_to_the_Flash_controller of type chipselect to ~p1_select_n_to_the_Flash_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_Flash_controller <= ~0;
      else 
        select_n_to_the_Flash_controller <= p1_select_n_to_the_Flash_controller;
    end


  assign Flash_bridge_avalon_slave_write_pending = 0;
  //Flash_bridge/avalon_slave read pending calc, which is an e_assign
  assign Flash_bridge_avalon_slave_read_pending = 0;

  //Flash_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign Flash_bridge_avalon_slave_arb_share_set_values = (CPU_data_master_granted_Flash_controller_s1)? 2 :
    (CPU_instruction_master_granted_Flash_controller_s1)? 2 :
    (CPU_data_master_granted_Flash_controller_s1)? 2 :
    (CPU_instruction_master_granted_Flash_controller_s1)? 2 :
    1;

  //Flash_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign Flash_bridge_avalon_slave_non_bursting_master_requests = CPU_data_master_requests_Flash_controller_s1 |
    CPU_instruction_master_requests_Flash_controller_s1 |
    CPU_data_master_requests_Flash_controller_s1 |
    CPU_instruction_master_requests_Flash_controller_s1;

  //Flash_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign Flash_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //Flash_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign Flash_bridge_avalon_slave_arb_share_counter_next_value = Flash_bridge_avalon_slave_firsttransfer ? (Flash_bridge_avalon_slave_arb_share_set_values - 1) : |Flash_bridge_avalon_slave_arb_share_counter ? (Flash_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //Flash_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign Flash_bridge_avalon_slave_allgrants = (|Flash_bridge_avalon_slave_grant_vector) |
    (|Flash_bridge_avalon_slave_grant_vector) |
    (|Flash_bridge_avalon_slave_grant_vector) |
    (|Flash_bridge_avalon_slave_grant_vector);

  //Flash_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign Flash_bridge_avalon_slave_end_xfer = ~(Flash_controller_s1_waits_for_read | Flash_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_Flash_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Flash_bridge_avalon_slave = Flash_bridge_avalon_slave_end_xfer & (~Flash_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Flash_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign Flash_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_Flash_bridge_avalon_slave & Flash_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_Flash_bridge_avalon_slave & ~Flash_bridge_avalon_slave_non_bursting_master_requests);

  //Flash_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Flash_bridge_avalon_slave_arb_share_counter <= 0;
      else if (Flash_bridge_avalon_slave_arb_counter_enable)
          Flash_bridge_avalon_slave_arb_share_counter <= Flash_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //Flash_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Flash_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|Flash_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_Flash_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_Flash_bridge_avalon_slave & ~Flash_bridge_avalon_slave_non_bursting_master_requests))
          Flash_bridge_avalon_slave_slavearbiterlockenable <= |Flash_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //CPU/data_master Flash_bridge/avalon_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Flash_bridge_avalon_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Flash_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Flash_bridge_avalon_slave_slavearbiterlockenable2 = |Flash_bridge_avalon_slave_arb_share_counter_next_value;

  //CPU/data_master Flash_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Flash_bridge_avalon_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master Flash_bridge/avalon_slave arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = Flash_bridge_avalon_slave_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master Flash_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = Flash_bridge_avalon_slave_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted Flash_controller/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_Flash_controller_s1 <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_Flash_controller_s1 <= CPU_instruction_master_saved_grant_Flash_controller_s1 ? 1 : (Flash_bridge_avalon_slave_arbitration_holdoff_internal | ~CPU_instruction_master_requests_Flash_controller_s1) ? 0 : last_cycle_CPU_instruction_master_granted_slave_Flash_controller_s1;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_Flash_controller_s1 & CPU_instruction_master_requests_Flash_controller_s1;

  //Flash_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign Flash_bridge_avalon_slave_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_Flash_controller_s1 = CPU_data_master_requests_Flash_controller_s1 & ~((CPU_data_master_read & (Flash_bridge_avalon_slave_write_pending | (Flash_bridge_avalon_slave_read_pending) | (2 < CPU_data_master_latency_counter))) | ((Flash_bridge_avalon_slave_read_pending | !CPU_data_master_byteenable_Flash_controller_s1) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //CPU_data_master_read_data_valid_Flash_controller_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_Flash_controller_s1_shift_register_in = CPU_data_master_granted_Flash_controller_s1 & CPU_data_master_read & ~Flash_controller_s1_waits_for_read;

  //shift register p1 CPU_data_master_read_data_valid_Flash_controller_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_Flash_controller_s1_shift_register = {CPU_data_master_read_data_valid_Flash_controller_s1_shift_register, CPU_data_master_read_data_valid_Flash_controller_s1_shift_register_in};

  //CPU_data_master_read_data_valid_Flash_controller_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_Flash_controller_s1_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_Flash_controller_s1_shift_register <= p1_CPU_data_master_read_data_valid_Flash_controller_s1_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_Flash_controller_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_Flash_controller_s1 = CPU_data_master_read_data_valid_Flash_controller_s1_shift_register[1];

  //data_to_and_from_the_Flash_controller register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_data_to_and_from_the_Flash_controller <= 0;
      else 
        incoming_data_to_and_from_the_Flash_controller <= data_to_and_from_the_Flash_controller;
    end


  //Flash_controller_s1_with_write_latency assignment, which is an e_assign
  assign Flash_controller_s1_with_write_latency = in_a_write_cycle & (CPU_data_master_qualified_request_Flash_controller_s1 | CPU_instruction_master_qualified_request_Flash_controller_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (Flash_controller_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_Flash_controller register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_Flash_controller <= 0;
      else 
        d1_outgoing_data_to_and_from_the_Flash_controller <= outgoing_data_to_and_from_the_Flash_controller;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_Flash_controller tristate driver, which is an e_assign
  assign data_to_and_from_the_Flash_controller = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_Flash_controller:{16{1'bz}};

  //outgoing_data_to_and_from_the_Flash_controller mux, which is an e_mux
  assign outgoing_data_to_and_from_the_Flash_controller = CPU_data_master_dbs_write_16;

  assign CPU_instruction_master_requests_Flash_controller_s1 = (({CPU_instruction_master_address_to_slave[27 : 23] , 23'b0} == 28'h8800000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted Flash_controller/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_Flash_controller_s1 <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_Flash_controller_s1 <= CPU_data_master_saved_grant_Flash_controller_s1 ? 1 : (Flash_bridge_avalon_slave_arbitration_holdoff_internal | ~CPU_data_master_requests_Flash_controller_s1) ? 0 : last_cycle_CPU_data_master_granted_slave_Flash_controller_s1;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_Flash_controller_s1 & CPU_data_master_requests_Flash_controller_s1;

  assign CPU_instruction_master_qualified_request_Flash_controller_s1 = CPU_instruction_master_requests_Flash_controller_s1 & ~((CPU_instruction_master_read & (Flash_bridge_avalon_slave_write_pending | (Flash_bridge_avalon_slave_read_pending) | (2 < CPU_instruction_master_latency_counter))) | CPU_data_master_arbiterlock);
  //CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register_in = CPU_instruction_master_granted_Flash_controller_s1 & CPU_instruction_master_read & ~Flash_controller_s1_waits_for_read;

  //shift register p1 CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register = {CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register, CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register_in};

  //CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register <= 0;
      else 
        CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register <= p1_CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register;
    end


  //local readdatavalid CPU_instruction_master_read_data_valid_Flash_controller_s1, which is an e_mux
  assign CPU_instruction_master_read_data_valid_Flash_controller_s1 = CPU_instruction_master_read_data_valid_Flash_controller_s1_shift_register[1];

  //allow new arb cycle for Flash_bridge/avalon_slave, which is an e_assign
  assign Flash_bridge_avalon_slave_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for Flash_controller/s1, which is an e_assign
  assign Flash_bridge_avalon_slave_master_qreq_vector[0] = CPU_instruction_master_qualified_request_Flash_controller_s1;

  //CPU/instruction_master grant Flash_controller/s1, which is an e_assign
  assign CPU_instruction_master_granted_Flash_controller_s1 = Flash_bridge_avalon_slave_grant_vector[0];

  //CPU/instruction_master saved-grant Flash_controller/s1, which is an e_assign
  assign CPU_instruction_master_saved_grant_Flash_controller_s1 = Flash_bridge_avalon_slave_arb_winner[0] && CPU_instruction_master_requests_Flash_controller_s1;

  //CPU/data_master assignment into master qualified-requests vector for Flash_controller/s1, which is an e_assign
  assign Flash_bridge_avalon_slave_master_qreq_vector[1] = CPU_data_master_qualified_request_Flash_controller_s1;

  //CPU/data_master grant Flash_controller/s1, which is an e_assign
  assign CPU_data_master_granted_Flash_controller_s1 = Flash_bridge_avalon_slave_grant_vector[1];

  //CPU/data_master saved-grant Flash_controller/s1, which is an e_assign
  assign CPU_data_master_saved_grant_Flash_controller_s1 = Flash_bridge_avalon_slave_arb_winner[1] && CPU_data_master_requests_Flash_controller_s1;

  //Flash_bridge/avalon_slave chosen-master double-vector, which is an e_assign
  assign Flash_bridge_avalon_slave_chosen_master_double_vector = {Flash_bridge_avalon_slave_master_qreq_vector, Flash_bridge_avalon_slave_master_qreq_vector} & ({~Flash_bridge_avalon_slave_master_qreq_vector, ~Flash_bridge_avalon_slave_master_qreq_vector} + Flash_bridge_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign Flash_bridge_avalon_slave_arb_winner = (Flash_bridge_avalon_slave_allow_new_arb_cycle & | Flash_bridge_avalon_slave_grant_vector) ? Flash_bridge_avalon_slave_grant_vector : Flash_bridge_avalon_slave_saved_chosen_master_vector;

  //saved Flash_bridge_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Flash_bridge_avalon_slave_saved_chosen_master_vector <= 0;
      else if (Flash_bridge_avalon_slave_allow_new_arb_cycle)
          Flash_bridge_avalon_slave_saved_chosen_master_vector <= |Flash_bridge_avalon_slave_grant_vector ? Flash_bridge_avalon_slave_grant_vector : Flash_bridge_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign Flash_bridge_avalon_slave_grant_vector = {(Flash_bridge_avalon_slave_chosen_master_double_vector[1] | Flash_bridge_avalon_slave_chosen_master_double_vector[3]),
    (Flash_bridge_avalon_slave_chosen_master_double_vector[0] | Flash_bridge_avalon_slave_chosen_master_double_vector[2])};

  //Flash_bridge/avalon_slave chosen master rotated left, which is an e_assign
  assign Flash_bridge_avalon_slave_chosen_master_rot_left = (Flash_bridge_avalon_slave_arb_winner << 1) ? (Flash_bridge_avalon_slave_arb_winner << 1) : 1;

  //Flash_bridge/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Flash_bridge_avalon_slave_arb_addend <= 1;
      else if (|Flash_bridge_avalon_slave_grant_vector)
          Flash_bridge_avalon_slave_arb_addend <= Flash_bridge_avalon_slave_end_xfer? Flash_bridge_avalon_slave_chosen_master_rot_left : Flash_bridge_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_Flash_controller = ~(CPU_data_master_granted_Flash_controller_s1 | CPU_instruction_master_granted_Flash_controller_s1);
  //Flash_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign Flash_bridge_avalon_slave_firsttransfer = Flash_bridge_avalon_slave_begins_xfer ? Flash_bridge_avalon_slave_unreg_firsttransfer : Flash_bridge_avalon_slave_reg_firsttransfer;

  //Flash_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign Flash_bridge_avalon_slave_unreg_firsttransfer = ~(Flash_bridge_avalon_slave_slavearbiterlockenable & Flash_bridge_avalon_slave_any_continuerequest);

  //Flash_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Flash_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (Flash_bridge_avalon_slave_begins_xfer)
          Flash_bridge_avalon_slave_reg_firsttransfer <= Flash_bridge_avalon_slave_unreg_firsttransfer;
    end


  //Flash_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Flash_bridge_avalon_slave_beginbursttransfer_internal = Flash_bridge_avalon_slave_begins_xfer;

  //Flash_bridge_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign Flash_bridge_avalon_slave_arbitration_holdoff_internal = Flash_bridge_avalon_slave_begins_xfer & Flash_bridge_avalon_slave_firsttransfer;

  //~read_n_to_the_Flash_controller of type read to ~p1_read_n_to_the_Flash_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_Flash_controller <= ~0;
      else 
        read_n_to_the_Flash_controller <= p1_read_n_to_the_Flash_controller;
    end


  //~p1_read_n_to_the_Flash_controller assignment, which is an e_mux
  assign p1_read_n_to_the_Flash_controller = ~((CPU_data_master_granted_Flash_controller_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_Flash_controller_s1 & CPU_instruction_master_read));

  //~write_n_to_the_Flash_controller of type write to ~p1_write_n_to_the_Flash_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_Flash_controller <= ~0;
      else 
        write_n_to_the_Flash_controller <= p1_write_n_to_the_Flash_controller;
    end


  //~p1_write_n_to_the_Flash_controller assignment, which is an e_mux
  assign p1_write_n_to_the_Flash_controller = ~(CPU_data_master_granted_Flash_controller_s1 & CPU_data_master_write);

  //address_to_the_Flash_controller of type address to p1_address_to_the_Flash_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_Flash_controller <= 0;
      else 
        address_to_the_Flash_controller <= p1_address_to_the_Flash_controller;
    end


  //p1_address_to_the_Flash_controller mux, which is an e_mux
  assign p1_address_to_the_Flash_controller = (CPU_data_master_granted_Flash_controller_s1)? ({CPU_data_master_address_to_slave >> 2,
    CPU_data_master_dbs_address[1],
    {1 {1'b0}}}) :
    ({CPU_instruction_master_address_to_slave >> 2,
    CPU_instruction_master_dbs_address[1],
    {1 {1'b0}}});

  //d1_Flash_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Flash_bridge_avalon_slave_end_xfer <= 1;
      else 
        d1_Flash_bridge_avalon_slave_end_xfer <= Flash_bridge_avalon_slave_end_xfer;
    end


  //Flash_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign Flash_controller_s1_waits_for_read = Flash_controller_s1_in_a_read_cycle & wait_for_Flash_controller_s1_counter;

  //Flash_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign Flash_controller_s1_in_a_read_cycle = (CPU_data_master_granted_Flash_controller_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_Flash_controller_s1 & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Flash_controller_s1_in_a_read_cycle;

  //Flash_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign Flash_controller_s1_waits_for_write = Flash_controller_s1_in_a_write_cycle & wait_for_Flash_controller_s1_counter;

  //Flash_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign Flash_controller_s1_in_a_write_cycle = CPU_data_master_granted_Flash_controller_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Flash_controller_s1_in_a_write_cycle;

  assign Flash_controller_s1_wait_counter_eq_0 = Flash_controller_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Flash_controller_s1_wait_counter <= 0;
      else 
        Flash_controller_s1_wait_counter <= Flash_controller_s1_counter_load_value;
    end


  assign Flash_controller_s1_counter_load_value = ((Flash_controller_s1_in_a_write_cycle & Flash_bridge_avalon_slave_begins_xfer))? 8 :
    ((Flash_controller_s1_in_a_read_cycle & Flash_bridge_avalon_slave_begins_xfer))? 8 :
    (~Flash_controller_s1_wait_counter_eq_0)? Flash_controller_s1_wait_counter - 1 :
    0;

  assign wait_for_Flash_controller_s1_counter = Flash_bridge_avalon_slave_begins_xfer | ~Flash_controller_s1_wait_counter_eq_0;
  assign {CPU_data_master_byteenable_Flash_controller_s1_segment_1,
CPU_data_master_byteenable_Flash_controller_s1_segment_0} = CPU_data_master_byteenable;
  assign CPU_data_master_byteenable_Flash_controller_s1 = ((CPU_data_master_dbs_address[1] == 0))? CPU_data_master_byteenable_Flash_controller_s1_segment_0 :
    CPU_data_master_byteenable_Flash_controller_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_data_to_and_from_the_Flash_controller_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_0_is_x = ^(incoming_data_to_and_from_the_Flash_controller[0]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[0] = incoming_data_to_and_from_the_Flash_controller_bit_0_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[0];

  //incoming_data_to_and_from_the_Flash_controller_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_1_is_x = ^(incoming_data_to_and_from_the_Flash_controller[1]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[1] = incoming_data_to_and_from_the_Flash_controller_bit_1_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[1];

  //incoming_data_to_and_from_the_Flash_controller_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_2_is_x = ^(incoming_data_to_and_from_the_Flash_controller[2]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[2] = incoming_data_to_and_from_the_Flash_controller_bit_2_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[2];

  //incoming_data_to_and_from_the_Flash_controller_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_3_is_x = ^(incoming_data_to_and_from_the_Flash_controller[3]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[3] = incoming_data_to_and_from_the_Flash_controller_bit_3_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[3];

  //incoming_data_to_and_from_the_Flash_controller_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_4_is_x = ^(incoming_data_to_and_from_the_Flash_controller[4]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[4] = incoming_data_to_and_from_the_Flash_controller_bit_4_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[4];

  //incoming_data_to_and_from_the_Flash_controller_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_5_is_x = ^(incoming_data_to_and_from_the_Flash_controller[5]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[5] = incoming_data_to_and_from_the_Flash_controller_bit_5_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[5];

  //incoming_data_to_and_from_the_Flash_controller_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_6_is_x = ^(incoming_data_to_and_from_the_Flash_controller[6]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[6] = incoming_data_to_and_from_the_Flash_controller_bit_6_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[6];

  //incoming_data_to_and_from_the_Flash_controller_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_7_is_x = ^(incoming_data_to_and_from_the_Flash_controller[7]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[7] = incoming_data_to_and_from_the_Flash_controller_bit_7_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[7];

  //incoming_data_to_and_from_the_Flash_controller_bit_8_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_8_is_x = ^(incoming_data_to_and_from_the_Flash_controller[8]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[8] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[8] = incoming_data_to_and_from_the_Flash_controller_bit_8_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[8];

  //incoming_data_to_and_from_the_Flash_controller_bit_9_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_9_is_x = ^(incoming_data_to_and_from_the_Flash_controller[9]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[9] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[9] = incoming_data_to_and_from_the_Flash_controller_bit_9_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[9];

  //incoming_data_to_and_from_the_Flash_controller_bit_10_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_10_is_x = ^(incoming_data_to_and_from_the_Flash_controller[10]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[10] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[10] = incoming_data_to_and_from_the_Flash_controller_bit_10_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[10];

  //incoming_data_to_and_from_the_Flash_controller_bit_11_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_11_is_x = ^(incoming_data_to_and_from_the_Flash_controller[11]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[11] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[11] = incoming_data_to_and_from_the_Flash_controller_bit_11_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[11];

  //incoming_data_to_and_from_the_Flash_controller_bit_12_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_12_is_x = ^(incoming_data_to_and_from_the_Flash_controller[12]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[12] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[12] = incoming_data_to_and_from_the_Flash_controller_bit_12_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[12];

  //incoming_data_to_and_from_the_Flash_controller_bit_13_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_13_is_x = ^(incoming_data_to_and_from_the_Flash_controller[13]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[13] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[13] = incoming_data_to_and_from_the_Flash_controller_bit_13_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[13];

  //incoming_data_to_and_from_the_Flash_controller_bit_14_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_14_is_x = ^(incoming_data_to_and_from_the_Flash_controller[14]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[14] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[14] = incoming_data_to_and_from_the_Flash_controller_bit_14_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[14];

  //incoming_data_to_and_from_the_Flash_controller_bit_15_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_Flash_controller_bit_15_is_x = ^(incoming_data_to_and_from_the_Flash_controller[15]) === 1'bx;

  //Crush incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[15] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0[15] = incoming_data_to_and_from_the_Flash_controller_bit_15_is_x ? 1'b0 : incoming_data_to_and_from_the_Flash_controller[15];

  //Flash_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_granted_Flash_controller_s1 + CPU_instruction_master_granted_Flash_controller_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_Flash_controller_s1 + CPU_instruction_master_saved_grant_Flash_controller_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0 = incoming_data_to_and_from_the_Flash_controller;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Flash_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module JTAG_controller_avalon_jtag_slave_arbitrator (
                                                      // inputs:
                                                       CPU_data_master_address_to_slave,
                                                       CPU_data_master_latency_counter,
                                                       CPU_data_master_read,
                                                       CPU_data_master_write,
                                                       CPU_data_master_writedata,
                                                       JTAG_controller_avalon_jtag_slave_dataavailable,
                                                       JTAG_controller_avalon_jtag_slave_irq,
                                                       JTAG_controller_avalon_jtag_slave_readdata,
                                                       JTAG_controller_avalon_jtag_slave_readyfordata,
                                                       JTAG_controller_avalon_jtag_slave_waitrequest,
                                                       clk,
                                                       reset_n,

                                                      // outputs:
                                                       CPU_data_master_granted_JTAG_controller_avalon_jtag_slave,
                                                       CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave,
                                                       CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave,
                                                       CPU_data_master_requests_JTAG_controller_avalon_jtag_slave,
                                                       JTAG_controller_avalon_jtag_slave_address,
                                                       JTAG_controller_avalon_jtag_slave_chipselect,
                                                       JTAG_controller_avalon_jtag_slave_dataavailable_from_sa,
                                                       JTAG_controller_avalon_jtag_slave_irq_from_sa,
                                                       JTAG_controller_avalon_jtag_slave_read_n,
                                                       JTAG_controller_avalon_jtag_slave_readdata_from_sa,
                                                       JTAG_controller_avalon_jtag_slave_readyfordata_from_sa,
                                                       JTAG_controller_avalon_jtag_slave_reset_n,
                                                       JTAG_controller_avalon_jtag_slave_waitrequest_from_sa,
                                                       JTAG_controller_avalon_jtag_slave_write_n,
                                                       JTAG_controller_avalon_jtag_slave_writedata,
                                                       d1_JTAG_controller_avalon_jtag_slave_end_xfer
                                                    )
;

  output           CPU_data_master_granted_JTAG_controller_avalon_jtag_slave;
  output           CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave;
  output           CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave;
  output           CPU_data_master_requests_JTAG_controller_avalon_jtag_slave;
  output           JTAG_controller_avalon_jtag_slave_address;
  output           JTAG_controller_avalon_jtag_slave_chipselect;
  output           JTAG_controller_avalon_jtag_slave_dataavailable_from_sa;
  output           JTAG_controller_avalon_jtag_slave_irq_from_sa;
  output           JTAG_controller_avalon_jtag_slave_read_n;
  output  [ 31: 0] JTAG_controller_avalon_jtag_slave_readdata_from_sa;
  output           JTAG_controller_avalon_jtag_slave_readyfordata_from_sa;
  output           JTAG_controller_avalon_jtag_slave_reset_n;
  output           JTAG_controller_avalon_jtag_slave_waitrequest_from_sa;
  output           JTAG_controller_avalon_jtag_slave_write_n;
  output  [ 31: 0] JTAG_controller_avalon_jtag_slave_writedata;
  output           d1_JTAG_controller_avalon_jtag_slave_end_xfer;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            JTAG_controller_avalon_jtag_slave_dataavailable;
  input            JTAG_controller_avalon_jtag_slave_irq;
  input   [ 31: 0] JTAG_controller_avalon_jtag_slave_readdata;
  input            JTAG_controller_avalon_jtag_slave_readyfordata;
  input            JTAG_controller_avalon_jtag_slave_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_JTAG_controller_avalon_jtag_slave;
  wire             CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave;
  wire             CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave;
  wire             CPU_data_master_requests_JTAG_controller_avalon_jtag_slave;
  wire             CPU_data_master_saved_grant_JTAG_controller_avalon_jtag_slave;
  wire             JTAG_controller_avalon_jtag_slave_address;
  wire             JTAG_controller_avalon_jtag_slave_allgrants;
  wire             JTAG_controller_avalon_jtag_slave_allow_new_arb_cycle;
  wire             JTAG_controller_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             JTAG_controller_avalon_jtag_slave_any_continuerequest;
  wire             JTAG_controller_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] JTAG_controller_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] JTAG_controller_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] JTAG_controller_avalon_jtag_slave_arb_share_set_values;
  wire             JTAG_controller_avalon_jtag_slave_beginbursttransfer_internal;
  wire             JTAG_controller_avalon_jtag_slave_begins_xfer;
  wire             JTAG_controller_avalon_jtag_slave_chipselect;
  wire             JTAG_controller_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_end_xfer;
  wire             JTAG_controller_avalon_jtag_slave_firsttransfer;
  wire             JTAG_controller_avalon_jtag_slave_grant_vector;
  wire             JTAG_controller_avalon_jtag_slave_in_a_read_cycle;
  wire             JTAG_controller_avalon_jtag_slave_in_a_write_cycle;
  wire             JTAG_controller_avalon_jtag_slave_irq_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_master_qreq_vector;
  wire             JTAG_controller_avalon_jtag_slave_non_bursting_master_requests;
  wire             JTAG_controller_avalon_jtag_slave_read_n;
  wire    [ 31: 0] JTAG_controller_avalon_jtag_slave_readdata_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_readyfordata_from_sa;
  reg              JTAG_controller_avalon_jtag_slave_reg_firsttransfer;
  wire             JTAG_controller_avalon_jtag_slave_reset_n;
  reg              JTAG_controller_avalon_jtag_slave_slavearbiterlockenable;
  wire             JTAG_controller_avalon_jtag_slave_slavearbiterlockenable2;
  wire             JTAG_controller_avalon_jtag_slave_unreg_firsttransfer;
  wire             JTAG_controller_avalon_jtag_slave_waitrequest_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_waits_for_read;
  wire             JTAG_controller_avalon_jtag_slave_waits_for_write;
  wire             JTAG_controller_avalon_jtag_slave_write_n;
  wire    [ 31: 0] JTAG_controller_avalon_jtag_slave_writedata;
  reg              d1_JTAG_controller_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_JTAG_controller_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_JTAG_controller_avalon_jtag_slave_from_CPU_data_master;
  wire             wait_for_JTAG_controller_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~JTAG_controller_avalon_jtag_slave_end_xfer;
    end


  assign JTAG_controller_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave));
  //assign JTAG_controller_avalon_jtag_slave_readdata_from_sa = JTAG_controller_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_readdata_from_sa = JTAG_controller_avalon_jtag_slave_readdata;

  assign CPU_data_master_requests_JTAG_controller_avalon_jtag_slave = ({CPU_data_master_address_to_slave[27 : 3] , 3'b0} == 28'h94110c0) & (CPU_data_master_read | CPU_data_master_write);
  //assign JTAG_controller_avalon_jtag_slave_dataavailable_from_sa = JTAG_controller_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_dataavailable_from_sa = JTAG_controller_avalon_jtag_slave_dataavailable;

  //assign JTAG_controller_avalon_jtag_slave_readyfordata_from_sa = JTAG_controller_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_readyfordata_from_sa = JTAG_controller_avalon_jtag_slave_readyfordata;

  //assign JTAG_controller_avalon_jtag_slave_waitrequest_from_sa = JTAG_controller_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_waitrequest_from_sa = JTAG_controller_avalon_jtag_slave_waitrequest;

  //JTAG_controller_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_arb_share_set_values = 1;

  //JTAG_controller_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_non_bursting_master_requests = CPU_data_master_requests_JTAG_controller_avalon_jtag_slave;

  //JTAG_controller_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //JTAG_controller_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_arb_share_counter_next_value = JTAG_controller_avalon_jtag_slave_firsttransfer ? (JTAG_controller_avalon_jtag_slave_arb_share_set_values - 1) : |JTAG_controller_avalon_jtag_slave_arb_share_counter ? (JTAG_controller_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //JTAG_controller_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_allgrants = |JTAG_controller_avalon_jtag_slave_grant_vector;

  //JTAG_controller_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_end_xfer = ~(JTAG_controller_avalon_jtag_slave_waits_for_read | JTAG_controller_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_JTAG_controller_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_JTAG_controller_avalon_jtag_slave = JTAG_controller_avalon_jtag_slave_end_xfer & (~JTAG_controller_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //JTAG_controller_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_JTAG_controller_avalon_jtag_slave & JTAG_controller_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_JTAG_controller_avalon_jtag_slave & ~JTAG_controller_avalon_jtag_slave_non_bursting_master_requests);

  //JTAG_controller_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_controller_avalon_jtag_slave_arb_share_counter <= 0;
      else if (JTAG_controller_avalon_jtag_slave_arb_counter_enable)
          JTAG_controller_avalon_jtag_slave_arb_share_counter <= JTAG_controller_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //JTAG_controller_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_controller_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|JTAG_controller_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_JTAG_controller_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_JTAG_controller_avalon_jtag_slave & ~JTAG_controller_avalon_jtag_slave_non_bursting_master_requests))
          JTAG_controller_avalon_jtag_slave_slavearbiterlockenable <= |JTAG_controller_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //CPU/data_master JTAG_controller/avalon_jtag_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = JTAG_controller_avalon_jtag_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //JTAG_controller_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_slavearbiterlockenable2 = |JTAG_controller_avalon_jtag_slave_arb_share_counter_next_value;

  //CPU/data_master JTAG_controller/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = JTAG_controller_avalon_jtag_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //JTAG_controller_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave = CPU_data_master_requests_JTAG_controller_avalon_jtag_slave & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave = CPU_data_master_granted_JTAG_controller_avalon_jtag_slave & CPU_data_master_read & ~JTAG_controller_avalon_jtag_slave_waits_for_read;

  //JTAG_controller_avalon_jtag_slave_writedata mux, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_JTAG_controller_avalon_jtag_slave = CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave;

  //CPU/data_master saved-grant JTAG_controller/avalon_jtag_slave, which is an e_assign
  assign CPU_data_master_saved_grant_JTAG_controller_avalon_jtag_slave = CPU_data_master_requests_JTAG_controller_avalon_jtag_slave;

  //allow new arb cycle for JTAG_controller/avalon_jtag_slave, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign JTAG_controller_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign JTAG_controller_avalon_jtag_slave_master_qreq_vector = 1;

  //JTAG_controller_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_reset_n = reset_n;

  assign JTAG_controller_avalon_jtag_slave_chipselect = CPU_data_master_granted_JTAG_controller_avalon_jtag_slave;
  //JTAG_controller_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_firsttransfer = JTAG_controller_avalon_jtag_slave_begins_xfer ? JTAG_controller_avalon_jtag_slave_unreg_firsttransfer : JTAG_controller_avalon_jtag_slave_reg_firsttransfer;

  //JTAG_controller_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_unreg_firsttransfer = ~(JTAG_controller_avalon_jtag_slave_slavearbiterlockenable & JTAG_controller_avalon_jtag_slave_any_continuerequest);

  //JTAG_controller_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          JTAG_controller_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (JTAG_controller_avalon_jtag_slave_begins_xfer)
          JTAG_controller_avalon_jtag_slave_reg_firsttransfer <= JTAG_controller_avalon_jtag_slave_unreg_firsttransfer;
    end


  //JTAG_controller_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_beginbursttransfer_internal = JTAG_controller_avalon_jtag_slave_begins_xfer;

  //~JTAG_controller_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_read_n = ~(CPU_data_master_granted_JTAG_controller_avalon_jtag_slave & CPU_data_master_read);

  //~JTAG_controller_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_write_n = ~(CPU_data_master_granted_JTAG_controller_avalon_jtag_slave & CPU_data_master_write);

  assign shifted_address_to_JTAG_controller_avalon_jtag_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //JTAG_controller_avalon_jtag_slave_address mux, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_address = shifted_address_to_JTAG_controller_avalon_jtag_slave_from_CPU_data_master >> 2;

  //d1_JTAG_controller_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_JTAG_controller_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_JTAG_controller_avalon_jtag_slave_end_xfer <= JTAG_controller_avalon_jtag_slave_end_xfer;
    end


  //JTAG_controller_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_waits_for_read = JTAG_controller_avalon_jtag_slave_in_a_read_cycle & JTAG_controller_avalon_jtag_slave_waitrequest_from_sa;

  //JTAG_controller_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_in_a_read_cycle = CPU_data_master_granted_JTAG_controller_avalon_jtag_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = JTAG_controller_avalon_jtag_slave_in_a_read_cycle;

  //JTAG_controller_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign JTAG_controller_avalon_jtag_slave_waits_for_write = JTAG_controller_avalon_jtag_slave_in_a_write_cycle & JTAG_controller_avalon_jtag_slave_waitrequest_from_sa;

  //JTAG_controller_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_in_a_write_cycle = CPU_data_master_granted_JTAG_controller_avalon_jtag_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = JTAG_controller_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_JTAG_controller_avalon_jtag_slave_counter = 0;
  //assign JTAG_controller_avalon_jtag_slave_irq_from_sa = JTAG_controller_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign JTAG_controller_avalon_jtag_slave_irq_from_sa = JTAG_controller_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //JTAG_controller/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module LCD_controller_control_slave_arbitrator (
                                                 // inputs:
                                                  CPU_data_master_address_to_slave,
                                                  CPU_data_master_byteenable,
                                                  CPU_data_master_latency_counter,
                                                  CPU_data_master_read,
                                                  CPU_data_master_write,
                                                  CPU_data_master_writedata,
                                                  LCD_controller_control_slave_readdata,
                                                  clk,
                                                  reset_n,

                                                 // outputs:
                                                  CPU_data_master_granted_LCD_controller_control_slave,
                                                  CPU_data_master_qualified_request_LCD_controller_control_slave,
                                                  CPU_data_master_read_data_valid_LCD_controller_control_slave,
                                                  CPU_data_master_requests_LCD_controller_control_slave,
                                                  LCD_controller_control_slave_address,
                                                  LCD_controller_control_slave_begintransfer,
                                                  LCD_controller_control_slave_read,
                                                  LCD_controller_control_slave_readdata_from_sa,
                                                  LCD_controller_control_slave_wait_counter_eq_0,
                                                  LCD_controller_control_slave_write,
                                                  LCD_controller_control_slave_writedata,
                                                  d1_LCD_controller_control_slave_end_xfer
                                               )
;

  output           CPU_data_master_granted_LCD_controller_control_slave;
  output           CPU_data_master_qualified_request_LCD_controller_control_slave;
  output           CPU_data_master_read_data_valid_LCD_controller_control_slave;
  output           CPU_data_master_requests_LCD_controller_control_slave;
  output  [  1: 0] LCD_controller_control_slave_address;
  output           LCD_controller_control_slave_begintransfer;
  output           LCD_controller_control_slave_read;
  output  [  7: 0] LCD_controller_control_slave_readdata_from_sa;
  output           LCD_controller_control_slave_wait_counter_eq_0;
  output           LCD_controller_control_slave_write;
  output  [  7: 0] LCD_controller_control_slave_writedata;
  output           d1_LCD_controller_control_slave_end_xfer;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [  7: 0] LCD_controller_control_slave_readdata;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_LCD_controller_control_slave;
  wire             CPU_data_master_qualified_request_LCD_controller_control_slave;
  wire             CPU_data_master_read_data_valid_LCD_controller_control_slave;
  wire             CPU_data_master_requests_LCD_controller_control_slave;
  wire             CPU_data_master_saved_grant_LCD_controller_control_slave;
  wire    [  1: 0] LCD_controller_control_slave_address;
  wire             LCD_controller_control_slave_allgrants;
  wire             LCD_controller_control_slave_allow_new_arb_cycle;
  wire             LCD_controller_control_slave_any_bursting_master_saved_grant;
  wire             LCD_controller_control_slave_any_continuerequest;
  wire             LCD_controller_control_slave_arb_counter_enable;
  reg     [  1: 0] LCD_controller_control_slave_arb_share_counter;
  wire    [  1: 0] LCD_controller_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] LCD_controller_control_slave_arb_share_set_values;
  wire             LCD_controller_control_slave_beginbursttransfer_internal;
  wire             LCD_controller_control_slave_begins_xfer;
  wire             LCD_controller_control_slave_begintransfer;
  wire    [  6: 0] LCD_controller_control_slave_counter_load_value;
  wire             LCD_controller_control_slave_end_xfer;
  wire             LCD_controller_control_slave_firsttransfer;
  wire             LCD_controller_control_slave_grant_vector;
  wire             LCD_controller_control_slave_in_a_read_cycle;
  wire             LCD_controller_control_slave_in_a_write_cycle;
  wire             LCD_controller_control_slave_master_qreq_vector;
  wire             LCD_controller_control_slave_non_bursting_master_requests;
  wire             LCD_controller_control_slave_pretend_byte_enable;
  wire             LCD_controller_control_slave_read;
  wire    [  7: 0] LCD_controller_control_slave_readdata_from_sa;
  reg              LCD_controller_control_slave_reg_firsttransfer;
  reg              LCD_controller_control_slave_slavearbiterlockenable;
  wire             LCD_controller_control_slave_slavearbiterlockenable2;
  wire             LCD_controller_control_slave_unreg_firsttransfer;
  reg     [  6: 0] LCD_controller_control_slave_wait_counter;
  wire             LCD_controller_control_slave_wait_counter_eq_0;
  wire             LCD_controller_control_slave_waits_for_read;
  wire             LCD_controller_control_slave_waits_for_write;
  wire             LCD_controller_control_slave_write;
  wire    [  7: 0] LCD_controller_control_slave_writedata;
  reg              d1_LCD_controller_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_LCD_controller_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_LCD_controller_control_slave_from_CPU_data_master;
  wire             wait_for_LCD_controller_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~LCD_controller_control_slave_end_xfer;
    end


  assign LCD_controller_control_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_LCD_controller_control_slave));
  //assign LCD_controller_control_slave_readdata_from_sa = LCD_controller_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign LCD_controller_control_slave_readdata_from_sa = LCD_controller_control_slave_readdata;

  assign CPU_data_master_requests_LCD_controller_control_slave = ({CPU_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h9411070) & (CPU_data_master_read | CPU_data_master_write);
  //LCD_controller_control_slave_arb_share_counter set values, which is an e_mux
  assign LCD_controller_control_slave_arb_share_set_values = 1;

  //LCD_controller_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign LCD_controller_control_slave_non_bursting_master_requests = CPU_data_master_requests_LCD_controller_control_slave;

  //LCD_controller_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign LCD_controller_control_slave_any_bursting_master_saved_grant = 0;

  //LCD_controller_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign LCD_controller_control_slave_arb_share_counter_next_value = LCD_controller_control_slave_firsttransfer ? (LCD_controller_control_slave_arb_share_set_values - 1) : |LCD_controller_control_slave_arb_share_counter ? (LCD_controller_control_slave_arb_share_counter - 1) : 0;

  //LCD_controller_control_slave_allgrants all slave grants, which is an e_mux
  assign LCD_controller_control_slave_allgrants = |LCD_controller_control_slave_grant_vector;

  //LCD_controller_control_slave_end_xfer assignment, which is an e_assign
  assign LCD_controller_control_slave_end_xfer = ~(LCD_controller_control_slave_waits_for_read | LCD_controller_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_LCD_controller_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_LCD_controller_control_slave = LCD_controller_control_slave_end_xfer & (~LCD_controller_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //LCD_controller_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign LCD_controller_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_LCD_controller_control_slave & LCD_controller_control_slave_allgrants) | (end_xfer_arb_share_counter_term_LCD_controller_control_slave & ~LCD_controller_control_slave_non_bursting_master_requests);

  //LCD_controller_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LCD_controller_control_slave_arb_share_counter <= 0;
      else if (LCD_controller_control_slave_arb_counter_enable)
          LCD_controller_control_slave_arb_share_counter <= LCD_controller_control_slave_arb_share_counter_next_value;
    end


  //LCD_controller_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LCD_controller_control_slave_slavearbiterlockenable <= 0;
      else if ((|LCD_controller_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_LCD_controller_control_slave) | (end_xfer_arb_share_counter_term_LCD_controller_control_slave & ~LCD_controller_control_slave_non_bursting_master_requests))
          LCD_controller_control_slave_slavearbiterlockenable <= |LCD_controller_control_slave_arb_share_counter_next_value;
    end


  //CPU/data_master LCD_controller/control_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = LCD_controller_control_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //LCD_controller_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign LCD_controller_control_slave_slavearbiterlockenable2 = |LCD_controller_control_slave_arb_share_counter_next_value;

  //CPU/data_master LCD_controller/control_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = LCD_controller_control_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //LCD_controller_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign LCD_controller_control_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_LCD_controller_control_slave = CPU_data_master_requests_LCD_controller_control_slave & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_LCD_controller_control_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_LCD_controller_control_slave = CPU_data_master_granted_LCD_controller_control_slave & CPU_data_master_read & ~LCD_controller_control_slave_waits_for_read;

  //LCD_controller_control_slave_writedata mux, which is an e_mux
  assign LCD_controller_control_slave_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_LCD_controller_control_slave = CPU_data_master_qualified_request_LCD_controller_control_slave;

  //CPU/data_master saved-grant LCD_controller/control_slave, which is an e_assign
  assign CPU_data_master_saved_grant_LCD_controller_control_slave = CPU_data_master_requests_LCD_controller_control_slave;

  //allow new arb cycle for LCD_controller/control_slave, which is an e_assign
  assign LCD_controller_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign LCD_controller_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign LCD_controller_control_slave_master_qreq_vector = 1;

  assign LCD_controller_control_slave_begintransfer = LCD_controller_control_slave_begins_xfer;
  //LCD_controller_control_slave_firsttransfer first transaction, which is an e_assign
  assign LCD_controller_control_slave_firsttransfer = LCD_controller_control_slave_begins_xfer ? LCD_controller_control_slave_unreg_firsttransfer : LCD_controller_control_slave_reg_firsttransfer;

  //LCD_controller_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign LCD_controller_control_slave_unreg_firsttransfer = ~(LCD_controller_control_slave_slavearbiterlockenable & LCD_controller_control_slave_any_continuerequest);

  //LCD_controller_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LCD_controller_control_slave_reg_firsttransfer <= 1'b1;
      else if (LCD_controller_control_slave_begins_xfer)
          LCD_controller_control_slave_reg_firsttransfer <= LCD_controller_control_slave_unreg_firsttransfer;
    end


  //LCD_controller_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign LCD_controller_control_slave_beginbursttransfer_internal = LCD_controller_control_slave_begins_xfer;

  //LCD_controller_control_slave_read assignment, which is an e_mux
  assign LCD_controller_control_slave_read = ((CPU_data_master_granted_LCD_controller_control_slave & CPU_data_master_read))& ~LCD_controller_control_slave_begins_xfer & (LCD_controller_control_slave_wait_counter < 25);

  //LCD_controller_control_slave_write assignment, which is an e_mux
  assign LCD_controller_control_slave_write = ((CPU_data_master_granted_LCD_controller_control_slave & CPU_data_master_write)) & ~LCD_controller_control_slave_begins_xfer & (LCD_controller_control_slave_wait_counter >= 25) & (LCD_controller_control_slave_wait_counter < 50) & LCD_controller_control_slave_pretend_byte_enable;

  assign shifted_address_to_LCD_controller_control_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //LCD_controller_control_slave_address mux, which is an e_mux
  assign LCD_controller_control_slave_address = shifted_address_to_LCD_controller_control_slave_from_CPU_data_master >> 2;

  //d1_LCD_controller_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_LCD_controller_control_slave_end_xfer <= 1;
      else 
        d1_LCD_controller_control_slave_end_xfer <= LCD_controller_control_slave_end_xfer;
    end


  //LCD_controller_control_slave_waits_for_read in a cycle, which is an e_mux
  assign LCD_controller_control_slave_waits_for_read = LCD_controller_control_slave_in_a_read_cycle & wait_for_LCD_controller_control_slave_counter;

  //LCD_controller_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign LCD_controller_control_slave_in_a_read_cycle = CPU_data_master_granted_LCD_controller_control_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = LCD_controller_control_slave_in_a_read_cycle;

  //LCD_controller_control_slave_waits_for_write in a cycle, which is an e_mux
  assign LCD_controller_control_slave_waits_for_write = LCD_controller_control_slave_in_a_write_cycle & wait_for_LCD_controller_control_slave_counter;

  //LCD_controller_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign LCD_controller_control_slave_in_a_write_cycle = CPU_data_master_granted_LCD_controller_control_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = LCD_controller_control_slave_in_a_write_cycle;

  assign LCD_controller_control_slave_wait_counter_eq_0 = LCD_controller_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          LCD_controller_control_slave_wait_counter <= 0;
      else 
        LCD_controller_control_slave_wait_counter <= LCD_controller_control_slave_counter_load_value;
    end


  assign LCD_controller_control_slave_counter_load_value = ((LCD_controller_control_slave_in_a_write_cycle & LCD_controller_control_slave_begins_xfer))? 73 :
    ((LCD_controller_control_slave_in_a_read_cycle & LCD_controller_control_slave_begins_xfer))? 48 :
    (~LCD_controller_control_slave_wait_counter_eq_0)? LCD_controller_control_slave_wait_counter - 1 :
    0;

  assign wait_for_LCD_controller_control_slave_counter = LCD_controller_control_slave_begins_xfer | ~LCD_controller_control_slave_wait_counter_eq_0;
  //LCD_controller_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign LCD_controller_control_slave_pretend_byte_enable = (CPU_data_master_granted_LCD_controller_control_slave)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //LCD_controller/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_clock_0_in_arbitrator (
                                         // inputs:
                                          CPU_data_master_address_to_slave,
                                          CPU_data_master_byteenable,
                                          CPU_data_master_latency_counter,
                                          CPU_data_master_read,
                                          CPU_data_master_write,
                                          CPU_data_master_writedata,
                                          Lab2_SOPC_clock_0_in_endofpacket,
                                          Lab2_SOPC_clock_0_in_readdata,
                                          Lab2_SOPC_clock_0_in_waitrequest,
                                          clk,
                                          reset_n,

                                         // outputs:
                                          CPU_data_master_granted_Lab2_SOPC_clock_0_in,
                                          CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in,
                                          CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in,
                                          CPU_data_master_requests_Lab2_SOPC_clock_0_in,
                                          Lab2_SOPC_clock_0_in_address,
                                          Lab2_SOPC_clock_0_in_byteenable,
                                          Lab2_SOPC_clock_0_in_endofpacket_from_sa,
                                          Lab2_SOPC_clock_0_in_nativeaddress,
                                          Lab2_SOPC_clock_0_in_read,
                                          Lab2_SOPC_clock_0_in_readdata_from_sa,
                                          Lab2_SOPC_clock_0_in_reset_n,
                                          Lab2_SOPC_clock_0_in_waitrequest_from_sa,
                                          Lab2_SOPC_clock_0_in_write,
                                          Lab2_SOPC_clock_0_in_writedata,
                                          d1_Lab2_SOPC_clock_0_in_end_xfer
                                       )
;

  output           CPU_data_master_granted_Lab2_SOPC_clock_0_in;
  output           CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in;
  output           CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in;
  output           CPU_data_master_requests_Lab2_SOPC_clock_0_in;
  output  [  3: 0] Lab2_SOPC_clock_0_in_address;
  output  [  3: 0] Lab2_SOPC_clock_0_in_byteenable;
  output           Lab2_SOPC_clock_0_in_endofpacket_from_sa;
  output  [  1: 0] Lab2_SOPC_clock_0_in_nativeaddress;
  output           Lab2_SOPC_clock_0_in_read;
  output  [ 31: 0] Lab2_SOPC_clock_0_in_readdata_from_sa;
  output           Lab2_SOPC_clock_0_in_reset_n;
  output           Lab2_SOPC_clock_0_in_waitrequest_from_sa;
  output           Lab2_SOPC_clock_0_in_write;
  output  [ 31: 0] Lab2_SOPC_clock_0_in_writedata;
  output           d1_Lab2_SOPC_clock_0_in_end_xfer;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Lab2_SOPC_clock_0_in_endofpacket;
  input   [ 31: 0] Lab2_SOPC_clock_0_in_readdata;
  input            Lab2_SOPC_clock_0_in_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Lab2_SOPC_clock_0_in;
  wire             CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in;
  wire             CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in;
  wire             CPU_data_master_requests_Lab2_SOPC_clock_0_in;
  wire             CPU_data_master_saved_grant_Lab2_SOPC_clock_0_in;
  wire    [  3: 0] Lab2_SOPC_clock_0_in_address;
  wire             Lab2_SOPC_clock_0_in_allgrants;
  wire             Lab2_SOPC_clock_0_in_allow_new_arb_cycle;
  wire             Lab2_SOPC_clock_0_in_any_bursting_master_saved_grant;
  wire             Lab2_SOPC_clock_0_in_any_continuerequest;
  wire             Lab2_SOPC_clock_0_in_arb_counter_enable;
  reg     [  1: 0] Lab2_SOPC_clock_0_in_arb_share_counter;
  wire    [  1: 0] Lab2_SOPC_clock_0_in_arb_share_counter_next_value;
  wire    [  1: 0] Lab2_SOPC_clock_0_in_arb_share_set_values;
  wire             Lab2_SOPC_clock_0_in_beginbursttransfer_internal;
  wire             Lab2_SOPC_clock_0_in_begins_xfer;
  wire    [  3: 0] Lab2_SOPC_clock_0_in_byteenable;
  wire             Lab2_SOPC_clock_0_in_end_xfer;
  wire             Lab2_SOPC_clock_0_in_endofpacket_from_sa;
  wire             Lab2_SOPC_clock_0_in_firsttransfer;
  wire             Lab2_SOPC_clock_0_in_grant_vector;
  wire             Lab2_SOPC_clock_0_in_in_a_read_cycle;
  wire             Lab2_SOPC_clock_0_in_in_a_write_cycle;
  wire             Lab2_SOPC_clock_0_in_master_qreq_vector;
  wire    [  1: 0] Lab2_SOPC_clock_0_in_nativeaddress;
  wire             Lab2_SOPC_clock_0_in_non_bursting_master_requests;
  wire             Lab2_SOPC_clock_0_in_read;
  wire    [ 31: 0] Lab2_SOPC_clock_0_in_readdata_from_sa;
  reg              Lab2_SOPC_clock_0_in_reg_firsttransfer;
  wire             Lab2_SOPC_clock_0_in_reset_n;
  reg              Lab2_SOPC_clock_0_in_slavearbiterlockenable;
  wire             Lab2_SOPC_clock_0_in_slavearbiterlockenable2;
  wire             Lab2_SOPC_clock_0_in_unreg_firsttransfer;
  wire             Lab2_SOPC_clock_0_in_waitrequest_from_sa;
  wire             Lab2_SOPC_clock_0_in_waits_for_read;
  wire             Lab2_SOPC_clock_0_in_waits_for_write;
  wire             Lab2_SOPC_clock_0_in_write;
  wire    [ 31: 0] Lab2_SOPC_clock_0_in_writedata;
  reg              d1_Lab2_SOPC_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Lab2_SOPC_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Lab2_SOPC_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Lab2_SOPC_clock_0_in_end_xfer;
    end


  assign Lab2_SOPC_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in));
  //assign Lab2_SOPC_clock_0_in_readdata_from_sa = Lab2_SOPC_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_0_in_readdata_from_sa = Lab2_SOPC_clock_0_in_readdata;

  assign CPU_data_master_requests_Lab2_SOPC_clock_0_in = ({CPU_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h9411060) & (CPU_data_master_read | CPU_data_master_write);
  //assign Lab2_SOPC_clock_0_in_waitrequest_from_sa = Lab2_SOPC_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_0_in_waitrequest_from_sa = Lab2_SOPC_clock_0_in_waitrequest;

  //Lab2_SOPC_clock_0_in_arb_share_counter set values, which is an e_mux
  assign Lab2_SOPC_clock_0_in_arb_share_set_values = 1;

  //Lab2_SOPC_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign Lab2_SOPC_clock_0_in_non_bursting_master_requests = CPU_data_master_requests_Lab2_SOPC_clock_0_in;

  //Lab2_SOPC_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Lab2_SOPC_clock_0_in_any_bursting_master_saved_grant = 0;

  //Lab2_SOPC_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Lab2_SOPC_clock_0_in_arb_share_counter_next_value = Lab2_SOPC_clock_0_in_firsttransfer ? (Lab2_SOPC_clock_0_in_arb_share_set_values - 1) : |Lab2_SOPC_clock_0_in_arb_share_counter ? (Lab2_SOPC_clock_0_in_arb_share_counter - 1) : 0;

  //Lab2_SOPC_clock_0_in_allgrants all slave grants, which is an e_mux
  assign Lab2_SOPC_clock_0_in_allgrants = |Lab2_SOPC_clock_0_in_grant_vector;

  //Lab2_SOPC_clock_0_in_end_xfer assignment, which is an e_assign
  assign Lab2_SOPC_clock_0_in_end_xfer = ~(Lab2_SOPC_clock_0_in_waits_for_read | Lab2_SOPC_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Lab2_SOPC_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Lab2_SOPC_clock_0_in = Lab2_SOPC_clock_0_in_end_xfer & (~Lab2_SOPC_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Lab2_SOPC_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Lab2_SOPC_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_0_in & Lab2_SOPC_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_0_in & ~Lab2_SOPC_clock_0_in_non_bursting_master_requests);

  //Lab2_SOPC_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_0_in_arb_share_counter <= 0;
      else if (Lab2_SOPC_clock_0_in_arb_counter_enable)
          Lab2_SOPC_clock_0_in_arb_share_counter <= Lab2_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //Lab2_SOPC_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|Lab2_SOPC_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_Lab2_SOPC_clock_0_in) | (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_0_in & ~Lab2_SOPC_clock_0_in_non_bursting_master_requests))
          Lab2_SOPC_clock_0_in_slavearbiterlockenable <= |Lab2_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //CPU/data_master Lab2_SOPC_clock_0/in arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Lab2_SOPC_clock_0_in_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Lab2_SOPC_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Lab2_SOPC_clock_0_in_slavearbiterlockenable2 = |Lab2_SOPC_clock_0_in_arb_share_counter_next_value;

  //CPU/data_master Lab2_SOPC_clock_0/in arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Lab2_SOPC_clock_0_in_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Lab2_SOPC_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Lab2_SOPC_clock_0_in_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in = CPU_data_master_requests_Lab2_SOPC_clock_0_in & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in, which is an e_mux
  assign CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in = CPU_data_master_granted_Lab2_SOPC_clock_0_in & CPU_data_master_read & ~Lab2_SOPC_clock_0_in_waits_for_read;

  //Lab2_SOPC_clock_0_in_writedata mux, which is an e_mux
  assign Lab2_SOPC_clock_0_in_writedata = CPU_data_master_writedata;

  //assign Lab2_SOPC_clock_0_in_endofpacket_from_sa = Lab2_SOPC_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_0_in_endofpacket_from_sa = Lab2_SOPC_clock_0_in_endofpacket;

  //master is always granted when requested
  assign CPU_data_master_granted_Lab2_SOPC_clock_0_in = CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in;

  //CPU/data_master saved-grant Lab2_SOPC_clock_0/in, which is an e_assign
  assign CPU_data_master_saved_grant_Lab2_SOPC_clock_0_in = CPU_data_master_requests_Lab2_SOPC_clock_0_in;

  //allow new arb cycle for Lab2_SOPC_clock_0/in, which is an e_assign
  assign Lab2_SOPC_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Lab2_SOPC_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Lab2_SOPC_clock_0_in_master_qreq_vector = 1;

  //Lab2_SOPC_clock_0_in_reset_n assignment, which is an e_assign
  assign Lab2_SOPC_clock_0_in_reset_n = reset_n;

  //Lab2_SOPC_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign Lab2_SOPC_clock_0_in_firsttransfer = Lab2_SOPC_clock_0_in_begins_xfer ? Lab2_SOPC_clock_0_in_unreg_firsttransfer : Lab2_SOPC_clock_0_in_reg_firsttransfer;

  //Lab2_SOPC_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Lab2_SOPC_clock_0_in_unreg_firsttransfer = ~(Lab2_SOPC_clock_0_in_slavearbiterlockenable & Lab2_SOPC_clock_0_in_any_continuerequest);

  //Lab2_SOPC_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (Lab2_SOPC_clock_0_in_begins_xfer)
          Lab2_SOPC_clock_0_in_reg_firsttransfer <= Lab2_SOPC_clock_0_in_unreg_firsttransfer;
    end


  //Lab2_SOPC_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Lab2_SOPC_clock_0_in_beginbursttransfer_internal = Lab2_SOPC_clock_0_in_begins_xfer;

  //Lab2_SOPC_clock_0_in_read assignment, which is an e_mux
  assign Lab2_SOPC_clock_0_in_read = CPU_data_master_granted_Lab2_SOPC_clock_0_in & CPU_data_master_read;

  //Lab2_SOPC_clock_0_in_write assignment, which is an e_mux
  assign Lab2_SOPC_clock_0_in_write = CPU_data_master_granted_Lab2_SOPC_clock_0_in & CPU_data_master_write;

  //Lab2_SOPC_clock_0_in_address mux, which is an e_mux
  assign Lab2_SOPC_clock_0_in_address = CPU_data_master_address_to_slave;

  //slaveid Lab2_SOPC_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Lab2_SOPC_clock_0_in_nativeaddress = CPU_data_master_address_to_slave >> 2;

  //d1_Lab2_SOPC_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Lab2_SOPC_clock_0_in_end_xfer <= 1;
      else 
        d1_Lab2_SOPC_clock_0_in_end_xfer <= Lab2_SOPC_clock_0_in_end_xfer;
    end


  //Lab2_SOPC_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign Lab2_SOPC_clock_0_in_waits_for_read = Lab2_SOPC_clock_0_in_in_a_read_cycle & Lab2_SOPC_clock_0_in_waitrequest_from_sa;

  //Lab2_SOPC_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign Lab2_SOPC_clock_0_in_in_a_read_cycle = CPU_data_master_granted_Lab2_SOPC_clock_0_in & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Lab2_SOPC_clock_0_in_in_a_read_cycle;

  //Lab2_SOPC_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign Lab2_SOPC_clock_0_in_waits_for_write = Lab2_SOPC_clock_0_in_in_a_write_cycle & Lab2_SOPC_clock_0_in_waitrequest_from_sa;

  //Lab2_SOPC_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign Lab2_SOPC_clock_0_in_in_a_write_cycle = CPU_data_master_granted_Lab2_SOPC_clock_0_in & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Lab2_SOPC_clock_0_in_in_a_write_cycle;

  assign wait_for_Lab2_SOPC_clock_0_in_counter = 0;
  //Lab2_SOPC_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign Lab2_SOPC_clock_0_in_byteenable = (CPU_data_master_granted_Lab2_SOPC_clock_0_in)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Lab2_SOPC_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_clock_0_out_arbitrator (
                                          // inputs:
                                           Lab2_SOPC_clock_0_out_address,
                                           Lab2_SOPC_clock_0_out_byteenable,
                                           Lab2_SOPC_clock_0_out_granted_PLL_pll_slave,
                                           Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave,
                                           Lab2_SOPC_clock_0_out_read,
                                           Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave,
                                           Lab2_SOPC_clock_0_out_requests_PLL_pll_slave,
                                           Lab2_SOPC_clock_0_out_write,
                                           Lab2_SOPC_clock_0_out_writedata,
                                           PLL_pll_slave_readdata_from_sa,
                                           clk,
                                           d1_PLL_pll_slave_end_xfer,
                                           reset_n,

                                          // outputs:
                                           Lab2_SOPC_clock_0_out_address_to_slave,
                                           Lab2_SOPC_clock_0_out_readdata,
                                           Lab2_SOPC_clock_0_out_reset_n,
                                           Lab2_SOPC_clock_0_out_waitrequest
                                        )
;

  output  [  3: 0] Lab2_SOPC_clock_0_out_address_to_slave;
  output  [ 31: 0] Lab2_SOPC_clock_0_out_readdata;
  output           Lab2_SOPC_clock_0_out_reset_n;
  output           Lab2_SOPC_clock_0_out_waitrequest;
  input   [  3: 0] Lab2_SOPC_clock_0_out_address;
  input   [  3: 0] Lab2_SOPC_clock_0_out_byteenable;
  input            Lab2_SOPC_clock_0_out_granted_PLL_pll_slave;
  input            Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave;
  input            Lab2_SOPC_clock_0_out_read;
  input            Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave;
  input            Lab2_SOPC_clock_0_out_requests_PLL_pll_slave;
  input            Lab2_SOPC_clock_0_out_write;
  input   [ 31: 0] Lab2_SOPC_clock_0_out_writedata;
  input   [ 31: 0] PLL_pll_slave_readdata_from_sa;
  input            clk;
  input            d1_PLL_pll_slave_end_xfer;
  input            reset_n;

  reg     [  3: 0] Lab2_SOPC_clock_0_out_address_last_time;
  wire    [  3: 0] Lab2_SOPC_clock_0_out_address_to_slave;
  reg     [  3: 0] Lab2_SOPC_clock_0_out_byteenable_last_time;
  reg              Lab2_SOPC_clock_0_out_read_last_time;
  wire    [ 31: 0] Lab2_SOPC_clock_0_out_readdata;
  wire             Lab2_SOPC_clock_0_out_reset_n;
  wire             Lab2_SOPC_clock_0_out_run;
  wire             Lab2_SOPC_clock_0_out_waitrequest;
  reg              Lab2_SOPC_clock_0_out_write_last_time;
  reg     [ 31: 0] Lab2_SOPC_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave | ~(Lab2_SOPC_clock_0_out_read | Lab2_SOPC_clock_0_out_write) | (1 & (Lab2_SOPC_clock_0_out_read | Lab2_SOPC_clock_0_out_write)))) & ((~Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave | ~(Lab2_SOPC_clock_0_out_read | Lab2_SOPC_clock_0_out_write) | (1 & (Lab2_SOPC_clock_0_out_read | Lab2_SOPC_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Lab2_SOPC_clock_0_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign Lab2_SOPC_clock_0_out_address_to_slave = Lab2_SOPC_clock_0_out_address;

  //Lab2_SOPC_clock_0/out readdata mux, which is an e_mux
  assign Lab2_SOPC_clock_0_out_readdata = PLL_pll_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Lab2_SOPC_clock_0_out_waitrequest = ~Lab2_SOPC_clock_0_out_run;

  //Lab2_SOPC_clock_0_out_reset_n assignment, which is an e_assign
  assign Lab2_SOPC_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Lab2_SOPC_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_0_out_address_last_time <= 0;
      else 
        Lab2_SOPC_clock_0_out_address_last_time <= Lab2_SOPC_clock_0_out_address;
    end


  //Lab2_SOPC_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Lab2_SOPC_clock_0_out_waitrequest & (Lab2_SOPC_clock_0_out_read | Lab2_SOPC_clock_0_out_write);
    end


  //Lab2_SOPC_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_0_out_address != Lab2_SOPC_clock_0_out_address_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_0_out_byteenable_last_time <= 0;
      else 
        Lab2_SOPC_clock_0_out_byteenable_last_time <= Lab2_SOPC_clock_0_out_byteenable;
    end


  //Lab2_SOPC_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_0_out_byteenable != Lab2_SOPC_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_0_out_read_last_time <= 0;
      else 
        Lab2_SOPC_clock_0_out_read_last_time <= Lab2_SOPC_clock_0_out_read;
    end


  //Lab2_SOPC_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_0_out_read != Lab2_SOPC_clock_0_out_read_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_0_out_write_last_time <= 0;
      else 
        Lab2_SOPC_clock_0_out_write_last_time <= Lab2_SOPC_clock_0_out_write;
    end


  //Lab2_SOPC_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_0_out_write != Lab2_SOPC_clock_0_out_write_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_0_out_writedata_last_time <= 0;
      else 
        Lab2_SOPC_clock_0_out_writedata_last_time <= Lab2_SOPC_clock_0_out_writedata;
    end


  //Lab2_SOPC_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_0_out_writedata != Lab2_SOPC_clock_0_out_writedata_last_time) & Lab2_SOPC_clock_0_out_write)
        begin
          $write("%0d ns: Lab2_SOPC_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_clock_1_in_arbitrator (
                                         // inputs:
                                          CPU_instruction_master_address_to_slave,
                                          CPU_instruction_master_latency_counter,
                                          CPU_instruction_master_read,
                                          Lab2_SOPC_clock_1_in_endofpacket,
                                          Lab2_SOPC_clock_1_in_readdata,
                                          Lab2_SOPC_clock_1_in_waitrequest,
                                          clk,
                                          reset_n,

                                         // outputs:
                                          CPU_instruction_master_granted_Lab2_SOPC_clock_1_in,
                                          CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in,
                                          CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in,
                                          CPU_instruction_master_requests_Lab2_SOPC_clock_1_in,
                                          Lab2_SOPC_clock_1_in_address,
                                          Lab2_SOPC_clock_1_in_byteenable,
                                          Lab2_SOPC_clock_1_in_endofpacket_from_sa,
                                          Lab2_SOPC_clock_1_in_nativeaddress,
                                          Lab2_SOPC_clock_1_in_read,
                                          Lab2_SOPC_clock_1_in_readdata_from_sa,
                                          Lab2_SOPC_clock_1_in_reset_n,
                                          Lab2_SOPC_clock_1_in_waitrequest_from_sa,
                                          Lab2_SOPC_clock_1_in_write,
                                          d1_Lab2_SOPC_clock_1_in_end_xfer
                                       )
;

  output           CPU_instruction_master_granted_Lab2_SOPC_clock_1_in;
  output           CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in;
  output           CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in;
  output           CPU_instruction_master_requests_Lab2_SOPC_clock_1_in;
  output  [ 25: 0] Lab2_SOPC_clock_1_in_address;
  output  [  3: 0] Lab2_SOPC_clock_1_in_byteenable;
  output           Lab2_SOPC_clock_1_in_endofpacket_from_sa;
  output  [ 23: 0] Lab2_SOPC_clock_1_in_nativeaddress;
  output           Lab2_SOPC_clock_1_in_read;
  output  [ 31: 0] Lab2_SOPC_clock_1_in_readdata_from_sa;
  output           Lab2_SOPC_clock_1_in_reset_n;
  output           Lab2_SOPC_clock_1_in_waitrequest_from_sa;
  output           Lab2_SOPC_clock_1_in_write;
  output           d1_Lab2_SOPC_clock_1_in_end_xfer;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input   [  2: 0] CPU_instruction_master_latency_counter;
  input            CPU_instruction_master_read;
  input            Lab2_SOPC_clock_1_in_endofpacket;
  input   [ 31: 0] Lab2_SOPC_clock_1_in_readdata;
  input            Lab2_SOPC_clock_1_in_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_Lab2_SOPC_clock_1_in;
  wire             CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in;
  wire             CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in;
  wire             CPU_instruction_master_requests_Lab2_SOPC_clock_1_in;
  wire             CPU_instruction_master_saved_grant_Lab2_SOPC_clock_1_in;
  wire    [ 25: 0] Lab2_SOPC_clock_1_in_address;
  wire             Lab2_SOPC_clock_1_in_allgrants;
  wire             Lab2_SOPC_clock_1_in_allow_new_arb_cycle;
  wire             Lab2_SOPC_clock_1_in_any_bursting_master_saved_grant;
  wire             Lab2_SOPC_clock_1_in_any_continuerequest;
  wire             Lab2_SOPC_clock_1_in_arb_counter_enable;
  reg     [  1: 0] Lab2_SOPC_clock_1_in_arb_share_counter;
  wire    [  1: 0] Lab2_SOPC_clock_1_in_arb_share_counter_next_value;
  wire    [  1: 0] Lab2_SOPC_clock_1_in_arb_share_set_values;
  wire             Lab2_SOPC_clock_1_in_beginbursttransfer_internal;
  wire             Lab2_SOPC_clock_1_in_begins_xfer;
  wire    [  3: 0] Lab2_SOPC_clock_1_in_byteenable;
  wire             Lab2_SOPC_clock_1_in_end_xfer;
  wire             Lab2_SOPC_clock_1_in_endofpacket_from_sa;
  wire             Lab2_SOPC_clock_1_in_firsttransfer;
  wire             Lab2_SOPC_clock_1_in_grant_vector;
  wire             Lab2_SOPC_clock_1_in_in_a_read_cycle;
  wire             Lab2_SOPC_clock_1_in_in_a_write_cycle;
  wire             Lab2_SOPC_clock_1_in_master_qreq_vector;
  wire    [ 23: 0] Lab2_SOPC_clock_1_in_nativeaddress;
  wire             Lab2_SOPC_clock_1_in_non_bursting_master_requests;
  wire             Lab2_SOPC_clock_1_in_read;
  wire    [ 31: 0] Lab2_SOPC_clock_1_in_readdata_from_sa;
  reg              Lab2_SOPC_clock_1_in_reg_firsttransfer;
  wire             Lab2_SOPC_clock_1_in_reset_n;
  reg              Lab2_SOPC_clock_1_in_slavearbiterlockenable;
  wire             Lab2_SOPC_clock_1_in_slavearbiterlockenable2;
  wire             Lab2_SOPC_clock_1_in_unreg_firsttransfer;
  wire             Lab2_SOPC_clock_1_in_waitrequest_from_sa;
  wire             Lab2_SOPC_clock_1_in_waits_for_read;
  wire             Lab2_SOPC_clock_1_in_waits_for_write;
  wire             Lab2_SOPC_clock_1_in_write;
  reg              d1_Lab2_SOPC_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Lab2_SOPC_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Lab2_SOPC_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Lab2_SOPC_clock_1_in_end_xfer;
    end


  assign Lab2_SOPC_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in));
  //assign Lab2_SOPC_clock_1_in_readdata_from_sa = Lab2_SOPC_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_1_in_readdata_from_sa = Lab2_SOPC_clock_1_in_readdata;

  assign CPU_instruction_master_requests_Lab2_SOPC_clock_1_in = (({CPU_instruction_master_address_to_slave[27 : 26] , 26'b0} == 28'h4000000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //assign Lab2_SOPC_clock_1_in_waitrequest_from_sa = Lab2_SOPC_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_1_in_waitrequest_from_sa = Lab2_SOPC_clock_1_in_waitrequest;

  //Lab2_SOPC_clock_1_in_arb_share_counter set values, which is an e_mux
  assign Lab2_SOPC_clock_1_in_arb_share_set_values = 1;

  //Lab2_SOPC_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign Lab2_SOPC_clock_1_in_non_bursting_master_requests = CPU_instruction_master_requests_Lab2_SOPC_clock_1_in;

  //Lab2_SOPC_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Lab2_SOPC_clock_1_in_any_bursting_master_saved_grant = 0;

  //Lab2_SOPC_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Lab2_SOPC_clock_1_in_arb_share_counter_next_value = Lab2_SOPC_clock_1_in_firsttransfer ? (Lab2_SOPC_clock_1_in_arb_share_set_values - 1) : |Lab2_SOPC_clock_1_in_arb_share_counter ? (Lab2_SOPC_clock_1_in_arb_share_counter - 1) : 0;

  //Lab2_SOPC_clock_1_in_allgrants all slave grants, which is an e_mux
  assign Lab2_SOPC_clock_1_in_allgrants = |Lab2_SOPC_clock_1_in_grant_vector;

  //Lab2_SOPC_clock_1_in_end_xfer assignment, which is an e_assign
  assign Lab2_SOPC_clock_1_in_end_xfer = ~(Lab2_SOPC_clock_1_in_waits_for_read | Lab2_SOPC_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Lab2_SOPC_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Lab2_SOPC_clock_1_in = Lab2_SOPC_clock_1_in_end_xfer & (~Lab2_SOPC_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Lab2_SOPC_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Lab2_SOPC_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_1_in & Lab2_SOPC_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_1_in & ~Lab2_SOPC_clock_1_in_non_bursting_master_requests);

  //Lab2_SOPC_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_1_in_arb_share_counter <= 0;
      else if (Lab2_SOPC_clock_1_in_arb_counter_enable)
          Lab2_SOPC_clock_1_in_arb_share_counter <= Lab2_SOPC_clock_1_in_arb_share_counter_next_value;
    end


  //Lab2_SOPC_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|Lab2_SOPC_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_Lab2_SOPC_clock_1_in) | (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_1_in & ~Lab2_SOPC_clock_1_in_non_bursting_master_requests))
          Lab2_SOPC_clock_1_in_slavearbiterlockenable <= |Lab2_SOPC_clock_1_in_arb_share_counter_next_value;
    end


  //CPU/instruction_master Lab2_SOPC_clock_1/in arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = Lab2_SOPC_clock_1_in_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //Lab2_SOPC_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Lab2_SOPC_clock_1_in_slavearbiterlockenable2 = |Lab2_SOPC_clock_1_in_arb_share_counter_next_value;

  //CPU/instruction_master Lab2_SOPC_clock_1/in arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = Lab2_SOPC_clock_1_in_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //Lab2_SOPC_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Lab2_SOPC_clock_1_in_any_continuerequest = 1;

  //CPU_instruction_master_continuerequest continued request, which is an e_assign
  assign CPU_instruction_master_continuerequest = 1;

  assign CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in = CPU_instruction_master_requests_Lab2_SOPC_clock_1_in & ~((CPU_instruction_master_read & ((CPU_instruction_master_latency_counter != 0))));
  //local readdatavalid CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in, which is an e_mux
  assign CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in = CPU_instruction_master_granted_Lab2_SOPC_clock_1_in & CPU_instruction_master_read & ~Lab2_SOPC_clock_1_in_waits_for_read;

  //assign Lab2_SOPC_clock_1_in_endofpacket_from_sa = Lab2_SOPC_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_1_in_endofpacket_from_sa = Lab2_SOPC_clock_1_in_endofpacket;

  //master is always granted when requested
  assign CPU_instruction_master_granted_Lab2_SOPC_clock_1_in = CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in;

  //CPU/instruction_master saved-grant Lab2_SOPC_clock_1/in, which is an e_assign
  assign CPU_instruction_master_saved_grant_Lab2_SOPC_clock_1_in = CPU_instruction_master_requests_Lab2_SOPC_clock_1_in;

  //allow new arb cycle for Lab2_SOPC_clock_1/in, which is an e_assign
  assign Lab2_SOPC_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Lab2_SOPC_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Lab2_SOPC_clock_1_in_master_qreq_vector = 1;

  //Lab2_SOPC_clock_1_in_reset_n assignment, which is an e_assign
  assign Lab2_SOPC_clock_1_in_reset_n = reset_n;

  //Lab2_SOPC_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign Lab2_SOPC_clock_1_in_firsttransfer = Lab2_SOPC_clock_1_in_begins_xfer ? Lab2_SOPC_clock_1_in_unreg_firsttransfer : Lab2_SOPC_clock_1_in_reg_firsttransfer;

  //Lab2_SOPC_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Lab2_SOPC_clock_1_in_unreg_firsttransfer = ~(Lab2_SOPC_clock_1_in_slavearbiterlockenable & Lab2_SOPC_clock_1_in_any_continuerequest);

  //Lab2_SOPC_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (Lab2_SOPC_clock_1_in_begins_xfer)
          Lab2_SOPC_clock_1_in_reg_firsttransfer <= Lab2_SOPC_clock_1_in_unreg_firsttransfer;
    end


  //Lab2_SOPC_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Lab2_SOPC_clock_1_in_beginbursttransfer_internal = Lab2_SOPC_clock_1_in_begins_xfer;

  //Lab2_SOPC_clock_1_in_read assignment, which is an e_mux
  assign Lab2_SOPC_clock_1_in_read = CPU_instruction_master_granted_Lab2_SOPC_clock_1_in & CPU_instruction_master_read;

  //Lab2_SOPC_clock_1_in_write assignment, which is an e_mux
  assign Lab2_SOPC_clock_1_in_write = 0;

  //Lab2_SOPC_clock_1_in_address mux, which is an e_mux
  assign Lab2_SOPC_clock_1_in_address = CPU_instruction_master_address_to_slave;

  //slaveid Lab2_SOPC_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Lab2_SOPC_clock_1_in_nativeaddress = CPU_instruction_master_address_to_slave >> 2;

  //d1_Lab2_SOPC_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Lab2_SOPC_clock_1_in_end_xfer <= 1;
      else 
        d1_Lab2_SOPC_clock_1_in_end_xfer <= Lab2_SOPC_clock_1_in_end_xfer;
    end


  //Lab2_SOPC_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign Lab2_SOPC_clock_1_in_waits_for_read = Lab2_SOPC_clock_1_in_in_a_read_cycle & Lab2_SOPC_clock_1_in_waitrequest_from_sa;

  //Lab2_SOPC_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign Lab2_SOPC_clock_1_in_in_a_read_cycle = CPU_instruction_master_granted_Lab2_SOPC_clock_1_in & CPU_instruction_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Lab2_SOPC_clock_1_in_in_a_read_cycle;

  //Lab2_SOPC_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign Lab2_SOPC_clock_1_in_waits_for_write = Lab2_SOPC_clock_1_in_in_a_write_cycle & Lab2_SOPC_clock_1_in_waitrequest_from_sa;

  //Lab2_SOPC_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign Lab2_SOPC_clock_1_in_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Lab2_SOPC_clock_1_in_in_a_write_cycle;

  assign wait_for_Lab2_SOPC_clock_1_in_counter = 0;
  //Lab2_SOPC_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign Lab2_SOPC_clock_1_in_byteenable = -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Lab2_SOPC_clock_1/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_clock_1_out_arbitrator (
                                          // inputs:
                                           Lab2_SOPC_clock_1_out_address,
                                           Lab2_SOPC_clock_1_out_byteenable,
                                           Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1,
                                           Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1,
                                           Lab2_SOPC_clock_1_out_read,
                                           Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1,
                                           Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register,
                                           Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1,
                                           Lab2_SOPC_clock_1_out_write,
                                           Lab2_SOPC_clock_1_out_writedata,
                                           SDRAM_controller_s1_readdata_from_sa,
                                           SDRAM_controller_s1_waitrequest_from_sa,
                                           clk,
                                           d1_SDRAM_controller_s1_end_xfer,
                                           reset_n,

                                          // outputs:
                                           Lab2_SOPC_clock_1_out_address_to_slave,
                                           Lab2_SOPC_clock_1_out_readdata,
                                           Lab2_SOPC_clock_1_out_reset_n,
                                           Lab2_SOPC_clock_1_out_waitrequest
                                        )
;

  output  [ 25: 0] Lab2_SOPC_clock_1_out_address_to_slave;
  output  [ 31: 0] Lab2_SOPC_clock_1_out_readdata;
  output           Lab2_SOPC_clock_1_out_reset_n;
  output           Lab2_SOPC_clock_1_out_waitrequest;
  input   [ 25: 0] Lab2_SOPC_clock_1_out_address;
  input   [  3: 0] Lab2_SOPC_clock_1_out_byteenable;
  input            Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1;
  input            Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1;
  input            Lab2_SOPC_clock_1_out_read;
  input            Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1;
  input            Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register;
  input            Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1;
  input            Lab2_SOPC_clock_1_out_write;
  input   [ 31: 0] Lab2_SOPC_clock_1_out_writedata;
  input   [ 31: 0] SDRAM_controller_s1_readdata_from_sa;
  input            SDRAM_controller_s1_waitrequest_from_sa;
  input            clk;
  input            d1_SDRAM_controller_s1_end_xfer;
  input            reset_n;

  reg     [ 25: 0] Lab2_SOPC_clock_1_out_address_last_time;
  wire    [ 25: 0] Lab2_SOPC_clock_1_out_address_to_slave;
  reg     [  3: 0] Lab2_SOPC_clock_1_out_byteenable_last_time;
  reg              Lab2_SOPC_clock_1_out_read_last_time;
  wire    [ 31: 0] Lab2_SOPC_clock_1_out_readdata;
  wire             Lab2_SOPC_clock_1_out_reset_n;
  wire             Lab2_SOPC_clock_1_out_run;
  wire             Lab2_SOPC_clock_1_out_waitrequest;
  reg              Lab2_SOPC_clock_1_out_write_last_time;
  reg     [ 31: 0] Lab2_SOPC_clock_1_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1 | Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1 | ~Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1) & (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1 | ~Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1) & ((~Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1 | ~Lab2_SOPC_clock_1_out_read | (Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1 & Lab2_SOPC_clock_1_out_read))) & ((~Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1 | ~(Lab2_SOPC_clock_1_out_read | Lab2_SOPC_clock_1_out_write) | (1 & ~SDRAM_controller_s1_waitrequest_from_sa & (Lab2_SOPC_clock_1_out_read | Lab2_SOPC_clock_1_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Lab2_SOPC_clock_1_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign Lab2_SOPC_clock_1_out_address_to_slave = Lab2_SOPC_clock_1_out_address;

  //Lab2_SOPC_clock_1/out readdata mux, which is an e_mux
  assign Lab2_SOPC_clock_1_out_readdata = SDRAM_controller_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Lab2_SOPC_clock_1_out_waitrequest = ~Lab2_SOPC_clock_1_out_run;

  //Lab2_SOPC_clock_1_out_reset_n assignment, which is an e_assign
  assign Lab2_SOPC_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Lab2_SOPC_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_1_out_address_last_time <= 0;
      else 
        Lab2_SOPC_clock_1_out_address_last_time <= Lab2_SOPC_clock_1_out_address;
    end


  //Lab2_SOPC_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Lab2_SOPC_clock_1_out_waitrequest & (Lab2_SOPC_clock_1_out_read | Lab2_SOPC_clock_1_out_write);
    end


  //Lab2_SOPC_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_1_out_address != Lab2_SOPC_clock_1_out_address_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_1_out_byteenable_last_time <= 0;
      else 
        Lab2_SOPC_clock_1_out_byteenable_last_time <= Lab2_SOPC_clock_1_out_byteenable;
    end


  //Lab2_SOPC_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_1_out_byteenable != Lab2_SOPC_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_1_out_read_last_time <= 0;
      else 
        Lab2_SOPC_clock_1_out_read_last_time <= Lab2_SOPC_clock_1_out_read;
    end


  //Lab2_SOPC_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_1_out_read != Lab2_SOPC_clock_1_out_read_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_1_out_write_last_time <= 0;
      else 
        Lab2_SOPC_clock_1_out_write_last_time <= Lab2_SOPC_clock_1_out_write;
    end


  //Lab2_SOPC_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_1_out_write != Lab2_SOPC_clock_1_out_write_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_1_out_writedata_last_time <= 0;
      else 
        Lab2_SOPC_clock_1_out_writedata_last_time <= Lab2_SOPC_clock_1_out_writedata;
    end


  //Lab2_SOPC_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_1_out_writedata != Lab2_SOPC_clock_1_out_writedata_last_time) & Lab2_SOPC_clock_1_out_write)
        begin
          $write("%0d ns: Lab2_SOPC_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_clock_2_in_arbitrator (
                                         // inputs:
                                          CPU_data_master_address_to_slave,
                                          CPU_data_master_byteenable,
                                          CPU_data_master_latency_counter,
                                          CPU_data_master_read,
                                          CPU_data_master_write,
                                          CPU_data_master_writedata,
                                          Lab2_SOPC_clock_2_in_endofpacket,
                                          Lab2_SOPC_clock_2_in_readdata,
                                          Lab2_SOPC_clock_2_in_waitrequest,
                                          clk,
                                          reset_n,

                                         // outputs:
                                          CPU_data_master_granted_Lab2_SOPC_clock_2_in,
                                          CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in,
                                          CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in,
                                          CPU_data_master_requests_Lab2_SOPC_clock_2_in,
                                          Lab2_SOPC_clock_2_in_address,
                                          Lab2_SOPC_clock_2_in_byteenable,
                                          Lab2_SOPC_clock_2_in_endofpacket_from_sa,
                                          Lab2_SOPC_clock_2_in_nativeaddress,
                                          Lab2_SOPC_clock_2_in_read,
                                          Lab2_SOPC_clock_2_in_readdata_from_sa,
                                          Lab2_SOPC_clock_2_in_reset_n,
                                          Lab2_SOPC_clock_2_in_waitrequest_from_sa,
                                          Lab2_SOPC_clock_2_in_write,
                                          Lab2_SOPC_clock_2_in_writedata,
                                          d1_Lab2_SOPC_clock_2_in_end_xfer
                                       )
;

  output           CPU_data_master_granted_Lab2_SOPC_clock_2_in;
  output           CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in;
  output           CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in;
  output           CPU_data_master_requests_Lab2_SOPC_clock_2_in;
  output  [ 25: 0] Lab2_SOPC_clock_2_in_address;
  output  [  3: 0] Lab2_SOPC_clock_2_in_byteenable;
  output           Lab2_SOPC_clock_2_in_endofpacket_from_sa;
  output  [ 23: 0] Lab2_SOPC_clock_2_in_nativeaddress;
  output           Lab2_SOPC_clock_2_in_read;
  output  [ 31: 0] Lab2_SOPC_clock_2_in_readdata_from_sa;
  output           Lab2_SOPC_clock_2_in_reset_n;
  output           Lab2_SOPC_clock_2_in_waitrequest_from_sa;
  output           Lab2_SOPC_clock_2_in_write;
  output  [ 31: 0] Lab2_SOPC_clock_2_in_writedata;
  output           d1_Lab2_SOPC_clock_2_in_end_xfer;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            Lab2_SOPC_clock_2_in_endofpacket;
  input   [ 31: 0] Lab2_SOPC_clock_2_in_readdata;
  input            Lab2_SOPC_clock_2_in_waitrequest;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_Lab2_SOPC_clock_2_in;
  wire             CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in;
  wire             CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in;
  wire             CPU_data_master_requests_Lab2_SOPC_clock_2_in;
  wire             CPU_data_master_saved_grant_Lab2_SOPC_clock_2_in;
  wire    [ 25: 0] Lab2_SOPC_clock_2_in_address;
  wire             Lab2_SOPC_clock_2_in_allgrants;
  wire             Lab2_SOPC_clock_2_in_allow_new_arb_cycle;
  wire             Lab2_SOPC_clock_2_in_any_bursting_master_saved_grant;
  wire             Lab2_SOPC_clock_2_in_any_continuerequest;
  wire             Lab2_SOPC_clock_2_in_arb_counter_enable;
  reg     [  1: 0] Lab2_SOPC_clock_2_in_arb_share_counter;
  wire    [  1: 0] Lab2_SOPC_clock_2_in_arb_share_counter_next_value;
  wire    [  1: 0] Lab2_SOPC_clock_2_in_arb_share_set_values;
  wire             Lab2_SOPC_clock_2_in_beginbursttransfer_internal;
  wire             Lab2_SOPC_clock_2_in_begins_xfer;
  wire    [  3: 0] Lab2_SOPC_clock_2_in_byteenable;
  wire             Lab2_SOPC_clock_2_in_end_xfer;
  wire             Lab2_SOPC_clock_2_in_endofpacket_from_sa;
  wire             Lab2_SOPC_clock_2_in_firsttransfer;
  wire             Lab2_SOPC_clock_2_in_grant_vector;
  wire             Lab2_SOPC_clock_2_in_in_a_read_cycle;
  wire             Lab2_SOPC_clock_2_in_in_a_write_cycle;
  wire             Lab2_SOPC_clock_2_in_master_qreq_vector;
  wire    [ 23: 0] Lab2_SOPC_clock_2_in_nativeaddress;
  wire             Lab2_SOPC_clock_2_in_non_bursting_master_requests;
  wire             Lab2_SOPC_clock_2_in_read;
  wire    [ 31: 0] Lab2_SOPC_clock_2_in_readdata_from_sa;
  reg              Lab2_SOPC_clock_2_in_reg_firsttransfer;
  wire             Lab2_SOPC_clock_2_in_reset_n;
  reg              Lab2_SOPC_clock_2_in_slavearbiterlockenable;
  wire             Lab2_SOPC_clock_2_in_slavearbiterlockenable2;
  wire             Lab2_SOPC_clock_2_in_unreg_firsttransfer;
  wire             Lab2_SOPC_clock_2_in_waitrequest_from_sa;
  wire             Lab2_SOPC_clock_2_in_waits_for_read;
  wire             Lab2_SOPC_clock_2_in_waits_for_write;
  wire             Lab2_SOPC_clock_2_in_write;
  wire    [ 31: 0] Lab2_SOPC_clock_2_in_writedata;
  reg              d1_Lab2_SOPC_clock_2_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_Lab2_SOPC_clock_2_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_Lab2_SOPC_clock_2_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~Lab2_SOPC_clock_2_in_end_xfer;
    end


  assign Lab2_SOPC_clock_2_in_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in));
  //assign Lab2_SOPC_clock_2_in_readdata_from_sa = Lab2_SOPC_clock_2_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_2_in_readdata_from_sa = Lab2_SOPC_clock_2_in_readdata;

  assign CPU_data_master_requests_Lab2_SOPC_clock_2_in = ({CPU_data_master_address_to_slave[27 : 26] , 26'b0} == 28'h4000000) & (CPU_data_master_read | CPU_data_master_write);
  //assign Lab2_SOPC_clock_2_in_waitrequest_from_sa = Lab2_SOPC_clock_2_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_2_in_waitrequest_from_sa = Lab2_SOPC_clock_2_in_waitrequest;

  //Lab2_SOPC_clock_2_in_arb_share_counter set values, which is an e_mux
  assign Lab2_SOPC_clock_2_in_arb_share_set_values = 1;

  //Lab2_SOPC_clock_2_in_non_bursting_master_requests mux, which is an e_mux
  assign Lab2_SOPC_clock_2_in_non_bursting_master_requests = CPU_data_master_requests_Lab2_SOPC_clock_2_in;

  //Lab2_SOPC_clock_2_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign Lab2_SOPC_clock_2_in_any_bursting_master_saved_grant = 0;

  //Lab2_SOPC_clock_2_in_arb_share_counter_next_value assignment, which is an e_assign
  assign Lab2_SOPC_clock_2_in_arb_share_counter_next_value = Lab2_SOPC_clock_2_in_firsttransfer ? (Lab2_SOPC_clock_2_in_arb_share_set_values - 1) : |Lab2_SOPC_clock_2_in_arb_share_counter ? (Lab2_SOPC_clock_2_in_arb_share_counter - 1) : 0;

  //Lab2_SOPC_clock_2_in_allgrants all slave grants, which is an e_mux
  assign Lab2_SOPC_clock_2_in_allgrants = |Lab2_SOPC_clock_2_in_grant_vector;

  //Lab2_SOPC_clock_2_in_end_xfer assignment, which is an e_assign
  assign Lab2_SOPC_clock_2_in_end_xfer = ~(Lab2_SOPC_clock_2_in_waits_for_read | Lab2_SOPC_clock_2_in_waits_for_write);

  //end_xfer_arb_share_counter_term_Lab2_SOPC_clock_2_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_Lab2_SOPC_clock_2_in = Lab2_SOPC_clock_2_in_end_xfer & (~Lab2_SOPC_clock_2_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //Lab2_SOPC_clock_2_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign Lab2_SOPC_clock_2_in_arb_counter_enable = (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_2_in & Lab2_SOPC_clock_2_in_allgrants) | (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_2_in & ~Lab2_SOPC_clock_2_in_non_bursting_master_requests);

  //Lab2_SOPC_clock_2_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_2_in_arb_share_counter <= 0;
      else if (Lab2_SOPC_clock_2_in_arb_counter_enable)
          Lab2_SOPC_clock_2_in_arb_share_counter <= Lab2_SOPC_clock_2_in_arb_share_counter_next_value;
    end


  //Lab2_SOPC_clock_2_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_2_in_slavearbiterlockenable <= 0;
      else if ((|Lab2_SOPC_clock_2_in_master_qreq_vector & end_xfer_arb_share_counter_term_Lab2_SOPC_clock_2_in) | (end_xfer_arb_share_counter_term_Lab2_SOPC_clock_2_in & ~Lab2_SOPC_clock_2_in_non_bursting_master_requests))
          Lab2_SOPC_clock_2_in_slavearbiterlockenable <= |Lab2_SOPC_clock_2_in_arb_share_counter_next_value;
    end


  //CPU/data_master Lab2_SOPC_clock_2/in arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = Lab2_SOPC_clock_2_in_slavearbiterlockenable & CPU_data_master_continuerequest;

  //Lab2_SOPC_clock_2_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign Lab2_SOPC_clock_2_in_slavearbiterlockenable2 = |Lab2_SOPC_clock_2_in_arb_share_counter_next_value;

  //CPU/data_master Lab2_SOPC_clock_2/in arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = Lab2_SOPC_clock_2_in_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //Lab2_SOPC_clock_2_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign Lab2_SOPC_clock_2_in_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in = CPU_data_master_requests_Lab2_SOPC_clock_2_in & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in, which is an e_mux
  assign CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in = CPU_data_master_granted_Lab2_SOPC_clock_2_in & CPU_data_master_read & ~Lab2_SOPC_clock_2_in_waits_for_read;

  //Lab2_SOPC_clock_2_in_writedata mux, which is an e_mux
  assign Lab2_SOPC_clock_2_in_writedata = CPU_data_master_writedata;

  //assign Lab2_SOPC_clock_2_in_endofpacket_from_sa = Lab2_SOPC_clock_2_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign Lab2_SOPC_clock_2_in_endofpacket_from_sa = Lab2_SOPC_clock_2_in_endofpacket;

  //master is always granted when requested
  assign CPU_data_master_granted_Lab2_SOPC_clock_2_in = CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in;

  //CPU/data_master saved-grant Lab2_SOPC_clock_2/in, which is an e_assign
  assign CPU_data_master_saved_grant_Lab2_SOPC_clock_2_in = CPU_data_master_requests_Lab2_SOPC_clock_2_in;

  //allow new arb cycle for Lab2_SOPC_clock_2/in, which is an e_assign
  assign Lab2_SOPC_clock_2_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign Lab2_SOPC_clock_2_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign Lab2_SOPC_clock_2_in_master_qreq_vector = 1;

  //Lab2_SOPC_clock_2_in_reset_n assignment, which is an e_assign
  assign Lab2_SOPC_clock_2_in_reset_n = reset_n;

  //Lab2_SOPC_clock_2_in_firsttransfer first transaction, which is an e_assign
  assign Lab2_SOPC_clock_2_in_firsttransfer = Lab2_SOPC_clock_2_in_begins_xfer ? Lab2_SOPC_clock_2_in_unreg_firsttransfer : Lab2_SOPC_clock_2_in_reg_firsttransfer;

  //Lab2_SOPC_clock_2_in_unreg_firsttransfer first transaction, which is an e_assign
  assign Lab2_SOPC_clock_2_in_unreg_firsttransfer = ~(Lab2_SOPC_clock_2_in_slavearbiterlockenable & Lab2_SOPC_clock_2_in_any_continuerequest);

  //Lab2_SOPC_clock_2_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_2_in_reg_firsttransfer <= 1'b1;
      else if (Lab2_SOPC_clock_2_in_begins_xfer)
          Lab2_SOPC_clock_2_in_reg_firsttransfer <= Lab2_SOPC_clock_2_in_unreg_firsttransfer;
    end


  //Lab2_SOPC_clock_2_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign Lab2_SOPC_clock_2_in_beginbursttransfer_internal = Lab2_SOPC_clock_2_in_begins_xfer;

  //Lab2_SOPC_clock_2_in_read assignment, which is an e_mux
  assign Lab2_SOPC_clock_2_in_read = CPU_data_master_granted_Lab2_SOPC_clock_2_in & CPU_data_master_read;

  //Lab2_SOPC_clock_2_in_write assignment, which is an e_mux
  assign Lab2_SOPC_clock_2_in_write = CPU_data_master_granted_Lab2_SOPC_clock_2_in & CPU_data_master_write;

  //Lab2_SOPC_clock_2_in_address mux, which is an e_mux
  assign Lab2_SOPC_clock_2_in_address = CPU_data_master_address_to_slave;

  //slaveid Lab2_SOPC_clock_2_in_nativeaddress nativeaddress mux, which is an e_mux
  assign Lab2_SOPC_clock_2_in_nativeaddress = CPU_data_master_address_to_slave >> 2;

  //d1_Lab2_SOPC_clock_2_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_Lab2_SOPC_clock_2_in_end_xfer <= 1;
      else 
        d1_Lab2_SOPC_clock_2_in_end_xfer <= Lab2_SOPC_clock_2_in_end_xfer;
    end


  //Lab2_SOPC_clock_2_in_waits_for_read in a cycle, which is an e_mux
  assign Lab2_SOPC_clock_2_in_waits_for_read = Lab2_SOPC_clock_2_in_in_a_read_cycle & Lab2_SOPC_clock_2_in_waitrequest_from_sa;

  //Lab2_SOPC_clock_2_in_in_a_read_cycle assignment, which is an e_assign
  assign Lab2_SOPC_clock_2_in_in_a_read_cycle = CPU_data_master_granted_Lab2_SOPC_clock_2_in & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = Lab2_SOPC_clock_2_in_in_a_read_cycle;

  //Lab2_SOPC_clock_2_in_waits_for_write in a cycle, which is an e_mux
  assign Lab2_SOPC_clock_2_in_waits_for_write = Lab2_SOPC_clock_2_in_in_a_write_cycle & Lab2_SOPC_clock_2_in_waitrequest_from_sa;

  //Lab2_SOPC_clock_2_in_in_a_write_cycle assignment, which is an e_assign
  assign Lab2_SOPC_clock_2_in_in_a_write_cycle = CPU_data_master_granted_Lab2_SOPC_clock_2_in & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = Lab2_SOPC_clock_2_in_in_a_write_cycle;

  assign wait_for_Lab2_SOPC_clock_2_in_counter = 0;
  //Lab2_SOPC_clock_2_in_byteenable byte enable port mux, which is an e_mux
  assign Lab2_SOPC_clock_2_in_byteenable = (CPU_data_master_granted_Lab2_SOPC_clock_2_in)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Lab2_SOPC_clock_2/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_clock_2_out_arbitrator (
                                          // inputs:
                                           Lab2_SOPC_clock_2_out_address,
                                           Lab2_SOPC_clock_2_out_byteenable,
                                           Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1,
                                           Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1,
                                           Lab2_SOPC_clock_2_out_read,
                                           Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1,
                                           Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register,
                                           Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1,
                                           Lab2_SOPC_clock_2_out_write,
                                           Lab2_SOPC_clock_2_out_writedata,
                                           SDRAM_controller_s1_readdata_from_sa,
                                           SDRAM_controller_s1_waitrequest_from_sa,
                                           clk,
                                           d1_SDRAM_controller_s1_end_xfer,
                                           reset_n,

                                          // outputs:
                                           Lab2_SOPC_clock_2_out_address_to_slave,
                                           Lab2_SOPC_clock_2_out_readdata,
                                           Lab2_SOPC_clock_2_out_reset_n,
                                           Lab2_SOPC_clock_2_out_waitrequest
                                        )
;

  output  [ 25: 0] Lab2_SOPC_clock_2_out_address_to_slave;
  output  [ 31: 0] Lab2_SOPC_clock_2_out_readdata;
  output           Lab2_SOPC_clock_2_out_reset_n;
  output           Lab2_SOPC_clock_2_out_waitrequest;
  input   [ 25: 0] Lab2_SOPC_clock_2_out_address;
  input   [  3: 0] Lab2_SOPC_clock_2_out_byteenable;
  input            Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1;
  input            Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1;
  input            Lab2_SOPC_clock_2_out_read;
  input            Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1;
  input            Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register;
  input            Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1;
  input            Lab2_SOPC_clock_2_out_write;
  input   [ 31: 0] Lab2_SOPC_clock_2_out_writedata;
  input   [ 31: 0] SDRAM_controller_s1_readdata_from_sa;
  input            SDRAM_controller_s1_waitrequest_from_sa;
  input            clk;
  input            d1_SDRAM_controller_s1_end_xfer;
  input            reset_n;

  reg     [ 25: 0] Lab2_SOPC_clock_2_out_address_last_time;
  wire    [ 25: 0] Lab2_SOPC_clock_2_out_address_to_slave;
  reg     [  3: 0] Lab2_SOPC_clock_2_out_byteenable_last_time;
  reg              Lab2_SOPC_clock_2_out_read_last_time;
  wire    [ 31: 0] Lab2_SOPC_clock_2_out_readdata;
  wire             Lab2_SOPC_clock_2_out_reset_n;
  wire             Lab2_SOPC_clock_2_out_run;
  wire             Lab2_SOPC_clock_2_out_waitrequest;
  reg              Lab2_SOPC_clock_2_out_write_last_time;
  reg     [ 31: 0] Lab2_SOPC_clock_2_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1 | Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1 | ~Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1) & (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1 | ~Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1) & ((~Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1 | ~Lab2_SOPC_clock_2_out_read | (Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1 & Lab2_SOPC_clock_2_out_read))) & ((~Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1 | ~(Lab2_SOPC_clock_2_out_read | Lab2_SOPC_clock_2_out_write) | (1 & ~SDRAM_controller_s1_waitrequest_from_sa & (Lab2_SOPC_clock_2_out_read | Lab2_SOPC_clock_2_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign Lab2_SOPC_clock_2_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign Lab2_SOPC_clock_2_out_address_to_slave = Lab2_SOPC_clock_2_out_address;

  //Lab2_SOPC_clock_2/out readdata mux, which is an e_mux
  assign Lab2_SOPC_clock_2_out_readdata = SDRAM_controller_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign Lab2_SOPC_clock_2_out_waitrequest = ~Lab2_SOPC_clock_2_out_run;

  //Lab2_SOPC_clock_2_out_reset_n assignment, which is an e_assign
  assign Lab2_SOPC_clock_2_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //Lab2_SOPC_clock_2_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_2_out_address_last_time <= 0;
      else 
        Lab2_SOPC_clock_2_out_address_last_time <= Lab2_SOPC_clock_2_out_address;
    end


  //Lab2_SOPC_clock_2/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= Lab2_SOPC_clock_2_out_waitrequest & (Lab2_SOPC_clock_2_out_read | Lab2_SOPC_clock_2_out_write);
    end


  //Lab2_SOPC_clock_2_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_2_out_address != Lab2_SOPC_clock_2_out_address_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_2_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_2_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_2_out_byteenable_last_time <= 0;
      else 
        Lab2_SOPC_clock_2_out_byteenable_last_time <= Lab2_SOPC_clock_2_out_byteenable;
    end


  //Lab2_SOPC_clock_2_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_2_out_byteenable != Lab2_SOPC_clock_2_out_byteenable_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_2_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_2_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_2_out_read_last_time <= 0;
      else 
        Lab2_SOPC_clock_2_out_read_last_time <= Lab2_SOPC_clock_2_out_read;
    end


  //Lab2_SOPC_clock_2_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_2_out_read != Lab2_SOPC_clock_2_out_read_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_2_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_2_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_2_out_write_last_time <= 0;
      else 
        Lab2_SOPC_clock_2_out_write_last_time <= Lab2_SOPC_clock_2_out_write;
    end


  //Lab2_SOPC_clock_2_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_2_out_write != Lab2_SOPC_clock_2_out_write_last_time))
        begin
          $write("%0d ns: Lab2_SOPC_clock_2_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //Lab2_SOPC_clock_2_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          Lab2_SOPC_clock_2_out_writedata_last_time <= 0;
      else 
        Lab2_SOPC_clock_2_out_writedata_last_time <= Lab2_SOPC_clock_2_out_writedata;
    end


  //Lab2_SOPC_clock_2_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (Lab2_SOPC_clock_2_out_writedata != Lab2_SOPC_clock_2_out_writedata_last_time) & Lab2_SOPC_clock_2_out_write)
        begin
          $write("%0d ns: Lab2_SOPC_clock_2_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module PLL_pll_slave_arbitrator (
                                  // inputs:
                                   Lab2_SOPC_clock_0_out_address_to_slave,
                                   Lab2_SOPC_clock_0_out_read,
                                   Lab2_SOPC_clock_0_out_write,
                                   Lab2_SOPC_clock_0_out_writedata,
                                   PLL_pll_slave_readdata,
                                   clk,
                                   reset_n,

                                  // outputs:
                                   Lab2_SOPC_clock_0_out_granted_PLL_pll_slave,
                                   Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave,
                                   Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave,
                                   Lab2_SOPC_clock_0_out_requests_PLL_pll_slave,
                                   PLL_pll_slave_address,
                                   PLL_pll_slave_read,
                                   PLL_pll_slave_readdata_from_sa,
                                   PLL_pll_slave_reset,
                                   PLL_pll_slave_write,
                                   PLL_pll_slave_writedata,
                                   d1_PLL_pll_slave_end_xfer
                                )
;

  output           Lab2_SOPC_clock_0_out_granted_PLL_pll_slave;
  output           Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave;
  output           Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave;
  output           Lab2_SOPC_clock_0_out_requests_PLL_pll_slave;
  output  [  1: 0] PLL_pll_slave_address;
  output           PLL_pll_slave_read;
  output  [ 31: 0] PLL_pll_slave_readdata_from_sa;
  output           PLL_pll_slave_reset;
  output           PLL_pll_slave_write;
  output  [ 31: 0] PLL_pll_slave_writedata;
  output           d1_PLL_pll_slave_end_xfer;
  input   [  3: 0] Lab2_SOPC_clock_0_out_address_to_slave;
  input            Lab2_SOPC_clock_0_out_read;
  input            Lab2_SOPC_clock_0_out_write;
  input   [ 31: 0] Lab2_SOPC_clock_0_out_writedata;
  input   [ 31: 0] PLL_pll_slave_readdata;
  input            clk;
  input            reset_n;

  wire             Lab2_SOPC_clock_0_out_arbiterlock;
  wire             Lab2_SOPC_clock_0_out_arbiterlock2;
  wire             Lab2_SOPC_clock_0_out_continuerequest;
  wire             Lab2_SOPC_clock_0_out_granted_PLL_pll_slave;
  wire             Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave;
  wire             Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave;
  wire             Lab2_SOPC_clock_0_out_requests_PLL_pll_slave;
  wire             Lab2_SOPC_clock_0_out_saved_grant_PLL_pll_slave;
  wire    [  1: 0] PLL_pll_slave_address;
  wire             PLL_pll_slave_allgrants;
  wire             PLL_pll_slave_allow_new_arb_cycle;
  wire             PLL_pll_slave_any_bursting_master_saved_grant;
  wire             PLL_pll_slave_any_continuerequest;
  wire             PLL_pll_slave_arb_counter_enable;
  reg              PLL_pll_slave_arb_share_counter;
  wire             PLL_pll_slave_arb_share_counter_next_value;
  wire             PLL_pll_slave_arb_share_set_values;
  wire             PLL_pll_slave_beginbursttransfer_internal;
  wire             PLL_pll_slave_begins_xfer;
  wire             PLL_pll_slave_end_xfer;
  wire             PLL_pll_slave_firsttransfer;
  wire             PLL_pll_slave_grant_vector;
  wire             PLL_pll_slave_in_a_read_cycle;
  wire             PLL_pll_slave_in_a_write_cycle;
  wire             PLL_pll_slave_master_qreq_vector;
  wire             PLL_pll_slave_non_bursting_master_requests;
  wire             PLL_pll_slave_read;
  wire    [ 31: 0] PLL_pll_slave_readdata_from_sa;
  reg              PLL_pll_slave_reg_firsttransfer;
  wire             PLL_pll_slave_reset;
  reg              PLL_pll_slave_slavearbiterlockenable;
  wire             PLL_pll_slave_slavearbiterlockenable2;
  wire             PLL_pll_slave_unreg_firsttransfer;
  wire             PLL_pll_slave_waits_for_read;
  wire             PLL_pll_slave_waits_for_write;
  wire             PLL_pll_slave_write;
  wire    [ 31: 0] PLL_pll_slave_writedata;
  reg              d1_PLL_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_PLL_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] shifted_address_to_PLL_pll_slave_from_Lab2_SOPC_clock_0_out;
  wire             wait_for_PLL_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~PLL_pll_slave_end_xfer;
    end


  assign PLL_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave));
  //assign PLL_pll_slave_readdata_from_sa = PLL_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign PLL_pll_slave_readdata_from_sa = PLL_pll_slave_readdata;

  assign Lab2_SOPC_clock_0_out_requests_PLL_pll_slave = (1) & (Lab2_SOPC_clock_0_out_read | Lab2_SOPC_clock_0_out_write);
  //PLL_pll_slave_arb_share_counter set values, which is an e_mux
  assign PLL_pll_slave_arb_share_set_values = 1;

  //PLL_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign PLL_pll_slave_non_bursting_master_requests = Lab2_SOPC_clock_0_out_requests_PLL_pll_slave;

  //PLL_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign PLL_pll_slave_any_bursting_master_saved_grant = 0;

  //PLL_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign PLL_pll_slave_arb_share_counter_next_value = PLL_pll_slave_firsttransfer ? (PLL_pll_slave_arb_share_set_values - 1) : |PLL_pll_slave_arb_share_counter ? (PLL_pll_slave_arb_share_counter - 1) : 0;

  //PLL_pll_slave_allgrants all slave grants, which is an e_mux
  assign PLL_pll_slave_allgrants = |PLL_pll_slave_grant_vector;

  //PLL_pll_slave_end_xfer assignment, which is an e_assign
  assign PLL_pll_slave_end_xfer = ~(PLL_pll_slave_waits_for_read | PLL_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_PLL_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_PLL_pll_slave = PLL_pll_slave_end_xfer & (~PLL_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //PLL_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign PLL_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_PLL_pll_slave & PLL_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_PLL_pll_slave & ~PLL_pll_slave_non_bursting_master_requests);

  //PLL_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PLL_pll_slave_arb_share_counter <= 0;
      else if (PLL_pll_slave_arb_counter_enable)
          PLL_pll_slave_arb_share_counter <= PLL_pll_slave_arb_share_counter_next_value;
    end


  //PLL_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PLL_pll_slave_slavearbiterlockenable <= 0;
      else if ((|PLL_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_PLL_pll_slave) | (end_xfer_arb_share_counter_term_PLL_pll_slave & ~PLL_pll_slave_non_bursting_master_requests))
          PLL_pll_slave_slavearbiterlockenable <= |PLL_pll_slave_arb_share_counter_next_value;
    end


  //Lab2_SOPC_clock_0/out PLL/pll_slave arbiterlock, which is an e_assign
  assign Lab2_SOPC_clock_0_out_arbiterlock = PLL_pll_slave_slavearbiterlockenable & Lab2_SOPC_clock_0_out_continuerequest;

  //PLL_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign PLL_pll_slave_slavearbiterlockenable2 = |PLL_pll_slave_arb_share_counter_next_value;

  //Lab2_SOPC_clock_0/out PLL/pll_slave arbiterlock2, which is an e_assign
  assign Lab2_SOPC_clock_0_out_arbiterlock2 = PLL_pll_slave_slavearbiterlockenable2 & Lab2_SOPC_clock_0_out_continuerequest;

  //PLL_pll_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign PLL_pll_slave_any_continuerequest = 1;

  //Lab2_SOPC_clock_0_out_continuerequest continued request, which is an e_assign
  assign Lab2_SOPC_clock_0_out_continuerequest = 1;

  assign Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave = Lab2_SOPC_clock_0_out_requests_PLL_pll_slave;
  //PLL_pll_slave_writedata mux, which is an e_mux
  assign PLL_pll_slave_writedata = Lab2_SOPC_clock_0_out_writedata;

  //master is always granted when requested
  assign Lab2_SOPC_clock_0_out_granted_PLL_pll_slave = Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave;

  //Lab2_SOPC_clock_0/out saved-grant PLL/pll_slave, which is an e_assign
  assign Lab2_SOPC_clock_0_out_saved_grant_PLL_pll_slave = Lab2_SOPC_clock_0_out_requests_PLL_pll_slave;

  //allow new arb cycle for PLL/pll_slave, which is an e_assign
  assign PLL_pll_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign PLL_pll_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign PLL_pll_slave_master_qreq_vector = 1;

  //~PLL_pll_slave_reset assignment, which is an e_assign
  assign PLL_pll_slave_reset = ~reset_n;

  //PLL_pll_slave_firsttransfer first transaction, which is an e_assign
  assign PLL_pll_slave_firsttransfer = PLL_pll_slave_begins_xfer ? PLL_pll_slave_unreg_firsttransfer : PLL_pll_slave_reg_firsttransfer;

  //PLL_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign PLL_pll_slave_unreg_firsttransfer = ~(PLL_pll_slave_slavearbiterlockenable & PLL_pll_slave_any_continuerequest);

  //PLL_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          PLL_pll_slave_reg_firsttransfer <= 1'b1;
      else if (PLL_pll_slave_begins_xfer)
          PLL_pll_slave_reg_firsttransfer <= PLL_pll_slave_unreg_firsttransfer;
    end


  //PLL_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign PLL_pll_slave_beginbursttransfer_internal = PLL_pll_slave_begins_xfer;

  //PLL_pll_slave_read assignment, which is an e_mux
  assign PLL_pll_slave_read = Lab2_SOPC_clock_0_out_granted_PLL_pll_slave & Lab2_SOPC_clock_0_out_read;

  //PLL_pll_slave_write assignment, which is an e_mux
  assign PLL_pll_slave_write = Lab2_SOPC_clock_0_out_granted_PLL_pll_slave & Lab2_SOPC_clock_0_out_write;

  assign shifted_address_to_PLL_pll_slave_from_Lab2_SOPC_clock_0_out = Lab2_SOPC_clock_0_out_address_to_slave;
  //PLL_pll_slave_address mux, which is an e_mux
  assign PLL_pll_slave_address = shifted_address_to_PLL_pll_slave_from_Lab2_SOPC_clock_0_out >> 2;

  //d1_PLL_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_PLL_pll_slave_end_xfer <= 1;
      else 
        d1_PLL_pll_slave_end_xfer <= PLL_pll_slave_end_xfer;
    end


  //PLL_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign PLL_pll_slave_waits_for_read = PLL_pll_slave_in_a_read_cycle & 0;

  //PLL_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign PLL_pll_slave_in_a_read_cycle = Lab2_SOPC_clock_0_out_granted_PLL_pll_slave & Lab2_SOPC_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = PLL_pll_slave_in_a_read_cycle;

  //PLL_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign PLL_pll_slave_waits_for_write = PLL_pll_slave_in_a_write_cycle & 0;

  //PLL_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign PLL_pll_slave_in_a_write_cycle = Lab2_SOPC_clock_0_out_granted_PLL_pll_slave & Lab2_SOPC_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = PLL_pll_slave_in_a_write_cycle;

  assign wait_for_PLL_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //PLL/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_Lab2_SOPC_clock_1_out_to_SDRAM_controller_s1_module (
                                                                          // inputs:
                                                                           clear_fifo,
                                                                           clk,
                                                                           data_in,
                                                                           read,
                                                                           reset_n,
                                                                           sync_reset,
                                                                           write,

                                                                          // outputs:
                                                                           data_out,
                                                                           empty,
                                                                           fifo_contains_ones_n,
                                                                           full
                                                                        )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_Lab2_SOPC_clock_2_out_to_SDRAM_controller_s1_module (
                                                                          // inputs:
                                                                           clear_fifo,
                                                                           clk,
                                                                           data_in,
                                                                           read,
                                                                           reset_n,
                                                                           sync_reset,
                                                                           write,

                                                                          // outputs:
                                                                           data_out,
                                                                           empty,
                                                                           fifo_contains_ones_n,
                                                                           full
                                                                        )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SDRAM_controller_s1_arbitrator (
                                        // inputs:
                                         Lab2_SOPC_clock_1_out_address_to_slave,
                                         Lab2_SOPC_clock_1_out_byteenable,
                                         Lab2_SOPC_clock_1_out_read,
                                         Lab2_SOPC_clock_1_out_write,
                                         Lab2_SOPC_clock_1_out_writedata,
                                         Lab2_SOPC_clock_2_out_address_to_slave,
                                         Lab2_SOPC_clock_2_out_byteenable,
                                         Lab2_SOPC_clock_2_out_read,
                                         Lab2_SOPC_clock_2_out_write,
                                         Lab2_SOPC_clock_2_out_writedata,
                                         SDRAM_controller_s1_readdata,
                                         SDRAM_controller_s1_readdatavalid,
                                         SDRAM_controller_s1_waitrequest,
                                         clk,
                                         reset_n,

                                        // outputs:
                                         Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1,
                                         Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1,
                                         Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1,
                                         Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register,
                                         Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1,
                                         Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1,
                                         Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1,
                                         Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1,
                                         Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register,
                                         Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1,
                                         SDRAM_controller_s1_address,
                                         SDRAM_controller_s1_byteenable_n,
                                         SDRAM_controller_s1_chipselect,
                                         SDRAM_controller_s1_read_n,
                                         SDRAM_controller_s1_readdata_from_sa,
                                         SDRAM_controller_s1_reset_n,
                                         SDRAM_controller_s1_waitrequest_from_sa,
                                         SDRAM_controller_s1_write_n,
                                         SDRAM_controller_s1_writedata,
                                         d1_SDRAM_controller_s1_end_xfer
                                      )
;

  output           Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1;
  output           Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1;
  output           Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1;
  output           Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register;
  output           Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1;
  output           Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1;
  output           Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1;
  output           Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1;
  output           Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register;
  output           Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1;
  output  [ 23: 0] SDRAM_controller_s1_address;
  output  [  3: 0] SDRAM_controller_s1_byteenable_n;
  output           SDRAM_controller_s1_chipselect;
  output           SDRAM_controller_s1_read_n;
  output  [ 31: 0] SDRAM_controller_s1_readdata_from_sa;
  output           SDRAM_controller_s1_reset_n;
  output           SDRAM_controller_s1_waitrequest_from_sa;
  output           SDRAM_controller_s1_write_n;
  output  [ 31: 0] SDRAM_controller_s1_writedata;
  output           d1_SDRAM_controller_s1_end_xfer;
  input   [ 25: 0] Lab2_SOPC_clock_1_out_address_to_slave;
  input   [  3: 0] Lab2_SOPC_clock_1_out_byteenable;
  input            Lab2_SOPC_clock_1_out_read;
  input            Lab2_SOPC_clock_1_out_write;
  input   [ 31: 0] Lab2_SOPC_clock_1_out_writedata;
  input   [ 25: 0] Lab2_SOPC_clock_2_out_address_to_slave;
  input   [  3: 0] Lab2_SOPC_clock_2_out_byteenable;
  input            Lab2_SOPC_clock_2_out_read;
  input            Lab2_SOPC_clock_2_out_write;
  input   [ 31: 0] Lab2_SOPC_clock_2_out_writedata;
  input   [ 31: 0] SDRAM_controller_s1_readdata;
  input            SDRAM_controller_s1_readdatavalid;
  input            SDRAM_controller_s1_waitrequest;
  input            clk;
  input            reset_n;

  wire             Lab2_SOPC_clock_1_out_arbiterlock;
  wire             Lab2_SOPC_clock_1_out_arbiterlock2;
  wire             Lab2_SOPC_clock_1_out_continuerequest;
  wire             Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_rdv_fifo_empty_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_rdv_fifo_output_from_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register;
  wire             Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_saved_grant_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_arbiterlock;
  wire             Lab2_SOPC_clock_2_out_arbiterlock2;
  wire             Lab2_SOPC_clock_2_out_continuerequest;
  wire             Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_rdv_fifo_empty_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_rdv_fifo_output_from_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register;
  wire             Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_saved_grant_SDRAM_controller_s1;
  wire    [ 23: 0] SDRAM_controller_s1_address;
  wire             SDRAM_controller_s1_allgrants;
  wire             SDRAM_controller_s1_allow_new_arb_cycle;
  wire             SDRAM_controller_s1_any_bursting_master_saved_grant;
  wire             SDRAM_controller_s1_any_continuerequest;
  reg     [  1: 0] SDRAM_controller_s1_arb_addend;
  wire             SDRAM_controller_s1_arb_counter_enable;
  reg              SDRAM_controller_s1_arb_share_counter;
  wire             SDRAM_controller_s1_arb_share_counter_next_value;
  wire             SDRAM_controller_s1_arb_share_set_values;
  wire    [  1: 0] SDRAM_controller_s1_arb_winner;
  wire             SDRAM_controller_s1_arbitration_holdoff_internal;
  wire             SDRAM_controller_s1_beginbursttransfer_internal;
  wire             SDRAM_controller_s1_begins_xfer;
  wire    [  3: 0] SDRAM_controller_s1_byteenable_n;
  wire             SDRAM_controller_s1_chipselect;
  wire    [  3: 0] SDRAM_controller_s1_chosen_master_double_vector;
  wire    [  1: 0] SDRAM_controller_s1_chosen_master_rot_left;
  wire             SDRAM_controller_s1_end_xfer;
  wire             SDRAM_controller_s1_firsttransfer;
  wire    [  1: 0] SDRAM_controller_s1_grant_vector;
  wire             SDRAM_controller_s1_in_a_read_cycle;
  wire             SDRAM_controller_s1_in_a_write_cycle;
  wire    [  1: 0] SDRAM_controller_s1_master_qreq_vector;
  wire             SDRAM_controller_s1_move_on_to_next_transaction;
  wire             SDRAM_controller_s1_non_bursting_master_requests;
  wire             SDRAM_controller_s1_read_n;
  wire    [ 31: 0] SDRAM_controller_s1_readdata_from_sa;
  wire             SDRAM_controller_s1_readdatavalid_from_sa;
  reg              SDRAM_controller_s1_reg_firsttransfer;
  wire             SDRAM_controller_s1_reset_n;
  reg     [  1: 0] SDRAM_controller_s1_saved_chosen_master_vector;
  reg              SDRAM_controller_s1_slavearbiterlockenable;
  wire             SDRAM_controller_s1_slavearbiterlockenable2;
  wire             SDRAM_controller_s1_unreg_firsttransfer;
  wire             SDRAM_controller_s1_waitrequest_from_sa;
  wire             SDRAM_controller_s1_waits_for_read;
  wire             SDRAM_controller_s1_waits_for_write;
  wire             SDRAM_controller_s1_write_n;
  wire    [ 31: 0] SDRAM_controller_s1_writedata;
  reg              d1_SDRAM_controller_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SDRAM_controller_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_Lab2_SOPC_clock_1_out_granted_slave_SDRAM_controller_s1;
  reg              last_cycle_Lab2_SOPC_clock_2_out_granted_slave_SDRAM_controller_s1;
  wire    [ 25: 0] shifted_address_to_SDRAM_controller_s1_from_Lab2_SOPC_clock_1_out;
  wire    [ 25: 0] shifted_address_to_SDRAM_controller_s1_from_Lab2_SOPC_clock_2_out;
  wire             wait_for_SDRAM_controller_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SDRAM_controller_s1_end_xfer;
    end


  assign SDRAM_controller_s1_begins_xfer = ~d1_reasons_to_wait & ((Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1 | Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1));
  //assign SDRAM_controller_s1_readdata_from_sa = SDRAM_controller_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_controller_s1_readdata_from_sa = SDRAM_controller_s1_readdata;

  assign Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1 = (1) & (Lab2_SOPC_clock_1_out_read | Lab2_SOPC_clock_1_out_write);
  //assign SDRAM_controller_s1_waitrequest_from_sa = SDRAM_controller_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_controller_s1_waitrequest_from_sa = SDRAM_controller_s1_waitrequest;

  //assign SDRAM_controller_s1_readdatavalid_from_sa = SDRAM_controller_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign SDRAM_controller_s1_readdatavalid_from_sa = SDRAM_controller_s1_readdatavalid;

  //SDRAM_controller_s1_arb_share_counter set values, which is an e_mux
  assign SDRAM_controller_s1_arb_share_set_values = 1;

  //SDRAM_controller_s1_non_bursting_master_requests mux, which is an e_mux
  assign SDRAM_controller_s1_non_bursting_master_requests = Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1 |
    Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1 |
    Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1 |
    Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1;

  //SDRAM_controller_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign SDRAM_controller_s1_any_bursting_master_saved_grant = 0;

  //SDRAM_controller_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign SDRAM_controller_s1_arb_share_counter_next_value = SDRAM_controller_s1_firsttransfer ? (SDRAM_controller_s1_arb_share_set_values - 1) : |SDRAM_controller_s1_arb_share_counter ? (SDRAM_controller_s1_arb_share_counter - 1) : 0;

  //SDRAM_controller_s1_allgrants all slave grants, which is an e_mux
  assign SDRAM_controller_s1_allgrants = (|SDRAM_controller_s1_grant_vector) |
    (|SDRAM_controller_s1_grant_vector) |
    (|SDRAM_controller_s1_grant_vector) |
    (|SDRAM_controller_s1_grant_vector);

  //SDRAM_controller_s1_end_xfer assignment, which is an e_assign
  assign SDRAM_controller_s1_end_xfer = ~(SDRAM_controller_s1_waits_for_read | SDRAM_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_SDRAM_controller_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SDRAM_controller_s1 = SDRAM_controller_s1_end_xfer & (~SDRAM_controller_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SDRAM_controller_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign SDRAM_controller_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_SDRAM_controller_s1 & SDRAM_controller_s1_allgrants) | (end_xfer_arb_share_counter_term_SDRAM_controller_s1 & ~SDRAM_controller_s1_non_bursting_master_requests);

  //SDRAM_controller_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_controller_s1_arb_share_counter <= 0;
      else if (SDRAM_controller_s1_arb_counter_enable)
          SDRAM_controller_s1_arb_share_counter <= SDRAM_controller_s1_arb_share_counter_next_value;
    end


  //SDRAM_controller_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_controller_s1_slavearbiterlockenable <= 0;
      else if ((|SDRAM_controller_s1_master_qreq_vector & end_xfer_arb_share_counter_term_SDRAM_controller_s1) | (end_xfer_arb_share_counter_term_SDRAM_controller_s1 & ~SDRAM_controller_s1_non_bursting_master_requests))
          SDRAM_controller_s1_slavearbiterlockenable <= |SDRAM_controller_s1_arb_share_counter_next_value;
    end


  //Lab2_SOPC_clock_1/out SDRAM_controller/s1 arbiterlock, which is an e_assign
  assign Lab2_SOPC_clock_1_out_arbiterlock = SDRAM_controller_s1_slavearbiterlockenable & Lab2_SOPC_clock_1_out_continuerequest;

  //SDRAM_controller_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SDRAM_controller_s1_slavearbiterlockenable2 = |SDRAM_controller_s1_arb_share_counter_next_value;

  //Lab2_SOPC_clock_1/out SDRAM_controller/s1 arbiterlock2, which is an e_assign
  assign Lab2_SOPC_clock_1_out_arbiterlock2 = SDRAM_controller_s1_slavearbiterlockenable2 & Lab2_SOPC_clock_1_out_continuerequest;

  //Lab2_SOPC_clock_2/out SDRAM_controller/s1 arbiterlock, which is an e_assign
  assign Lab2_SOPC_clock_2_out_arbiterlock = SDRAM_controller_s1_slavearbiterlockenable & Lab2_SOPC_clock_2_out_continuerequest;

  //Lab2_SOPC_clock_2/out SDRAM_controller/s1 arbiterlock2, which is an e_assign
  assign Lab2_SOPC_clock_2_out_arbiterlock2 = SDRAM_controller_s1_slavearbiterlockenable2 & Lab2_SOPC_clock_2_out_continuerequest;

  //Lab2_SOPC_clock_2/out granted SDRAM_controller/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_Lab2_SOPC_clock_2_out_granted_slave_SDRAM_controller_s1 <= 0;
      else 
        last_cycle_Lab2_SOPC_clock_2_out_granted_slave_SDRAM_controller_s1 <= Lab2_SOPC_clock_2_out_saved_grant_SDRAM_controller_s1 ? 1 : (SDRAM_controller_s1_arbitration_holdoff_internal | ~Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1) ? 0 : last_cycle_Lab2_SOPC_clock_2_out_granted_slave_SDRAM_controller_s1;
    end


  //Lab2_SOPC_clock_2_out_continuerequest continued request, which is an e_mux
  assign Lab2_SOPC_clock_2_out_continuerequest = last_cycle_Lab2_SOPC_clock_2_out_granted_slave_SDRAM_controller_s1 & Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1;

  //SDRAM_controller_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign SDRAM_controller_s1_any_continuerequest = Lab2_SOPC_clock_2_out_continuerequest |
    Lab2_SOPC_clock_1_out_continuerequest;

  assign Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1 = Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1 & ~((Lab2_SOPC_clock_1_out_read & ((|Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register))) | Lab2_SOPC_clock_2_out_arbiterlock);
  //unique name for SDRAM_controller_s1_move_on_to_next_transaction, which is an e_assign
  assign SDRAM_controller_s1_move_on_to_next_transaction = SDRAM_controller_s1_readdatavalid_from_sa;

  //rdv_fifo_for_Lab2_SOPC_clock_1_out_to_SDRAM_controller_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_Lab2_SOPC_clock_1_out_to_SDRAM_controller_s1_module rdv_fifo_for_Lab2_SOPC_clock_1_out_to_SDRAM_controller_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1),
      .data_out             (Lab2_SOPC_clock_1_out_rdv_fifo_output_from_SDRAM_controller_s1),
      .empty                (),
      .fifo_contains_ones_n (Lab2_SOPC_clock_1_out_rdv_fifo_empty_SDRAM_controller_s1),
      .full                 (),
      .read                 (SDRAM_controller_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SDRAM_controller_s1_waits_for_read)
    );

  assign Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register = ~Lab2_SOPC_clock_1_out_rdv_fifo_empty_SDRAM_controller_s1;
  //local readdatavalid Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1, which is an e_mux
  assign Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1 = (SDRAM_controller_s1_readdatavalid_from_sa & Lab2_SOPC_clock_1_out_rdv_fifo_output_from_SDRAM_controller_s1) & ~ Lab2_SOPC_clock_1_out_rdv_fifo_empty_SDRAM_controller_s1;

  //SDRAM_controller_s1_writedata mux, which is an e_mux
  assign SDRAM_controller_s1_writedata = (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1)? Lab2_SOPC_clock_1_out_writedata :
    Lab2_SOPC_clock_2_out_writedata;

  assign Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1 = (1) & (Lab2_SOPC_clock_2_out_read | Lab2_SOPC_clock_2_out_write);
  //Lab2_SOPC_clock_1/out granted SDRAM_controller/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_Lab2_SOPC_clock_1_out_granted_slave_SDRAM_controller_s1 <= 0;
      else 
        last_cycle_Lab2_SOPC_clock_1_out_granted_slave_SDRAM_controller_s1 <= Lab2_SOPC_clock_1_out_saved_grant_SDRAM_controller_s1 ? 1 : (SDRAM_controller_s1_arbitration_holdoff_internal | ~Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1) ? 0 : last_cycle_Lab2_SOPC_clock_1_out_granted_slave_SDRAM_controller_s1;
    end


  //Lab2_SOPC_clock_1_out_continuerequest continued request, which is an e_mux
  assign Lab2_SOPC_clock_1_out_continuerequest = last_cycle_Lab2_SOPC_clock_1_out_granted_slave_SDRAM_controller_s1 & Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1;

  assign Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1 = Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1 & ~((Lab2_SOPC_clock_2_out_read & ((|Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register))) | Lab2_SOPC_clock_1_out_arbiterlock);
  //rdv_fifo_for_Lab2_SOPC_clock_2_out_to_SDRAM_controller_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_Lab2_SOPC_clock_2_out_to_SDRAM_controller_s1_module rdv_fifo_for_Lab2_SOPC_clock_2_out_to_SDRAM_controller_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1),
      .data_out             (Lab2_SOPC_clock_2_out_rdv_fifo_output_from_SDRAM_controller_s1),
      .empty                (),
      .fifo_contains_ones_n (Lab2_SOPC_clock_2_out_rdv_fifo_empty_SDRAM_controller_s1),
      .full                 (),
      .read                 (SDRAM_controller_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~SDRAM_controller_s1_waits_for_read)
    );

  assign Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register = ~Lab2_SOPC_clock_2_out_rdv_fifo_empty_SDRAM_controller_s1;
  //local readdatavalid Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1, which is an e_mux
  assign Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1 = (SDRAM_controller_s1_readdatavalid_from_sa & Lab2_SOPC_clock_2_out_rdv_fifo_output_from_SDRAM_controller_s1) & ~ Lab2_SOPC_clock_2_out_rdv_fifo_empty_SDRAM_controller_s1;

  //allow new arb cycle for SDRAM_controller/s1, which is an e_assign
  assign SDRAM_controller_s1_allow_new_arb_cycle = ~Lab2_SOPC_clock_1_out_arbiterlock & ~Lab2_SOPC_clock_2_out_arbiterlock;

  //Lab2_SOPC_clock_2/out assignment into master qualified-requests vector for SDRAM_controller/s1, which is an e_assign
  assign SDRAM_controller_s1_master_qreq_vector[0] = Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1;

  //Lab2_SOPC_clock_2/out grant SDRAM_controller/s1, which is an e_assign
  assign Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1 = SDRAM_controller_s1_grant_vector[0];

  //Lab2_SOPC_clock_2/out saved-grant SDRAM_controller/s1, which is an e_assign
  assign Lab2_SOPC_clock_2_out_saved_grant_SDRAM_controller_s1 = SDRAM_controller_s1_arb_winner[0] && Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1;

  //Lab2_SOPC_clock_1/out assignment into master qualified-requests vector for SDRAM_controller/s1, which is an e_assign
  assign SDRAM_controller_s1_master_qreq_vector[1] = Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1;

  //Lab2_SOPC_clock_1/out grant SDRAM_controller/s1, which is an e_assign
  assign Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1 = SDRAM_controller_s1_grant_vector[1];

  //Lab2_SOPC_clock_1/out saved-grant SDRAM_controller/s1, which is an e_assign
  assign Lab2_SOPC_clock_1_out_saved_grant_SDRAM_controller_s1 = SDRAM_controller_s1_arb_winner[1] && Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1;

  //SDRAM_controller/s1 chosen-master double-vector, which is an e_assign
  assign SDRAM_controller_s1_chosen_master_double_vector = {SDRAM_controller_s1_master_qreq_vector, SDRAM_controller_s1_master_qreq_vector} & ({~SDRAM_controller_s1_master_qreq_vector, ~SDRAM_controller_s1_master_qreq_vector} + SDRAM_controller_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign SDRAM_controller_s1_arb_winner = (SDRAM_controller_s1_allow_new_arb_cycle & | SDRAM_controller_s1_grant_vector) ? SDRAM_controller_s1_grant_vector : SDRAM_controller_s1_saved_chosen_master_vector;

  //saved SDRAM_controller_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_controller_s1_saved_chosen_master_vector <= 0;
      else if (SDRAM_controller_s1_allow_new_arb_cycle)
          SDRAM_controller_s1_saved_chosen_master_vector <= |SDRAM_controller_s1_grant_vector ? SDRAM_controller_s1_grant_vector : SDRAM_controller_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign SDRAM_controller_s1_grant_vector = {(SDRAM_controller_s1_chosen_master_double_vector[1] | SDRAM_controller_s1_chosen_master_double_vector[3]),
    (SDRAM_controller_s1_chosen_master_double_vector[0] | SDRAM_controller_s1_chosen_master_double_vector[2])};

  //SDRAM_controller/s1 chosen master rotated left, which is an e_assign
  assign SDRAM_controller_s1_chosen_master_rot_left = (SDRAM_controller_s1_arb_winner << 1) ? (SDRAM_controller_s1_arb_winner << 1) : 1;

  //SDRAM_controller/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_controller_s1_arb_addend <= 1;
      else if (|SDRAM_controller_s1_grant_vector)
          SDRAM_controller_s1_arb_addend <= SDRAM_controller_s1_end_xfer? SDRAM_controller_s1_chosen_master_rot_left : SDRAM_controller_s1_grant_vector;
    end


  //SDRAM_controller_s1_reset_n assignment, which is an e_assign
  assign SDRAM_controller_s1_reset_n = reset_n;

  assign SDRAM_controller_s1_chipselect = Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1 | Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1;
  //SDRAM_controller_s1_firsttransfer first transaction, which is an e_assign
  assign SDRAM_controller_s1_firsttransfer = SDRAM_controller_s1_begins_xfer ? SDRAM_controller_s1_unreg_firsttransfer : SDRAM_controller_s1_reg_firsttransfer;

  //SDRAM_controller_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign SDRAM_controller_s1_unreg_firsttransfer = ~(SDRAM_controller_s1_slavearbiterlockenable & SDRAM_controller_s1_any_continuerequest);

  //SDRAM_controller_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SDRAM_controller_s1_reg_firsttransfer <= 1'b1;
      else if (SDRAM_controller_s1_begins_xfer)
          SDRAM_controller_s1_reg_firsttransfer <= SDRAM_controller_s1_unreg_firsttransfer;
    end


  //SDRAM_controller_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SDRAM_controller_s1_beginbursttransfer_internal = SDRAM_controller_s1_begins_xfer;

  //SDRAM_controller_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign SDRAM_controller_s1_arbitration_holdoff_internal = SDRAM_controller_s1_begins_xfer & SDRAM_controller_s1_firsttransfer;

  //~SDRAM_controller_s1_read_n assignment, which is an e_mux
  assign SDRAM_controller_s1_read_n = ~((Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1 & Lab2_SOPC_clock_1_out_read) | (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1 & Lab2_SOPC_clock_2_out_read));

  //~SDRAM_controller_s1_write_n assignment, which is an e_mux
  assign SDRAM_controller_s1_write_n = ~((Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1 & Lab2_SOPC_clock_1_out_write) | (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1 & Lab2_SOPC_clock_2_out_write));

  assign shifted_address_to_SDRAM_controller_s1_from_Lab2_SOPC_clock_1_out = Lab2_SOPC_clock_1_out_address_to_slave;
  //SDRAM_controller_s1_address mux, which is an e_mux
  assign SDRAM_controller_s1_address = (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1)? (shifted_address_to_SDRAM_controller_s1_from_Lab2_SOPC_clock_1_out >> 2) :
    (shifted_address_to_SDRAM_controller_s1_from_Lab2_SOPC_clock_2_out >> 2);

  assign shifted_address_to_SDRAM_controller_s1_from_Lab2_SOPC_clock_2_out = Lab2_SOPC_clock_2_out_address_to_slave;
  //d1_SDRAM_controller_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SDRAM_controller_s1_end_xfer <= 1;
      else 
        d1_SDRAM_controller_s1_end_xfer <= SDRAM_controller_s1_end_xfer;
    end


  //SDRAM_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign SDRAM_controller_s1_waits_for_read = SDRAM_controller_s1_in_a_read_cycle & SDRAM_controller_s1_waitrequest_from_sa;

  //SDRAM_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign SDRAM_controller_s1_in_a_read_cycle = (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1 & Lab2_SOPC_clock_1_out_read) | (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1 & Lab2_SOPC_clock_2_out_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SDRAM_controller_s1_in_a_read_cycle;

  //SDRAM_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign SDRAM_controller_s1_waits_for_write = SDRAM_controller_s1_in_a_write_cycle & SDRAM_controller_s1_waitrequest_from_sa;

  //SDRAM_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign SDRAM_controller_s1_in_a_write_cycle = (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1 & Lab2_SOPC_clock_1_out_write) | (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1 & Lab2_SOPC_clock_2_out_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SDRAM_controller_s1_in_a_write_cycle;

  assign wait_for_SDRAM_controller_s1_counter = 0;
  //~SDRAM_controller_s1_byteenable_n byte enable port mux, which is an e_mux
  assign SDRAM_controller_s1_byteenable_n = ~((Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1)? Lab2_SOPC_clock_1_out_byteenable :
    (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1)? Lab2_SOPC_clock_2_out_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SDRAM_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1 + Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (Lab2_SOPC_clock_1_out_saved_grant_SDRAM_controller_s1 + Lab2_SOPC_clock_2_out_saved_grant_SDRAM_controller_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SSRAM_bridge_avalon_slave_arbitrator (
                                              // inputs:
                                               CPU_data_master_address_to_slave,
                                               CPU_data_master_byteenable,
                                               CPU_data_master_latency_counter,
                                               CPU_data_master_read,
                                               CPU_data_master_write,
                                               CPU_data_master_writedata,
                                               CPU_instruction_master_address_to_slave,
                                               CPU_instruction_master_latency_counter,
                                               CPU_instruction_master_read,
                                               clk,
                                               reset_n,

                                              // outputs:
                                               CPU_data_master_granted_SSRAM_controller_s1,
                                               CPU_data_master_qualified_request_SSRAM_controller_s1,
                                               CPU_data_master_read_data_valid_SSRAM_controller_s1,
                                               CPU_data_master_requests_SSRAM_controller_s1,
                                               CPU_instruction_master_granted_SSRAM_controller_s1,
                                               CPU_instruction_master_qualified_request_SSRAM_controller_s1,
                                               CPU_instruction_master_read_data_valid_SSRAM_controller_s1,
                                               CPU_instruction_master_requests_SSRAM_controller_s1,
                                               address_to_the_SSRAM_controller,
                                               adsc_n_to_the_SSRAM_controller,
                                               bw_n_to_the_SSRAM_controller,
                                               bwe_n_to_the_SSRAM_controller,
                                               chipenable1_n_to_the_SSRAM_controller,
                                               d1_SSRAM_bridge_avalon_slave_end_xfer,
                                               data_to_and_from_the_SSRAM_controller,
                                               incoming_data_to_and_from_the_SSRAM_controller,
                                               outputenable_n_to_the_SSRAM_controller,
                                               reset_n_to_the_SSRAM_controller
                                            )
;

  output           CPU_data_master_granted_SSRAM_controller_s1;
  output           CPU_data_master_qualified_request_SSRAM_controller_s1;
  output           CPU_data_master_read_data_valid_SSRAM_controller_s1;
  output           CPU_data_master_requests_SSRAM_controller_s1;
  output           CPU_instruction_master_granted_SSRAM_controller_s1;
  output           CPU_instruction_master_qualified_request_SSRAM_controller_s1;
  output           CPU_instruction_master_read_data_valid_SSRAM_controller_s1;
  output           CPU_instruction_master_requests_SSRAM_controller_s1;
  output  [ 20: 0] address_to_the_SSRAM_controller;
  output           adsc_n_to_the_SSRAM_controller;
  output  [  3: 0] bw_n_to_the_SSRAM_controller;
  output           bwe_n_to_the_SSRAM_controller;
  output           chipenable1_n_to_the_SSRAM_controller;
  output           d1_SSRAM_bridge_avalon_slave_end_xfer;
  inout   [ 31: 0] data_to_and_from_the_SSRAM_controller;
  output  [ 31: 0] incoming_data_to_and_from_the_SSRAM_controller;
  output           outputenable_n_to_the_SSRAM_controller;
  output           reset_n_to_the_SSRAM_controller;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input   [  2: 0] CPU_instruction_master_latency_counter;
  input            CPU_instruction_master_read;
  input            clk;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_SSRAM_controller_s1;
  wire             CPU_data_master_qualified_request_SSRAM_controller_s1;
  wire             CPU_data_master_read_data_valid_SSRAM_controller_s1;
  reg     [  3: 0] CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register;
  wire             CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register_in;
  wire             CPU_data_master_requests_SSRAM_controller_s1;
  wire             CPU_data_master_saved_grant_SSRAM_controller_s1;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_SSRAM_controller_s1;
  wire             CPU_instruction_master_qualified_request_SSRAM_controller_s1;
  wire             CPU_instruction_master_read_data_valid_SSRAM_controller_s1;
  reg     [  3: 0] CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register;
  wire             CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register_in;
  wire             CPU_instruction_master_requests_SSRAM_controller_s1;
  wire             CPU_instruction_master_saved_grant_SSRAM_controller_s1;
  wire             SSRAM_bridge_avalon_slave_allgrants;
  wire             SSRAM_bridge_avalon_slave_allow_new_arb_cycle;
  wire             SSRAM_bridge_avalon_slave_any_bursting_master_saved_grant;
  wire             SSRAM_bridge_avalon_slave_any_continuerequest;
  reg     [  1: 0] SSRAM_bridge_avalon_slave_arb_addend;
  wire             SSRAM_bridge_avalon_slave_arb_counter_enable;
  reg     [  1: 0] SSRAM_bridge_avalon_slave_arb_share_counter;
  wire    [  1: 0] SSRAM_bridge_avalon_slave_arb_share_counter_next_value;
  wire    [  1: 0] SSRAM_bridge_avalon_slave_arb_share_set_values;
  wire    [  1: 0] SSRAM_bridge_avalon_slave_arb_winner;
  wire             SSRAM_bridge_avalon_slave_arbitration_holdoff_internal;
  wire             SSRAM_bridge_avalon_slave_beginbursttransfer_internal;
  wire             SSRAM_bridge_avalon_slave_begins_xfer;
  wire    [  3: 0] SSRAM_bridge_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] SSRAM_bridge_avalon_slave_chosen_master_rot_left;
  wire             SSRAM_bridge_avalon_slave_end_xfer;
  wire             SSRAM_bridge_avalon_slave_firsttransfer;
  wire    [  1: 0] SSRAM_bridge_avalon_slave_grant_vector;
  wire    [  1: 0] SSRAM_bridge_avalon_slave_master_qreq_vector;
  wire             SSRAM_bridge_avalon_slave_non_bursting_master_requests;
  wire             SSRAM_bridge_avalon_slave_read_pending;
  reg              SSRAM_bridge_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] SSRAM_bridge_avalon_slave_saved_chosen_master_vector;
  reg              SSRAM_bridge_avalon_slave_slavearbiterlockenable;
  wire             SSRAM_bridge_avalon_slave_slavearbiterlockenable2;
  wire             SSRAM_bridge_avalon_slave_unreg_firsttransfer;
  wire             SSRAM_bridge_avalon_slave_write_pending;
  wire             SSRAM_controller_s1_in_a_read_cycle;
  wire             SSRAM_controller_s1_in_a_write_cycle;
  wire             SSRAM_controller_s1_waits_for_read;
  wire             SSRAM_controller_s1_waits_for_write;
  wire             SSRAM_controller_s1_with_write_latency;
  reg     [ 20: 0] address_to_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              adsc_n_to_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg     [  3: 0] bw_n_to_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              bwe_n_to_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              chipenable1_n_to_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_SSRAM_bridge_avalon_slave_end_xfer;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [ 31: 0] d1_outgoing_data_to_and_from_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  wire    [ 31: 0] data_to_and_from_the_SSRAM_controller;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_SSRAM_bridge_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [ 31: 0] incoming_data_to_and_from_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  reg              last_cycle_CPU_data_master_granted_slave_SSRAM_controller_s1;
  reg              last_cycle_CPU_instruction_master_granted_slave_SSRAM_controller_s1;
  wire    [ 31: 0] outgoing_data_to_and_from_the_SSRAM_controller;
  reg              outputenable_n_to_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire    [  3: 0] p1_CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register;
  wire    [  3: 0] p1_CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register;
  wire    [ 20: 0] p1_address_to_the_SSRAM_controller;
  wire             p1_adsc_n_to_the_SSRAM_controller;
  wire    [  3: 0] p1_bw_n_to_the_SSRAM_controller;
  wire             p1_bwe_n_to_the_SSRAM_controller;
  wire             p1_chipenable1_n_to_the_SSRAM_controller;
  wire             p1_outputenable_n_to_the_SSRAM_controller;
  wire             p1_reset_n_to_the_SSRAM_controller;
  reg              reset_n_to_the_SSRAM_controller /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             wait_for_SSRAM_controller_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~SSRAM_bridge_avalon_slave_end_xfer;
    end


  assign SSRAM_bridge_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_SSRAM_controller_s1 | CPU_instruction_master_qualified_request_SSRAM_controller_s1));
  assign CPU_data_master_requests_SSRAM_controller_s1 = ({CPU_data_master_address_to_slave[27 : 21] , 21'b0} == 28'h9200000) & (CPU_data_master_read | CPU_data_master_write);
  //~chipenable1_n_to_the_SSRAM_controller of type chipselect to ~p1_chipenable1_n_to_the_SSRAM_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          chipenable1_n_to_the_SSRAM_controller <= ~0;
      else 
        chipenable1_n_to_the_SSRAM_controller <= p1_chipenable1_n_to_the_SSRAM_controller;
    end


  assign SSRAM_bridge_avalon_slave_write_pending = 0;
  //SSRAM_bridge/avalon_slave read pending calc, which is an e_assign
  assign SSRAM_bridge_avalon_slave_read_pending = (|CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]) | (|CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]);

  //SSRAM_bridge_avalon_slave_arb_share_counter set values, which is an e_mux
  assign SSRAM_bridge_avalon_slave_arb_share_set_values = 1;

  //SSRAM_bridge_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign SSRAM_bridge_avalon_slave_non_bursting_master_requests = CPU_data_master_requests_SSRAM_controller_s1 |
    CPU_instruction_master_requests_SSRAM_controller_s1 |
    CPU_data_master_requests_SSRAM_controller_s1 |
    CPU_instruction_master_requests_SSRAM_controller_s1;

  //SSRAM_bridge_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign SSRAM_bridge_avalon_slave_any_bursting_master_saved_grant = 0;

  //SSRAM_bridge_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign SSRAM_bridge_avalon_slave_arb_share_counter_next_value = SSRAM_bridge_avalon_slave_firsttransfer ? (SSRAM_bridge_avalon_slave_arb_share_set_values - 1) : |SSRAM_bridge_avalon_slave_arb_share_counter ? (SSRAM_bridge_avalon_slave_arb_share_counter - 1) : 0;

  //SSRAM_bridge_avalon_slave_allgrants all slave grants, which is an e_mux
  assign SSRAM_bridge_avalon_slave_allgrants = (|SSRAM_bridge_avalon_slave_grant_vector) |
    (|SSRAM_bridge_avalon_slave_grant_vector) |
    (|SSRAM_bridge_avalon_slave_grant_vector) |
    (|SSRAM_bridge_avalon_slave_grant_vector);

  //SSRAM_bridge_avalon_slave_end_xfer assignment, which is an e_assign
  assign SSRAM_bridge_avalon_slave_end_xfer = ~(SSRAM_controller_s1_waits_for_read | SSRAM_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_SSRAM_bridge_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_SSRAM_bridge_avalon_slave = SSRAM_bridge_avalon_slave_end_xfer & (~SSRAM_bridge_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //SSRAM_bridge_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign SSRAM_bridge_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_SSRAM_bridge_avalon_slave & SSRAM_bridge_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_SSRAM_bridge_avalon_slave & ~SSRAM_bridge_avalon_slave_non_bursting_master_requests);

  //SSRAM_bridge_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SSRAM_bridge_avalon_slave_arb_share_counter <= 0;
      else if (SSRAM_bridge_avalon_slave_arb_counter_enable)
          SSRAM_bridge_avalon_slave_arb_share_counter <= SSRAM_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //SSRAM_bridge_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SSRAM_bridge_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|SSRAM_bridge_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_SSRAM_bridge_avalon_slave) | (end_xfer_arb_share_counter_term_SSRAM_bridge_avalon_slave & ~SSRAM_bridge_avalon_slave_non_bursting_master_requests))
          SSRAM_bridge_avalon_slave_slavearbiterlockenable <= |SSRAM_bridge_avalon_slave_arb_share_counter_next_value;
    end


  //CPU/data_master SSRAM_bridge/avalon_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = SSRAM_bridge_avalon_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //SSRAM_bridge_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign SSRAM_bridge_avalon_slave_slavearbiterlockenable2 = |SSRAM_bridge_avalon_slave_arb_share_counter_next_value;

  //CPU/data_master SSRAM_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = SSRAM_bridge_avalon_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master SSRAM_bridge/avalon_slave arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = SSRAM_bridge_avalon_slave_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master SSRAM_bridge/avalon_slave arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = SSRAM_bridge_avalon_slave_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted SSRAM_controller/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_SSRAM_controller_s1 <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_SSRAM_controller_s1 <= CPU_instruction_master_saved_grant_SSRAM_controller_s1 ? 1 : (SSRAM_bridge_avalon_slave_arbitration_holdoff_internal | ~CPU_instruction_master_requests_SSRAM_controller_s1) ? 0 : last_cycle_CPU_instruction_master_granted_slave_SSRAM_controller_s1;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_SSRAM_controller_s1 & CPU_instruction_master_requests_SSRAM_controller_s1;

  //SSRAM_bridge_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign SSRAM_bridge_avalon_slave_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_SSRAM_controller_s1 = CPU_data_master_requests_SSRAM_controller_s1 & ~((CPU_data_master_read & (SSRAM_bridge_avalon_slave_write_pending | (SSRAM_bridge_avalon_slave_read_pending & !((((|CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]) | (|CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]))))) | (4 < CPU_data_master_latency_counter))) | ((SSRAM_bridge_avalon_slave_read_pending) & CPU_data_master_write) | CPU_instruction_master_arbiterlock);
  //CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register_in = CPU_data_master_granted_SSRAM_controller_s1 & CPU_data_master_read & ~SSRAM_controller_s1_waits_for_read;

  //shift register p1 CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register = {CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register, CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register_in};

  //CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register <= p1_CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_SSRAM_controller_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_SSRAM_controller_s1 = CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register[3];

  //data_to_and_from_the_SSRAM_controller register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_data_to_and_from_the_SSRAM_controller <= 0;
      else 
        incoming_data_to_and_from_the_SSRAM_controller <= data_to_and_from_the_SSRAM_controller;
    end


  //SSRAM_controller_s1_with_write_latency assignment, which is an e_assign
  assign SSRAM_controller_s1_with_write_latency = in_a_write_cycle & (CPU_data_master_qualified_request_SSRAM_controller_s1 | CPU_instruction_master_qualified_request_SSRAM_controller_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (SSRAM_controller_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_SSRAM_controller register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_SSRAM_controller <= 0;
      else 
        d1_outgoing_data_to_and_from_the_SSRAM_controller <= outgoing_data_to_and_from_the_SSRAM_controller;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_SSRAM_controller tristate driver, which is an e_assign
  assign data_to_and_from_the_SSRAM_controller = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_SSRAM_controller:{32{1'bz}};

  //outgoing_data_to_and_from_the_SSRAM_controller mux, which is an e_mux
  assign outgoing_data_to_and_from_the_SSRAM_controller = CPU_data_master_writedata;

  assign CPU_instruction_master_requests_SSRAM_controller_s1 = (({CPU_instruction_master_address_to_slave[27 : 21] , 21'b0} == 28'h9200000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted SSRAM_controller/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_SSRAM_controller_s1 <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_SSRAM_controller_s1 <= CPU_data_master_saved_grant_SSRAM_controller_s1 ? 1 : (SSRAM_bridge_avalon_slave_arbitration_holdoff_internal | ~CPU_data_master_requests_SSRAM_controller_s1) ? 0 : last_cycle_CPU_data_master_granted_slave_SSRAM_controller_s1;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_SSRAM_controller_s1 & CPU_data_master_requests_SSRAM_controller_s1;

  assign CPU_instruction_master_qualified_request_SSRAM_controller_s1 = CPU_instruction_master_requests_SSRAM_controller_s1 & ~((CPU_instruction_master_read & (SSRAM_bridge_avalon_slave_write_pending | (SSRAM_bridge_avalon_slave_read_pending & !((((|CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]) | (|CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]))))) | (4 < CPU_instruction_master_latency_counter))) | CPU_data_master_arbiterlock);
  //CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register_in = CPU_instruction_master_granted_SSRAM_controller_s1 & CPU_instruction_master_read & ~SSRAM_controller_s1_waits_for_read;

  //shift register p1 CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register = {CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register, CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register_in};

  //CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register <= 0;
      else 
        CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register <= p1_CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register;
    end


  //local readdatavalid CPU_instruction_master_read_data_valid_SSRAM_controller_s1, which is an e_mux
  assign CPU_instruction_master_read_data_valid_SSRAM_controller_s1 = CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register[3];

  //allow new arb cycle for SSRAM_bridge/avalon_slave, which is an e_assign
  assign SSRAM_bridge_avalon_slave_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for SSRAM_controller/s1, which is an e_assign
  assign SSRAM_bridge_avalon_slave_master_qreq_vector[0] = CPU_instruction_master_qualified_request_SSRAM_controller_s1;

  //CPU/instruction_master grant SSRAM_controller/s1, which is an e_assign
  assign CPU_instruction_master_granted_SSRAM_controller_s1 = SSRAM_bridge_avalon_slave_grant_vector[0];

  //CPU/instruction_master saved-grant SSRAM_controller/s1, which is an e_assign
  assign CPU_instruction_master_saved_grant_SSRAM_controller_s1 = SSRAM_bridge_avalon_slave_arb_winner[0] && CPU_instruction_master_requests_SSRAM_controller_s1;

  //CPU/data_master assignment into master qualified-requests vector for SSRAM_controller/s1, which is an e_assign
  assign SSRAM_bridge_avalon_slave_master_qreq_vector[1] = CPU_data_master_qualified_request_SSRAM_controller_s1;

  //CPU/data_master grant SSRAM_controller/s1, which is an e_assign
  assign CPU_data_master_granted_SSRAM_controller_s1 = SSRAM_bridge_avalon_slave_grant_vector[1];

  //CPU/data_master saved-grant SSRAM_controller/s1, which is an e_assign
  assign CPU_data_master_saved_grant_SSRAM_controller_s1 = SSRAM_bridge_avalon_slave_arb_winner[1] && CPU_data_master_requests_SSRAM_controller_s1;

  //SSRAM_bridge/avalon_slave chosen-master double-vector, which is an e_assign
  assign SSRAM_bridge_avalon_slave_chosen_master_double_vector = {SSRAM_bridge_avalon_slave_master_qreq_vector, SSRAM_bridge_avalon_slave_master_qreq_vector} & ({~SSRAM_bridge_avalon_slave_master_qreq_vector, ~SSRAM_bridge_avalon_slave_master_qreq_vector} + SSRAM_bridge_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign SSRAM_bridge_avalon_slave_arb_winner = (SSRAM_bridge_avalon_slave_allow_new_arb_cycle & | SSRAM_bridge_avalon_slave_grant_vector) ? SSRAM_bridge_avalon_slave_grant_vector : SSRAM_bridge_avalon_slave_saved_chosen_master_vector;

  //saved SSRAM_bridge_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SSRAM_bridge_avalon_slave_saved_chosen_master_vector <= 0;
      else if (SSRAM_bridge_avalon_slave_allow_new_arb_cycle)
          SSRAM_bridge_avalon_slave_saved_chosen_master_vector <= |SSRAM_bridge_avalon_slave_grant_vector ? SSRAM_bridge_avalon_slave_grant_vector : SSRAM_bridge_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign SSRAM_bridge_avalon_slave_grant_vector = {(SSRAM_bridge_avalon_slave_chosen_master_double_vector[1] | SSRAM_bridge_avalon_slave_chosen_master_double_vector[3]),
    (SSRAM_bridge_avalon_slave_chosen_master_double_vector[0] | SSRAM_bridge_avalon_slave_chosen_master_double_vector[2])};

  //SSRAM_bridge/avalon_slave chosen master rotated left, which is an e_assign
  assign SSRAM_bridge_avalon_slave_chosen_master_rot_left = (SSRAM_bridge_avalon_slave_arb_winner << 1) ? (SSRAM_bridge_avalon_slave_arb_winner << 1) : 1;

  //SSRAM_bridge/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SSRAM_bridge_avalon_slave_arb_addend <= 1;
      else if (|SSRAM_bridge_avalon_slave_grant_vector)
          SSRAM_bridge_avalon_slave_arb_addend <= SSRAM_bridge_avalon_slave_end_xfer? SSRAM_bridge_avalon_slave_chosen_master_rot_left : SSRAM_bridge_avalon_slave_grant_vector;
    end


  //~adsc_n_to_the_SSRAM_controller of type begintransfer to ~p1_adsc_n_to_the_SSRAM_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          adsc_n_to_the_SSRAM_controller <= ~0;
      else 
        adsc_n_to_the_SSRAM_controller <= p1_adsc_n_to_the_SSRAM_controller;
    end


  assign p1_adsc_n_to_the_SSRAM_controller = ~SSRAM_bridge_avalon_slave_begins_xfer;
  //~outputenable_n_to_the_SSRAM_controller of type outputenable to ~p1_outputenable_n_to_the_SSRAM_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          outputenable_n_to_the_SSRAM_controller <= ~0;
      else 
        outputenable_n_to_the_SSRAM_controller <= p1_outputenable_n_to_the_SSRAM_controller;
    end


  //~p1_outputenable_n_to_the_SSRAM_controller assignment, which is an e_mux
  assign p1_outputenable_n_to_the_SSRAM_controller = ~((|CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]) | (|CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]) | SSRAM_controller_s1_in_a_read_cycle);

  //reset_n_to_the_SSRAM_controller of type reset_n to p1_reset_n_to_the_SSRAM_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          reset_n_to_the_SSRAM_controller <= 0;
      else 
        reset_n_to_the_SSRAM_controller <= p1_reset_n_to_the_SSRAM_controller;
    end


  //p1_reset_n_to_the_SSRAM_controller assignment, which is an e_assign
  assign p1_reset_n_to_the_SSRAM_controller = reset_n;

  assign p1_chipenable1_n_to_the_SSRAM_controller = ~(CPU_data_master_granted_SSRAM_controller_s1 | CPU_instruction_master_granted_SSRAM_controller_s1 | (|CPU_data_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]) | (|CPU_instruction_master_read_data_valid_SSRAM_controller_s1_shift_register[1 : 0]));
  //SSRAM_bridge_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign SSRAM_bridge_avalon_slave_firsttransfer = SSRAM_bridge_avalon_slave_begins_xfer ? SSRAM_bridge_avalon_slave_unreg_firsttransfer : SSRAM_bridge_avalon_slave_reg_firsttransfer;

  //SSRAM_bridge_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign SSRAM_bridge_avalon_slave_unreg_firsttransfer = ~(SSRAM_bridge_avalon_slave_slavearbiterlockenable & SSRAM_bridge_avalon_slave_any_continuerequest);

  //SSRAM_bridge_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          SSRAM_bridge_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (SSRAM_bridge_avalon_slave_begins_xfer)
          SSRAM_bridge_avalon_slave_reg_firsttransfer <= SSRAM_bridge_avalon_slave_unreg_firsttransfer;
    end


  //SSRAM_bridge_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign SSRAM_bridge_avalon_slave_beginbursttransfer_internal = SSRAM_bridge_avalon_slave_begins_xfer;

  //SSRAM_bridge_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign SSRAM_bridge_avalon_slave_arbitration_holdoff_internal = SSRAM_bridge_avalon_slave_begins_xfer & SSRAM_bridge_avalon_slave_firsttransfer;

  //~bwe_n_to_the_SSRAM_controller of type write to ~p1_bwe_n_to_the_SSRAM_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          bwe_n_to_the_SSRAM_controller <= ~0;
      else 
        bwe_n_to_the_SSRAM_controller <= p1_bwe_n_to_the_SSRAM_controller;
    end


  //~bw_n_to_the_SSRAM_controller of type byteenable to ~p1_bw_n_to_the_SSRAM_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          bw_n_to_the_SSRAM_controller <= ~0;
      else 
        bw_n_to_the_SSRAM_controller <= p1_bw_n_to_the_SSRAM_controller;
    end


  //~p1_bwe_n_to_the_SSRAM_controller assignment, which is an e_mux
  assign p1_bwe_n_to_the_SSRAM_controller = ~(CPU_data_master_granted_SSRAM_controller_s1 & CPU_data_master_write);

  //address_to_the_SSRAM_controller of type address to p1_address_to_the_SSRAM_controller, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_SSRAM_controller <= 0;
      else 
        address_to_the_SSRAM_controller <= p1_address_to_the_SSRAM_controller;
    end


  //p1_address_to_the_SSRAM_controller mux, which is an e_mux
  assign p1_address_to_the_SSRAM_controller = (CPU_data_master_granted_SSRAM_controller_s1)? CPU_data_master_address_to_slave :
    CPU_instruction_master_address_to_slave;

  //d1_SSRAM_bridge_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_SSRAM_bridge_avalon_slave_end_xfer <= 1;
      else 
        d1_SSRAM_bridge_avalon_slave_end_xfer <= SSRAM_bridge_avalon_slave_end_xfer;
    end


  //SSRAM_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign SSRAM_controller_s1_waits_for_read = SSRAM_controller_s1_in_a_read_cycle & 0;

  //SSRAM_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign SSRAM_controller_s1_in_a_read_cycle = (CPU_data_master_granted_SSRAM_controller_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_SSRAM_controller_s1 & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = SSRAM_controller_s1_in_a_read_cycle;

  //SSRAM_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign SSRAM_controller_s1_waits_for_write = SSRAM_controller_s1_in_a_write_cycle & 0;

  //SSRAM_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign SSRAM_controller_s1_in_a_write_cycle = CPU_data_master_granted_SSRAM_controller_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = SSRAM_controller_s1_in_a_write_cycle;

  assign wait_for_SSRAM_controller_s1_counter = 0;
  //~p1_bw_n_to_the_SSRAM_controller byte enable port mux, which is an e_mux
  assign p1_bw_n_to_the_SSRAM_controller = ~((CPU_data_master_granted_SSRAM_controller_s1)? CPU_data_master_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //SSRAM_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_granted_SSRAM_controller_s1 + CPU_instruction_master_granted_SSRAM_controller_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_SSRAM_controller_s1 + CPU_instruction_master_saved_grant_SSRAM_controller_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SSRAM_bridge_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module green_LEDs_controller_s1_arbitrator (
                                             // inputs:
                                              CPU_data_master_address_to_slave,
                                              CPU_data_master_byteenable,
                                              CPU_data_master_latency_counter,
                                              CPU_data_master_read,
                                              CPU_data_master_write,
                                              CPU_data_master_writedata,
                                              clk,
                                              green_LEDs_controller_s1_readdata,
                                              reset_n,

                                             // outputs:
                                              CPU_data_master_granted_green_LEDs_controller_s1,
                                              CPU_data_master_qualified_request_green_LEDs_controller_s1,
                                              CPU_data_master_read_data_valid_green_LEDs_controller_s1,
                                              CPU_data_master_requests_green_LEDs_controller_s1,
                                              d1_green_LEDs_controller_s1_end_xfer,
                                              green_LEDs_controller_s1_address,
                                              green_LEDs_controller_s1_chipselect,
                                              green_LEDs_controller_s1_readdata_from_sa,
                                              green_LEDs_controller_s1_reset_n,
                                              green_LEDs_controller_s1_write_n,
                                              green_LEDs_controller_s1_writedata
                                           )
;

  output           CPU_data_master_granted_green_LEDs_controller_s1;
  output           CPU_data_master_qualified_request_green_LEDs_controller_s1;
  output           CPU_data_master_read_data_valid_green_LEDs_controller_s1;
  output           CPU_data_master_requests_green_LEDs_controller_s1;
  output           d1_green_LEDs_controller_s1_end_xfer;
  output  [  1: 0] green_LEDs_controller_s1_address;
  output           green_LEDs_controller_s1_chipselect;
  output  [  7: 0] green_LEDs_controller_s1_readdata_from_sa;
  output           green_LEDs_controller_s1_reset_n;
  output           green_LEDs_controller_s1_write_n;
  output  [  7: 0] green_LEDs_controller_s1_writedata;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            clk;
  input   [  7: 0] green_LEDs_controller_s1_readdata;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_green_LEDs_controller_s1;
  wire             CPU_data_master_qualified_request_green_LEDs_controller_s1;
  wire             CPU_data_master_read_data_valid_green_LEDs_controller_s1;
  wire             CPU_data_master_requests_green_LEDs_controller_s1;
  wire             CPU_data_master_saved_grant_green_LEDs_controller_s1;
  reg              d1_green_LEDs_controller_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_green_LEDs_controller_s1;
  wire    [  1: 0] green_LEDs_controller_s1_address;
  wire             green_LEDs_controller_s1_allgrants;
  wire             green_LEDs_controller_s1_allow_new_arb_cycle;
  wire             green_LEDs_controller_s1_any_bursting_master_saved_grant;
  wire             green_LEDs_controller_s1_any_continuerequest;
  wire             green_LEDs_controller_s1_arb_counter_enable;
  reg     [  1: 0] green_LEDs_controller_s1_arb_share_counter;
  wire    [  1: 0] green_LEDs_controller_s1_arb_share_counter_next_value;
  wire    [  1: 0] green_LEDs_controller_s1_arb_share_set_values;
  wire             green_LEDs_controller_s1_beginbursttransfer_internal;
  wire             green_LEDs_controller_s1_begins_xfer;
  wire             green_LEDs_controller_s1_chipselect;
  wire             green_LEDs_controller_s1_end_xfer;
  wire             green_LEDs_controller_s1_firsttransfer;
  wire             green_LEDs_controller_s1_grant_vector;
  wire             green_LEDs_controller_s1_in_a_read_cycle;
  wire             green_LEDs_controller_s1_in_a_write_cycle;
  wire             green_LEDs_controller_s1_master_qreq_vector;
  wire             green_LEDs_controller_s1_non_bursting_master_requests;
  wire             green_LEDs_controller_s1_pretend_byte_enable;
  wire    [  7: 0] green_LEDs_controller_s1_readdata_from_sa;
  reg              green_LEDs_controller_s1_reg_firsttransfer;
  wire             green_LEDs_controller_s1_reset_n;
  reg              green_LEDs_controller_s1_slavearbiterlockenable;
  wire             green_LEDs_controller_s1_slavearbiterlockenable2;
  wire             green_LEDs_controller_s1_unreg_firsttransfer;
  wire             green_LEDs_controller_s1_waits_for_read;
  wire             green_LEDs_controller_s1_waits_for_write;
  wire             green_LEDs_controller_s1_write_n;
  wire    [  7: 0] green_LEDs_controller_s1_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_green_LEDs_controller_s1_from_CPU_data_master;
  wire             wait_for_green_LEDs_controller_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~green_LEDs_controller_s1_end_xfer;
    end


  assign green_LEDs_controller_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_green_LEDs_controller_s1));
  //assign green_LEDs_controller_s1_readdata_from_sa = green_LEDs_controller_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign green_LEDs_controller_s1_readdata_from_sa = green_LEDs_controller_s1_readdata;

  assign CPU_data_master_requests_green_LEDs_controller_s1 = ({CPU_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h94110b0) & (CPU_data_master_read | CPU_data_master_write);
  //green_LEDs_controller_s1_arb_share_counter set values, which is an e_mux
  assign green_LEDs_controller_s1_arb_share_set_values = 1;

  //green_LEDs_controller_s1_non_bursting_master_requests mux, which is an e_mux
  assign green_LEDs_controller_s1_non_bursting_master_requests = CPU_data_master_requests_green_LEDs_controller_s1;

  //green_LEDs_controller_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign green_LEDs_controller_s1_any_bursting_master_saved_grant = 0;

  //green_LEDs_controller_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign green_LEDs_controller_s1_arb_share_counter_next_value = green_LEDs_controller_s1_firsttransfer ? (green_LEDs_controller_s1_arb_share_set_values - 1) : |green_LEDs_controller_s1_arb_share_counter ? (green_LEDs_controller_s1_arb_share_counter - 1) : 0;

  //green_LEDs_controller_s1_allgrants all slave grants, which is an e_mux
  assign green_LEDs_controller_s1_allgrants = |green_LEDs_controller_s1_grant_vector;

  //green_LEDs_controller_s1_end_xfer assignment, which is an e_assign
  assign green_LEDs_controller_s1_end_xfer = ~(green_LEDs_controller_s1_waits_for_read | green_LEDs_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_green_LEDs_controller_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_green_LEDs_controller_s1 = green_LEDs_controller_s1_end_xfer & (~green_LEDs_controller_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //green_LEDs_controller_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign green_LEDs_controller_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_green_LEDs_controller_s1 & green_LEDs_controller_s1_allgrants) | (end_xfer_arb_share_counter_term_green_LEDs_controller_s1 & ~green_LEDs_controller_s1_non_bursting_master_requests);

  //green_LEDs_controller_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          green_LEDs_controller_s1_arb_share_counter <= 0;
      else if (green_LEDs_controller_s1_arb_counter_enable)
          green_LEDs_controller_s1_arb_share_counter <= green_LEDs_controller_s1_arb_share_counter_next_value;
    end


  //green_LEDs_controller_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          green_LEDs_controller_s1_slavearbiterlockenable <= 0;
      else if ((|green_LEDs_controller_s1_master_qreq_vector & end_xfer_arb_share_counter_term_green_LEDs_controller_s1) | (end_xfer_arb_share_counter_term_green_LEDs_controller_s1 & ~green_LEDs_controller_s1_non_bursting_master_requests))
          green_LEDs_controller_s1_slavearbiterlockenable <= |green_LEDs_controller_s1_arb_share_counter_next_value;
    end


  //CPU/data_master green_LEDs_controller/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = green_LEDs_controller_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //green_LEDs_controller_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign green_LEDs_controller_s1_slavearbiterlockenable2 = |green_LEDs_controller_s1_arb_share_counter_next_value;

  //CPU/data_master green_LEDs_controller/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = green_LEDs_controller_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //green_LEDs_controller_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign green_LEDs_controller_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_green_LEDs_controller_s1 = CPU_data_master_requests_green_LEDs_controller_s1 & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_green_LEDs_controller_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_green_LEDs_controller_s1 = CPU_data_master_granted_green_LEDs_controller_s1 & CPU_data_master_read & ~green_LEDs_controller_s1_waits_for_read;

  //green_LEDs_controller_s1_writedata mux, which is an e_mux
  assign green_LEDs_controller_s1_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_green_LEDs_controller_s1 = CPU_data_master_qualified_request_green_LEDs_controller_s1;

  //CPU/data_master saved-grant green_LEDs_controller/s1, which is an e_assign
  assign CPU_data_master_saved_grant_green_LEDs_controller_s1 = CPU_data_master_requests_green_LEDs_controller_s1;

  //allow new arb cycle for green_LEDs_controller/s1, which is an e_assign
  assign green_LEDs_controller_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign green_LEDs_controller_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign green_LEDs_controller_s1_master_qreq_vector = 1;

  //green_LEDs_controller_s1_reset_n assignment, which is an e_assign
  assign green_LEDs_controller_s1_reset_n = reset_n;

  assign green_LEDs_controller_s1_chipselect = CPU_data_master_granted_green_LEDs_controller_s1;
  //green_LEDs_controller_s1_firsttransfer first transaction, which is an e_assign
  assign green_LEDs_controller_s1_firsttransfer = green_LEDs_controller_s1_begins_xfer ? green_LEDs_controller_s1_unreg_firsttransfer : green_LEDs_controller_s1_reg_firsttransfer;

  //green_LEDs_controller_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign green_LEDs_controller_s1_unreg_firsttransfer = ~(green_LEDs_controller_s1_slavearbiterlockenable & green_LEDs_controller_s1_any_continuerequest);

  //green_LEDs_controller_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          green_LEDs_controller_s1_reg_firsttransfer <= 1'b1;
      else if (green_LEDs_controller_s1_begins_xfer)
          green_LEDs_controller_s1_reg_firsttransfer <= green_LEDs_controller_s1_unreg_firsttransfer;
    end


  //green_LEDs_controller_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign green_LEDs_controller_s1_beginbursttransfer_internal = green_LEDs_controller_s1_begins_xfer;

  //~green_LEDs_controller_s1_write_n assignment, which is an e_mux
  assign green_LEDs_controller_s1_write_n = ~(((CPU_data_master_granted_green_LEDs_controller_s1 & CPU_data_master_write)) & green_LEDs_controller_s1_pretend_byte_enable);

  assign shifted_address_to_green_LEDs_controller_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //green_LEDs_controller_s1_address mux, which is an e_mux
  assign green_LEDs_controller_s1_address = shifted_address_to_green_LEDs_controller_s1_from_CPU_data_master >> 2;

  //d1_green_LEDs_controller_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_green_LEDs_controller_s1_end_xfer <= 1;
      else 
        d1_green_LEDs_controller_s1_end_xfer <= green_LEDs_controller_s1_end_xfer;
    end


  //green_LEDs_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign green_LEDs_controller_s1_waits_for_read = green_LEDs_controller_s1_in_a_read_cycle & green_LEDs_controller_s1_begins_xfer;

  //green_LEDs_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign green_LEDs_controller_s1_in_a_read_cycle = CPU_data_master_granted_green_LEDs_controller_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = green_LEDs_controller_s1_in_a_read_cycle;

  //green_LEDs_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign green_LEDs_controller_s1_waits_for_write = green_LEDs_controller_s1_in_a_write_cycle & 0;

  //green_LEDs_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign green_LEDs_controller_s1_in_a_write_cycle = CPU_data_master_granted_green_LEDs_controller_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = green_LEDs_controller_s1_in_a_write_cycle;

  assign wait_for_green_LEDs_controller_s1_counter = 0;
  //green_LEDs_controller_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign green_LEDs_controller_s1_pretend_byte_enable = (CPU_data_master_granted_green_LEDs_controller_s1)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //green_LEDs_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module on_chip_memory_s1_arbitrator (
                                      // inputs:
                                       CPU_data_master_address_to_slave,
                                       CPU_data_master_byteenable,
                                       CPU_data_master_latency_counter,
                                       CPU_data_master_read,
                                       CPU_data_master_write,
                                       CPU_data_master_writedata,
                                       CPU_instruction_master_address_to_slave,
                                       CPU_instruction_master_latency_counter,
                                       CPU_instruction_master_read,
                                       clk,
                                       on_chip_memory_s1_readdata,
                                       reset_n,

                                      // outputs:
                                       CPU_data_master_granted_on_chip_memory_s1,
                                       CPU_data_master_qualified_request_on_chip_memory_s1,
                                       CPU_data_master_read_data_valid_on_chip_memory_s1,
                                       CPU_data_master_requests_on_chip_memory_s1,
                                       CPU_instruction_master_granted_on_chip_memory_s1,
                                       CPU_instruction_master_qualified_request_on_chip_memory_s1,
                                       CPU_instruction_master_read_data_valid_on_chip_memory_s1,
                                       CPU_instruction_master_requests_on_chip_memory_s1,
                                       d1_on_chip_memory_s1_end_xfer,
                                       on_chip_memory_s1_address,
                                       on_chip_memory_s1_byteenable,
                                       on_chip_memory_s1_chipselect,
                                       on_chip_memory_s1_clken,
                                       on_chip_memory_s1_readdata_from_sa,
                                       on_chip_memory_s1_reset,
                                       on_chip_memory_s1_write,
                                       on_chip_memory_s1_writedata
                                    )
;

  output           CPU_data_master_granted_on_chip_memory_s1;
  output           CPU_data_master_qualified_request_on_chip_memory_s1;
  output           CPU_data_master_read_data_valid_on_chip_memory_s1;
  output           CPU_data_master_requests_on_chip_memory_s1;
  output           CPU_instruction_master_granted_on_chip_memory_s1;
  output           CPU_instruction_master_qualified_request_on_chip_memory_s1;
  output           CPU_instruction_master_read_data_valid_on_chip_memory_s1;
  output           CPU_instruction_master_requests_on_chip_memory_s1;
  output           d1_on_chip_memory_s1_end_xfer;
  output  [ 12: 0] on_chip_memory_s1_address;
  output  [  3: 0] on_chip_memory_s1_byteenable;
  output           on_chip_memory_s1_chipselect;
  output           on_chip_memory_s1_clken;
  output  [ 31: 0] on_chip_memory_s1_readdata_from_sa;
  output           on_chip_memory_s1_reset;
  output           on_chip_memory_s1_write;
  output  [ 31: 0] on_chip_memory_s1_writedata;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  3: 0] CPU_data_master_byteenable;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input   [ 27: 0] CPU_instruction_master_address_to_slave;
  input   [  2: 0] CPU_instruction_master_latency_counter;
  input            CPU_instruction_master_read;
  input            clk;
  input   [ 31: 0] on_chip_memory_s1_readdata;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_on_chip_memory_s1;
  wire             CPU_data_master_qualified_request_on_chip_memory_s1;
  wire             CPU_data_master_read_data_valid_on_chip_memory_s1;
  reg              CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register;
  wire             CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register_in;
  wire             CPU_data_master_requests_on_chip_memory_s1;
  wire             CPU_data_master_saved_grant_on_chip_memory_s1;
  wire             CPU_instruction_master_arbiterlock;
  wire             CPU_instruction_master_arbiterlock2;
  wire             CPU_instruction_master_continuerequest;
  wire             CPU_instruction_master_granted_on_chip_memory_s1;
  wire             CPU_instruction_master_qualified_request_on_chip_memory_s1;
  wire             CPU_instruction_master_read_data_valid_on_chip_memory_s1;
  reg              CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register;
  wire             CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register_in;
  wire             CPU_instruction_master_requests_on_chip_memory_s1;
  wire             CPU_instruction_master_saved_grant_on_chip_memory_s1;
  reg              d1_on_chip_memory_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_on_chip_memory_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_CPU_data_master_granted_slave_on_chip_memory_s1;
  reg              last_cycle_CPU_instruction_master_granted_slave_on_chip_memory_s1;
  wire    [ 12: 0] on_chip_memory_s1_address;
  wire             on_chip_memory_s1_allgrants;
  wire             on_chip_memory_s1_allow_new_arb_cycle;
  wire             on_chip_memory_s1_any_bursting_master_saved_grant;
  wire             on_chip_memory_s1_any_continuerequest;
  reg     [  1: 0] on_chip_memory_s1_arb_addend;
  wire             on_chip_memory_s1_arb_counter_enable;
  reg     [  1: 0] on_chip_memory_s1_arb_share_counter;
  wire    [  1: 0] on_chip_memory_s1_arb_share_counter_next_value;
  wire    [  1: 0] on_chip_memory_s1_arb_share_set_values;
  wire    [  1: 0] on_chip_memory_s1_arb_winner;
  wire             on_chip_memory_s1_arbitration_holdoff_internal;
  wire             on_chip_memory_s1_beginbursttransfer_internal;
  wire             on_chip_memory_s1_begins_xfer;
  wire    [  3: 0] on_chip_memory_s1_byteenable;
  wire             on_chip_memory_s1_chipselect;
  wire    [  3: 0] on_chip_memory_s1_chosen_master_double_vector;
  wire    [  1: 0] on_chip_memory_s1_chosen_master_rot_left;
  wire             on_chip_memory_s1_clken;
  wire             on_chip_memory_s1_end_xfer;
  wire             on_chip_memory_s1_firsttransfer;
  wire    [  1: 0] on_chip_memory_s1_grant_vector;
  wire             on_chip_memory_s1_in_a_read_cycle;
  wire             on_chip_memory_s1_in_a_write_cycle;
  wire    [  1: 0] on_chip_memory_s1_master_qreq_vector;
  wire             on_chip_memory_s1_non_bursting_master_requests;
  wire    [ 31: 0] on_chip_memory_s1_readdata_from_sa;
  reg              on_chip_memory_s1_reg_firsttransfer;
  wire             on_chip_memory_s1_reset;
  reg     [  1: 0] on_chip_memory_s1_saved_chosen_master_vector;
  reg              on_chip_memory_s1_slavearbiterlockenable;
  wire             on_chip_memory_s1_slavearbiterlockenable2;
  wire             on_chip_memory_s1_unreg_firsttransfer;
  wire             on_chip_memory_s1_waits_for_read;
  wire             on_chip_memory_s1_waits_for_write;
  wire             on_chip_memory_s1_write;
  wire    [ 31: 0] on_chip_memory_s1_writedata;
  wire             p1_CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register;
  wire             p1_CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register;
  wire    [ 27: 0] shifted_address_to_on_chip_memory_s1_from_CPU_data_master;
  wire    [ 27: 0] shifted_address_to_on_chip_memory_s1_from_CPU_instruction_master;
  wire             wait_for_on_chip_memory_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~on_chip_memory_s1_end_xfer;
    end


  assign on_chip_memory_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_on_chip_memory_s1 | CPU_instruction_master_qualified_request_on_chip_memory_s1));
  //assign on_chip_memory_s1_readdata_from_sa = on_chip_memory_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign on_chip_memory_s1_readdata_from_sa = on_chip_memory_s1_readdata;

  assign CPU_data_master_requests_on_chip_memory_s1 = ({CPU_data_master_address_to_slave[27 : 15] , 15'b0} == 28'h9408000) & (CPU_data_master_read | CPU_data_master_write);
  //on_chip_memory_s1_arb_share_counter set values, which is an e_mux
  assign on_chip_memory_s1_arb_share_set_values = 1;

  //on_chip_memory_s1_non_bursting_master_requests mux, which is an e_mux
  assign on_chip_memory_s1_non_bursting_master_requests = CPU_data_master_requests_on_chip_memory_s1 |
    CPU_instruction_master_requests_on_chip_memory_s1 |
    CPU_data_master_requests_on_chip_memory_s1 |
    CPU_instruction_master_requests_on_chip_memory_s1;

  //on_chip_memory_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign on_chip_memory_s1_any_bursting_master_saved_grant = 0;

  //on_chip_memory_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign on_chip_memory_s1_arb_share_counter_next_value = on_chip_memory_s1_firsttransfer ? (on_chip_memory_s1_arb_share_set_values - 1) : |on_chip_memory_s1_arb_share_counter ? (on_chip_memory_s1_arb_share_counter - 1) : 0;

  //on_chip_memory_s1_allgrants all slave grants, which is an e_mux
  assign on_chip_memory_s1_allgrants = (|on_chip_memory_s1_grant_vector) |
    (|on_chip_memory_s1_grant_vector) |
    (|on_chip_memory_s1_grant_vector) |
    (|on_chip_memory_s1_grant_vector);

  //on_chip_memory_s1_end_xfer assignment, which is an e_assign
  assign on_chip_memory_s1_end_xfer = ~(on_chip_memory_s1_waits_for_read | on_chip_memory_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_on_chip_memory_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_on_chip_memory_s1 = on_chip_memory_s1_end_xfer & (~on_chip_memory_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //on_chip_memory_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign on_chip_memory_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_on_chip_memory_s1 & on_chip_memory_s1_allgrants) | (end_xfer_arb_share_counter_term_on_chip_memory_s1 & ~on_chip_memory_s1_non_bursting_master_requests);

  //on_chip_memory_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          on_chip_memory_s1_arb_share_counter <= 0;
      else if (on_chip_memory_s1_arb_counter_enable)
          on_chip_memory_s1_arb_share_counter <= on_chip_memory_s1_arb_share_counter_next_value;
    end


  //on_chip_memory_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          on_chip_memory_s1_slavearbiterlockenable <= 0;
      else if ((|on_chip_memory_s1_master_qreq_vector & end_xfer_arb_share_counter_term_on_chip_memory_s1) | (end_xfer_arb_share_counter_term_on_chip_memory_s1 & ~on_chip_memory_s1_non_bursting_master_requests))
          on_chip_memory_s1_slavearbiterlockenable <= |on_chip_memory_s1_arb_share_counter_next_value;
    end


  //CPU/data_master on_chip_memory/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = on_chip_memory_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //on_chip_memory_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign on_chip_memory_s1_slavearbiterlockenable2 = |on_chip_memory_s1_arb_share_counter_next_value;

  //CPU/data_master on_chip_memory/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = on_chip_memory_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //CPU/instruction_master on_chip_memory/s1 arbiterlock, which is an e_assign
  assign CPU_instruction_master_arbiterlock = on_chip_memory_s1_slavearbiterlockenable & CPU_instruction_master_continuerequest;

  //CPU/instruction_master on_chip_memory/s1 arbiterlock2, which is an e_assign
  assign CPU_instruction_master_arbiterlock2 = on_chip_memory_s1_slavearbiterlockenable2 & CPU_instruction_master_continuerequest;

  //CPU/instruction_master granted on_chip_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_instruction_master_granted_slave_on_chip_memory_s1 <= 0;
      else 
        last_cycle_CPU_instruction_master_granted_slave_on_chip_memory_s1 <= CPU_instruction_master_saved_grant_on_chip_memory_s1 ? 1 : (on_chip_memory_s1_arbitration_holdoff_internal | ~CPU_instruction_master_requests_on_chip_memory_s1) ? 0 : last_cycle_CPU_instruction_master_granted_slave_on_chip_memory_s1;
    end


  //CPU_instruction_master_continuerequest continued request, which is an e_mux
  assign CPU_instruction_master_continuerequest = last_cycle_CPU_instruction_master_granted_slave_on_chip_memory_s1 & CPU_instruction_master_requests_on_chip_memory_s1;

  //on_chip_memory_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign on_chip_memory_s1_any_continuerequest = CPU_instruction_master_continuerequest |
    CPU_data_master_continuerequest;

  assign CPU_data_master_qualified_request_on_chip_memory_s1 = CPU_data_master_requests_on_chip_memory_s1 & ~((CPU_data_master_read & ((1 < CPU_data_master_latency_counter))) | CPU_instruction_master_arbiterlock);
  //CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register_in = CPU_data_master_granted_on_chip_memory_s1 & CPU_data_master_read & ~on_chip_memory_s1_waits_for_read;

  //shift register p1 CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register = {CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register, CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register_in};

  //CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register <= 0;
      else 
        CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register <= p1_CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register;
    end


  //local readdatavalid CPU_data_master_read_data_valid_on_chip_memory_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_on_chip_memory_s1 = CPU_data_master_read_data_valid_on_chip_memory_s1_shift_register;

  //on_chip_memory_s1_writedata mux, which is an e_mux
  assign on_chip_memory_s1_writedata = CPU_data_master_writedata;

  //mux on_chip_memory_s1_clken, which is an e_mux
  assign on_chip_memory_s1_clken = 1'b1;

  assign CPU_instruction_master_requests_on_chip_memory_s1 = (({CPU_instruction_master_address_to_slave[27 : 15] , 15'b0} == 28'h9408000) & (CPU_instruction_master_read)) & CPU_instruction_master_read;
  //CPU/data_master granted on_chip_memory/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_CPU_data_master_granted_slave_on_chip_memory_s1 <= 0;
      else 
        last_cycle_CPU_data_master_granted_slave_on_chip_memory_s1 <= CPU_data_master_saved_grant_on_chip_memory_s1 ? 1 : (on_chip_memory_s1_arbitration_holdoff_internal | ~CPU_data_master_requests_on_chip_memory_s1) ? 0 : last_cycle_CPU_data_master_granted_slave_on_chip_memory_s1;
    end


  //CPU_data_master_continuerequest continued request, which is an e_mux
  assign CPU_data_master_continuerequest = last_cycle_CPU_data_master_granted_slave_on_chip_memory_s1 & CPU_data_master_requests_on_chip_memory_s1;

  assign CPU_instruction_master_qualified_request_on_chip_memory_s1 = CPU_instruction_master_requests_on_chip_memory_s1 & ~((CPU_instruction_master_read & ((1 < CPU_instruction_master_latency_counter))) | CPU_data_master_arbiterlock);
  //CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register_in = CPU_instruction_master_granted_on_chip_memory_s1 & CPU_instruction_master_read & ~on_chip_memory_s1_waits_for_read;

  //shift register p1 CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register = {CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register, CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register_in};

  //CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register <= 0;
      else 
        CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register <= p1_CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register;
    end


  //local readdatavalid CPU_instruction_master_read_data_valid_on_chip_memory_s1, which is an e_mux
  assign CPU_instruction_master_read_data_valid_on_chip_memory_s1 = CPU_instruction_master_read_data_valid_on_chip_memory_s1_shift_register;

  //allow new arb cycle for on_chip_memory/s1, which is an e_assign
  assign on_chip_memory_s1_allow_new_arb_cycle = ~CPU_data_master_arbiterlock & ~CPU_instruction_master_arbiterlock;

  //CPU/instruction_master assignment into master qualified-requests vector for on_chip_memory/s1, which is an e_assign
  assign on_chip_memory_s1_master_qreq_vector[0] = CPU_instruction_master_qualified_request_on_chip_memory_s1;

  //CPU/instruction_master grant on_chip_memory/s1, which is an e_assign
  assign CPU_instruction_master_granted_on_chip_memory_s1 = on_chip_memory_s1_grant_vector[0];

  //CPU/instruction_master saved-grant on_chip_memory/s1, which is an e_assign
  assign CPU_instruction_master_saved_grant_on_chip_memory_s1 = on_chip_memory_s1_arb_winner[0] && CPU_instruction_master_requests_on_chip_memory_s1;

  //CPU/data_master assignment into master qualified-requests vector for on_chip_memory/s1, which is an e_assign
  assign on_chip_memory_s1_master_qreq_vector[1] = CPU_data_master_qualified_request_on_chip_memory_s1;

  //CPU/data_master grant on_chip_memory/s1, which is an e_assign
  assign CPU_data_master_granted_on_chip_memory_s1 = on_chip_memory_s1_grant_vector[1];

  //CPU/data_master saved-grant on_chip_memory/s1, which is an e_assign
  assign CPU_data_master_saved_grant_on_chip_memory_s1 = on_chip_memory_s1_arb_winner[1] && CPU_data_master_requests_on_chip_memory_s1;

  //on_chip_memory/s1 chosen-master double-vector, which is an e_assign
  assign on_chip_memory_s1_chosen_master_double_vector = {on_chip_memory_s1_master_qreq_vector, on_chip_memory_s1_master_qreq_vector} & ({~on_chip_memory_s1_master_qreq_vector, ~on_chip_memory_s1_master_qreq_vector} + on_chip_memory_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign on_chip_memory_s1_arb_winner = (on_chip_memory_s1_allow_new_arb_cycle & | on_chip_memory_s1_grant_vector) ? on_chip_memory_s1_grant_vector : on_chip_memory_s1_saved_chosen_master_vector;

  //saved on_chip_memory_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          on_chip_memory_s1_saved_chosen_master_vector <= 0;
      else if (on_chip_memory_s1_allow_new_arb_cycle)
          on_chip_memory_s1_saved_chosen_master_vector <= |on_chip_memory_s1_grant_vector ? on_chip_memory_s1_grant_vector : on_chip_memory_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign on_chip_memory_s1_grant_vector = {(on_chip_memory_s1_chosen_master_double_vector[1] | on_chip_memory_s1_chosen_master_double_vector[3]),
    (on_chip_memory_s1_chosen_master_double_vector[0] | on_chip_memory_s1_chosen_master_double_vector[2])};

  //on_chip_memory/s1 chosen master rotated left, which is an e_assign
  assign on_chip_memory_s1_chosen_master_rot_left = (on_chip_memory_s1_arb_winner << 1) ? (on_chip_memory_s1_arb_winner << 1) : 1;

  //on_chip_memory/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          on_chip_memory_s1_arb_addend <= 1;
      else if (|on_chip_memory_s1_grant_vector)
          on_chip_memory_s1_arb_addend <= on_chip_memory_s1_end_xfer? on_chip_memory_s1_chosen_master_rot_left : on_chip_memory_s1_grant_vector;
    end


  //~on_chip_memory_s1_reset assignment, which is an e_assign
  assign on_chip_memory_s1_reset = ~reset_n;

  assign on_chip_memory_s1_chipselect = CPU_data_master_granted_on_chip_memory_s1 | CPU_instruction_master_granted_on_chip_memory_s1;
  //on_chip_memory_s1_firsttransfer first transaction, which is an e_assign
  assign on_chip_memory_s1_firsttransfer = on_chip_memory_s1_begins_xfer ? on_chip_memory_s1_unreg_firsttransfer : on_chip_memory_s1_reg_firsttransfer;

  //on_chip_memory_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign on_chip_memory_s1_unreg_firsttransfer = ~(on_chip_memory_s1_slavearbiterlockenable & on_chip_memory_s1_any_continuerequest);

  //on_chip_memory_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          on_chip_memory_s1_reg_firsttransfer <= 1'b1;
      else if (on_chip_memory_s1_begins_xfer)
          on_chip_memory_s1_reg_firsttransfer <= on_chip_memory_s1_unreg_firsttransfer;
    end


  //on_chip_memory_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign on_chip_memory_s1_beginbursttransfer_internal = on_chip_memory_s1_begins_xfer;

  //on_chip_memory_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign on_chip_memory_s1_arbitration_holdoff_internal = on_chip_memory_s1_begins_xfer & on_chip_memory_s1_firsttransfer;

  //on_chip_memory_s1_write assignment, which is an e_mux
  assign on_chip_memory_s1_write = CPU_data_master_granted_on_chip_memory_s1 & CPU_data_master_write;

  assign shifted_address_to_on_chip_memory_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //on_chip_memory_s1_address mux, which is an e_mux
  assign on_chip_memory_s1_address = (CPU_data_master_granted_on_chip_memory_s1)? (shifted_address_to_on_chip_memory_s1_from_CPU_data_master >> 2) :
    (shifted_address_to_on_chip_memory_s1_from_CPU_instruction_master >> 2);

  assign shifted_address_to_on_chip_memory_s1_from_CPU_instruction_master = CPU_instruction_master_address_to_slave;
  //d1_on_chip_memory_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_on_chip_memory_s1_end_xfer <= 1;
      else 
        d1_on_chip_memory_s1_end_xfer <= on_chip_memory_s1_end_xfer;
    end


  //on_chip_memory_s1_waits_for_read in a cycle, which is an e_mux
  assign on_chip_memory_s1_waits_for_read = on_chip_memory_s1_in_a_read_cycle & 0;

  //on_chip_memory_s1_in_a_read_cycle assignment, which is an e_assign
  assign on_chip_memory_s1_in_a_read_cycle = (CPU_data_master_granted_on_chip_memory_s1 & CPU_data_master_read) | (CPU_instruction_master_granted_on_chip_memory_s1 & CPU_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = on_chip_memory_s1_in_a_read_cycle;

  //on_chip_memory_s1_waits_for_write in a cycle, which is an e_mux
  assign on_chip_memory_s1_waits_for_write = on_chip_memory_s1_in_a_write_cycle & 0;

  //on_chip_memory_s1_in_a_write_cycle assignment, which is an e_assign
  assign on_chip_memory_s1_in_a_write_cycle = CPU_data_master_granted_on_chip_memory_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = on_chip_memory_s1_in_a_write_cycle;

  assign wait_for_on_chip_memory_s1_counter = 0;
  //on_chip_memory_s1_byteenable byte enable port mux, which is an e_mux
  assign on_chip_memory_s1_byteenable = (CPU_data_master_granted_on_chip_memory_s1)? CPU_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //on_chip_memory/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_granted_on_chip_memory_s1 + CPU_instruction_master_granted_on_chip_memory_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (CPU_data_master_saved_grant_on_chip_memory_s1 + CPU_instruction_master_saved_grant_on_chip_memory_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module push_button_switches_controller_s1_arbitrator (
                                                       // inputs:
                                                        CPU_data_master_address_to_slave,
                                                        CPU_data_master_latency_counter,
                                                        CPU_data_master_read,
                                                        CPU_data_master_write,
                                                        clk,
                                                        push_button_switches_controller_s1_readdata,
                                                        reset_n,

                                                       // outputs:
                                                        CPU_data_master_granted_push_button_switches_controller_s1,
                                                        CPU_data_master_qualified_request_push_button_switches_controller_s1,
                                                        CPU_data_master_read_data_valid_push_button_switches_controller_s1,
                                                        CPU_data_master_requests_push_button_switches_controller_s1,
                                                        d1_push_button_switches_controller_s1_end_xfer,
                                                        push_button_switches_controller_s1_address,
                                                        push_button_switches_controller_s1_readdata_from_sa,
                                                        push_button_switches_controller_s1_reset_n
                                                     )
;

  output           CPU_data_master_granted_push_button_switches_controller_s1;
  output           CPU_data_master_qualified_request_push_button_switches_controller_s1;
  output           CPU_data_master_read_data_valid_push_button_switches_controller_s1;
  output           CPU_data_master_requests_push_button_switches_controller_s1;
  output           d1_push_button_switches_controller_s1_end_xfer;
  output  [  1: 0] push_button_switches_controller_s1_address;
  output  [  3: 0] push_button_switches_controller_s1_readdata_from_sa;
  output           push_button_switches_controller_s1_reset_n;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input            clk;
  input   [  3: 0] push_button_switches_controller_s1_readdata;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_push_button_switches_controller_s1;
  wire             CPU_data_master_qualified_request_push_button_switches_controller_s1;
  wire             CPU_data_master_read_data_valid_push_button_switches_controller_s1;
  wire             CPU_data_master_requests_push_button_switches_controller_s1;
  wire             CPU_data_master_saved_grant_push_button_switches_controller_s1;
  reg              d1_push_button_switches_controller_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_push_button_switches_controller_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] push_button_switches_controller_s1_address;
  wire             push_button_switches_controller_s1_allgrants;
  wire             push_button_switches_controller_s1_allow_new_arb_cycle;
  wire             push_button_switches_controller_s1_any_bursting_master_saved_grant;
  wire             push_button_switches_controller_s1_any_continuerequest;
  wire             push_button_switches_controller_s1_arb_counter_enable;
  reg     [  1: 0] push_button_switches_controller_s1_arb_share_counter;
  wire    [  1: 0] push_button_switches_controller_s1_arb_share_counter_next_value;
  wire    [  1: 0] push_button_switches_controller_s1_arb_share_set_values;
  wire             push_button_switches_controller_s1_beginbursttransfer_internal;
  wire             push_button_switches_controller_s1_begins_xfer;
  wire             push_button_switches_controller_s1_end_xfer;
  wire             push_button_switches_controller_s1_firsttransfer;
  wire             push_button_switches_controller_s1_grant_vector;
  wire             push_button_switches_controller_s1_in_a_read_cycle;
  wire             push_button_switches_controller_s1_in_a_write_cycle;
  wire             push_button_switches_controller_s1_master_qreq_vector;
  wire             push_button_switches_controller_s1_non_bursting_master_requests;
  wire    [  3: 0] push_button_switches_controller_s1_readdata_from_sa;
  reg              push_button_switches_controller_s1_reg_firsttransfer;
  wire             push_button_switches_controller_s1_reset_n;
  reg              push_button_switches_controller_s1_slavearbiterlockenable;
  wire             push_button_switches_controller_s1_slavearbiterlockenable2;
  wire             push_button_switches_controller_s1_unreg_firsttransfer;
  wire             push_button_switches_controller_s1_waits_for_read;
  wire             push_button_switches_controller_s1_waits_for_write;
  wire    [ 27: 0] shifted_address_to_push_button_switches_controller_s1_from_CPU_data_master;
  wire             wait_for_push_button_switches_controller_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~push_button_switches_controller_s1_end_xfer;
    end


  assign push_button_switches_controller_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_push_button_switches_controller_s1));
  //assign push_button_switches_controller_s1_readdata_from_sa = push_button_switches_controller_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign push_button_switches_controller_s1_readdata_from_sa = push_button_switches_controller_s1_readdata;

  assign CPU_data_master_requests_push_button_switches_controller_s1 = (({CPU_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h9411090) & (CPU_data_master_read | CPU_data_master_write)) & CPU_data_master_read;
  //push_button_switches_controller_s1_arb_share_counter set values, which is an e_mux
  assign push_button_switches_controller_s1_arb_share_set_values = 1;

  //push_button_switches_controller_s1_non_bursting_master_requests mux, which is an e_mux
  assign push_button_switches_controller_s1_non_bursting_master_requests = CPU_data_master_requests_push_button_switches_controller_s1;

  //push_button_switches_controller_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign push_button_switches_controller_s1_any_bursting_master_saved_grant = 0;

  //push_button_switches_controller_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign push_button_switches_controller_s1_arb_share_counter_next_value = push_button_switches_controller_s1_firsttransfer ? (push_button_switches_controller_s1_arb_share_set_values - 1) : |push_button_switches_controller_s1_arb_share_counter ? (push_button_switches_controller_s1_arb_share_counter - 1) : 0;

  //push_button_switches_controller_s1_allgrants all slave grants, which is an e_mux
  assign push_button_switches_controller_s1_allgrants = |push_button_switches_controller_s1_grant_vector;

  //push_button_switches_controller_s1_end_xfer assignment, which is an e_assign
  assign push_button_switches_controller_s1_end_xfer = ~(push_button_switches_controller_s1_waits_for_read | push_button_switches_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_push_button_switches_controller_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_push_button_switches_controller_s1 = push_button_switches_controller_s1_end_xfer & (~push_button_switches_controller_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //push_button_switches_controller_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign push_button_switches_controller_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_push_button_switches_controller_s1 & push_button_switches_controller_s1_allgrants) | (end_xfer_arb_share_counter_term_push_button_switches_controller_s1 & ~push_button_switches_controller_s1_non_bursting_master_requests);

  //push_button_switches_controller_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          push_button_switches_controller_s1_arb_share_counter <= 0;
      else if (push_button_switches_controller_s1_arb_counter_enable)
          push_button_switches_controller_s1_arb_share_counter <= push_button_switches_controller_s1_arb_share_counter_next_value;
    end


  //push_button_switches_controller_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          push_button_switches_controller_s1_slavearbiterlockenable <= 0;
      else if ((|push_button_switches_controller_s1_master_qreq_vector & end_xfer_arb_share_counter_term_push_button_switches_controller_s1) | (end_xfer_arb_share_counter_term_push_button_switches_controller_s1 & ~push_button_switches_controller_s1_non_bursting_master_requests))
          push_button_switches_controller_s1_slavearbiterlockenable <= |push_button_switches_controller_s1_arb_share_counter_next_value;
    end


  //CPU/data_master push_button_switches_controller/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = push_button_switches_controller_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //push_button_switches_controller_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign push_button_switches_controller_s1_slavearbiterlockenable2 = |push_button_switches_controller_s1_arb_share_counter_next_value;

  //CPU/data_master push_button_switches_controller/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = push_button_switches_controller_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //push_button_switches_controller_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign push_button_switches_controller_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_push_button_switches_controller_s1 = CPU_data_master_requests_push_button_switches_controller_s1 & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_push_button_switches_controller_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_push_button_switches_controller_s1 = CPU_data_master_granted_push_button_switches_controller_s1 & CPU_data_master_read & ~push_button_switches_controller_s1_waits_for_read;

  //master is always granted when requested
  assign CPU_data_master_granted_push_button_switches_controller_s1 = CPU_data_master_qualified_request_push_button_switches_controller_s1;

  //CPU/data_master saved-grant push_button_switches_controller/s1, which is an e_assign
  assign CPU_data_master_saved_grant_push_button_switches_controller_s1 = CPU_data_master_requests_push_button_switches_controller_s1;

  //allow new arb cycle for push_button_switches_controller/s1, which is an e_assign
  assign push_button_switches_controller_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign push_button_switches_controller_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign push_button_switches_controller_s1_master_qreq_vector = 1;

  //push_button_switches_controller_s1_reset_n assignment, which is an e_assign
  assign push_button_switches_controller_s1_reset_n = reset_n;

  //push_button_switches_controller_s1_firsttransfer first transaction, which is an e_assign
  assign push_button_switches_controller_s1_firsttransfer = push_button_switches_controller_s1_begins_xfer ? push_button_switches_controller_s1_unreg_firsttransfer : push_button_switches_controller_s1_reg_firsttransfer;

  //push_button_switches_controller_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign push_button_switches_controller_s1_unreg_firsttransfer = ~(push_button_switches_controller_s1_slavearbiterlockenable & push_button_switches_controller_s1_any_continuerequest);

  //push_button_switches_controller_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          push_button_switches_controller_s1_reg_firsttransfer <= 1'b1;
      else if (push_button_switches_controller_s1_begins_xfer)
          push_button_switches_controller_s1_reg_firsttransfer <= push_button_switches_controller_s1_unreg_firsttransfer;
    end


  //push_button_switches_controller_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign push_button_switches_controller_s1_beginbursttransfer_internal = push_button_switches_controller_s1_begins_xfer;

  assign shifted_address_to_push_button_switches_controller_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //push_button_switches_controller_s1_address mux, which is an e_mux
  assign push_button_switches_controller_s1_address = shifted_address_to_push_button_switches_controller_s1_from_CPU_data_master >> 2;

  //d1_push_button_switches_controller_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_push_button_switches_controller_s1_end_xfer <= 1;
      else 
        d1_push_button_switches_controller_s1_end_xfer <= push_button_switches_controller_s1_end_xfer;
    end


  //push_button_switches_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign push_button_switches_controller_s1_waits_for_read = push_button_switches_controller_s1_in_a_read_cycle & push_button_switches_controller_s1_begins_xfer;

  //push_button_switches_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign push_button_switches_controller_s1_in_a_read_cycle = CPU_data_master_granted_push_button_switches_controller_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = push_button_switches_controller_s1_in_a_read_cycle;

  //push_button_switches_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign push_button_switches_controller_s1_waits_for_write = push_button_switches_controller_s1_in_a_write_cycle & 0;

  //push_button_switches_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign push_button_switches_controller_s1_in_a_write_cycle = CPU_data_master_granted_push_button_switches_controller_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = push_button_switches_controller_s1_in_a_write_cycle;

  assign wait_for_push_button_switches_controller_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //push_button_switches_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module red_LEDs_controller_s1_arbitrator (
                                           // inputs:
                                            CPU_data_master_address_to_slave,
                                            CPU_data_master_latency_counter,
                                            CPU_data_master_read,
                                            CPU_data_master_write,
                                            CPU_data_master_writedata,
                                            clk,
                                            red_LEDs_controller_s1_readdata,
                                            reset_n,

                                           // outputs:
                                            CPU_data_master_granted_red_LEDs_controller_s1,
                                            CPU_data_master_qualified_request_red_LEDs_controller_s1,
                                            CPU_data_master_read_data_valid_red_LEDs_controller_s1,
                                            CPU_data_master_requests_red_LEDs_controller_s1,
                                            d1_red_LEDs_controller_s1_end_xfer,
                                            red_LEDs_controller_s1_address,
                                            red_LEDs_controller_s1_chipselect,
                                            red_LEDs_controller_s1_readdata_from_sa,
                                            red_LEDs_controller_s1_reset_n,
                                            red_LEDs_controller_s1_write_n,
                                            red_LEDs_controller_s1_writedata
                                         )
;

  output           CPU_data_master_granted_red_LEDs_controller_s1;
  output           CPU_data_master_qualified_request_red_LEDs_controller_s1;
  output           CPU_data_master_read_data_valid_red_LEDs_controller_s1;
  output           CPU_data_master_requests_red_LEDs_controller_s1;
  output           d1_red_LEDs_controller_s1_end_xfer;
  output  [  1: 0] red_LEDs_controller_s1_address;
  output           red_LEDs_controller_s1_chipselect;
  output  [ 17: 0] red_LEDs_controller_s1_readdata_from_sa;
  output           red_LEDs_controller_s1_reset_n;
  output           red_LEDs_controller_s1_write_n;
  output  [ 17: 0] red_LEDs_controller_s1_writedata;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            clk;
  input   [ 17: 0] red_LEDs_controller_s1_readdata;
  input            reset_n;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_red_LEDs_controller_s1;
  wire             CPU_data_master_qualified_request_red_LEDs_controller_s1;
  wire             CPU_data_master_read_data_valid_red_LEDs_controller_s1;
  wire             CPU_data_master_requests_red_LEDs_controller_s1;
  wire             CPU_data_master_saved_grant_red_LEDs_controller_s1;
  reg              d1_reasons_to_wait;
  reg              d1_red_LEDs_controller_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_red_LEDs_controller_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] red_LEDs_controller_s1_address;
  wire             red_LEDs_controller_s1_allgrants;
  wire             red_LEDs_controller_s1_allow_new_arb_cycle;
  wire             red_LEDs_controller_s1_any_bursting_master_saved_grant;
  wire             red_LEDs_controller_s1_any_continuerequest;
  wire             red_LEDs_controller_s1_arb_counter_enable;
  reg     [  1: 0] red_LEDs_controller_s1_arb_share_counter;
  wire    [  1: 0] red_LEDs_controller_s1_arb_share_counter_next_value;
  wire    [  1: 0] red_LEDs_controller_s1_arb_share_set_values;
  wire             red_LEDs_controller_s1_beginbursttransfer_internal;
  wire             red_LEDs_controller_s1_begins_xfer;
  wire             red_LEDs_controller_s1_chipselect;
  wire             red_LEDs_controller_s1_end_xfer;
  wire             red_LEDs_controller_s1_firsttransfer;
  wire             red_LEDs_controller_s1_grant_vector;
  wire             red_LEDs_controller_s1_in_a_read_cycle;
  wire             red_LEDs_controller_s1_in_a_write_cycle;
  wire             red_LEDs_controller_s1_master_qreq_vector;
  wire             red_LEDs_controller_s1_non_bursting_master_requests;
  wire    [ 17: 0] red_LEDs_controller_s1_readdata_from_sa;
  reg              red_LEDs_controller_s1_reg_firsttransfer;
  wire             red_LEDs_controller_s1_reset_n;
  reg              red_LEDs_controller_s1_slavearbiterlockenable;
  wire             red_LEDs_controller_s1_slavearbiterlockenable2;
  wire             red_LEDs_controller_s1_unreg_firsttransfer;
  wire             red_LEDs_controller_s1_waits_for_read;
  wire             red_LEDs_controller_s1_waits_for_write;
  wire             red_LEDs_controller_s1_write_n;
  wire    [ 17: 0] red_LEDs_controller_s1_writedata;
  wire    [ 27: 0] shifted_address_to_red_LEDs_controller_s1_from_CPU_data_master;
  wire             wait_for_red_LEDs_controller_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~red_LEDs_controller_s1_end_xfer;
    end


  assign red_LEDs_controller_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_red_LEDs_controller_s1));
  //assign red_LEDs_controller_s1_readdata_from_sa = red_LEDs_controller_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign red_LEDs_controller_s1_readdata_from_sa = red_LEDs_controller_s1_readdata;

  assign CPU_data_master_requests_red_LEDs_controller_s1 = ({CPU_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h94110a0) & (CPU_data_master_read | CPU_data_master_write);
  //red_LEDs_controller_s1_arb_share_counter set values, which is an e_mux
  assign red_LEDs_controller_s1_arb_share_set_values = 1;

  //red_LEDs_controller_s1_non_bursting_master_requests mux, which is an e_mux
  assign red_LEDs_controller_s1_non_bursting_master_requests = CPU_data_master_requests_red_LEDs_controller_s1;

  //red_LEDs_controller_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign red_LEDs_controller_s1_any_bursting_master_saved_grant = 0;

  //red_LEDs_controller_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign red_LEDs_controller_s1_arb_share_counter_next_value = red_LEDs_controller_s1_firsttransfer ? (red_LEDs_controller_s1_arb_share_set_values - 1) : |red_LEDs_controller_s1_arb_share_counter ? (red_LEDs_controller_s1_arb_share_counter - 1) : 0;

  //red_LEDs_controller_s1_allgrants all slave grants, which is an e_mux
  assign red_LEDs_controller_s1_allgrants = |red_LEDs_controller_s1_grant_vector;

  //red_LEDs_controller_s1_end_xfer assignment, which is an e_assign
  assign red_LEDs_controller_s1_end_xfer = ~(red_LEDs_controller_s1_waits_for_read | red_LEDs_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_red_LEDs_controller_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_red_LEDs_controller_s1 = red_LEDs_controller_s1_end_xfer & (~red_LEDs_controller_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //red_LEDs_controller_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign red_LEDs_controller_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_red_LEDs_controller_s1 & red_LEDs_controller_s1_allgrants) | (end_xfer_arb_share_counter_term_red_LEDs_controller_s1 & ~red_LEDs_controller_s1_non_bursting_master_requests);

  //red_LEDs_controller_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          red_LEDs_controller_s1_arb_share_counter <= 0;
      else if (red_LEDs_controller_s1_arb_counter_enable)
          red_LEDs_controller_s1_arb_share_counter <= red_LEDs_controller_s1_arb_share_counter_next_value;
    end


  //red_LEDs_controller_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          red_LEDs_controller_s1_slavearbiterlockenable <= 0;
      else if ((|red_LEDs_controller_s1_master_qreq_vector & end_xfer_arb_share_counter_term_red_LEDs_controller_s1) | (end_xfer_arb_share_counter_term_red_LEDs_controller_s1 & ~red_LEDs_controller_s1_non_bursting_master_requests))
          red_LEDs_controller_s1_slavearbiterlockenable <= |red_LEDs_controller_s1_arb_share_counter_next_value;
    end


  //CPU/data_master red_LEDs_controller/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = red_LEDs_controller_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //red_LEDs_controller_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign red_LEDs_controller_s1_slavearbiterlockenable2 = |red_LEDs_controller_s1_arb_share_counter_next_value;

  //CPU/data_master red_LEDs_controller/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = red_LEDs_controller_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //red_LEDs_controller_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign red_LEDs_controller_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_red_LEDs_controller_s1 = CPU_data_master_requests_red_LEDs_controller_s1 & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_red_LEDs_controller_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_red_LEDs_controller_s1 = CPU_data_master_granted_red_LEDs_controller_s1 & CPU_data_master_read & ~red_LEDs_controller_s1_waits_for_read;

  //red_LEDs_controller_s1_writedata mux, which is an e_mux
  assign red_LEDs_controller_s1_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_red_LEDs_controller_s1 = CPU_data_master_qualified_request_red_LEDs_controller_s1;

  //CPU/data_master saved-grant red_LEDs_controller/s1, which is an e_assign
  assign CPU_data_master_saved_grant_red_LEDs_controller_s1 = CPU_data_master_requests_red_LEDs_controller_s1;

  //allow new arb cycle for red_LEDs_controller/s1, which is an e_assign
  assign red_LEDs_controller_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign red_LEDs_controller_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign red_LEDs_controller_s1_master_qreq_vector = 1;

  //red_LEDs_controller_s1_reset_n assignment, which is an e_assign
  assign red_LEDs_controller_s1_reset_n = reset_n;

  assign red_LEDs_controller_s1_chipselect = CPU_data_master_granted_red_LEDs_controller_s1;
  //red_LEDs_controller_s1_firsttransfer first transaction, which is an e_assign
  assign red_LEDs_controller_s1_firsttransfer = red_LEDs_controller_s1_begins_xfer ? red_LEDs_controller_s1_unreg_firsttransfer : red_LEDs_controller_s1_reg_firsttransfer;

  //red_LEDs_controller_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign red_LEDs_controller_s1_unreg_firsttransfer = ~(red_LEDs_controller_s1_slavearbiterlockenable & red_LEDs_controller_s1_any_continuerequest);

  //red_LEDs_controller_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          red_LEDs_controller_s1_reg_firsttransfer <= 1'b1;
      else if (red_LEDs_controller_s1_begins_xfer)
          red_LEDs_controller_s1_reg_firsttransfer <= red_LEDs_controller_s1_unreg_firsttransfer;
    end


  //red_LEDs_controller_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign red_LEDs_controller_s1_beginbursttransfer_internal = red_LEDs_controller_s1_begins_xfer;

  //~red_LEDs_controller_s1_write_n assignment, which is an e_mux
  assign red_LEDs_controller_s1_write_n = ~(CPU_data_master_granted_red_LEDs_controller_s1 & CPU_data_master_write);

  assign shifted_address_to_red_LEDs_controller_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //red_LEDs_controller_s1_address mux, which is an e_mux
  assign red_LEDs_controller_s1_address = shifted_address_to_red_LEDs_controller_s1_from_CPU_data_master >> 2;

  //d1_red_LEDs_controller_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_red_LEDs_controller_s1_end_xfer <= 1;
      else 
        d1_red_LEDs_controller_s1_end_xfer <= red_LEDs_controller_s1_end_xfer;
    end


  //red_LEDs_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign red_LEDs_controller_s1_waits_for_read = red_LEDs_controller_s1_in_a_read_cycle & red_LEDs_controller_s1_begins_xfer;

  //red_LEDs_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign red_LEDs_controller_s1_in_a_read_cycle = CPU_data_master_granted_red_LEDs_controller_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = red_LEDs_controller_s1_in_a_read_cycle;

  //red_LEDs_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign red_LEDs_controller_s1_waits_for_write = red_LEDs_controller_s1_in_a_write_cycle & 0;

  //red_LEDs_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign red_LEDs_controller_s1_in_a_write_cycle = CPU_data_master_granted_red_LEDs_controller_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = red_LEDs_controller_s1_in_a_write_cycle;

  assign wait_for_red_LEDs_controller_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //red_LEDs_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module seven_segment_displays_controller_s1_arbitrator (
                                                         // inputs:
                                                          CPU_data_master_address_to_slave,
                                                          CPU_data_master_latency_counter,
                                                          CPU_data_master_read,
                                                          CPU_data_master_write,
                                                          CPU_data_master_writedata,
                                                          clk,
                                                          reset_n,
                                                          seven_segment_displays_controller_s1_readdata,

                                                         // outputs:
                                                          CPU_data_master_granted_seven_segment_displays_controller_s1,
                                                          CPU_data_master_qualified_request_seven_segment_displays_controller_s1,
                                                          CPU_data_master_read_data_valid_seven_segment_displays_controller_s1,
                                                          CPU_data_master_requests_seven_segment_displays_controller_s1,
                                                          d1_seven_segment_displays_controller_s1_end_xfer,
                                                          seven_segment_displays_controller_s1_address,
                                                          seven_segment_displays_controller_s1_read_n,
                                                          seven_segment_displays_controller_s1_readdata_from_sa,
                                                          seven_segment_displays_controller_s1_reset_n,
                                                          seven_segment_displays_controller_s1_write_n,
                                                          seven_segment_displays_controller_s1_writedata
                                                       )
;

  output           CPU_data_master_granted_seven_segment_displays_controller_s1;
  output           CPU_data_master_qualified_request_seven_segment_displays_controller_s1;
  output           CPU_data_master_read_data_valid_seven_segment_displays_controller_s1;
  output           CPU_data_master_requests_seven_segment_displays_controller_s1;
  output           d1_seven_segment_displays_controller_s1_end_xfer;
  output  [  2: 0] seven_segment_displays_controller_s1_address;
  output           seven_segment_displays_controller_s1_read_n;
  output  [  3: 0] seven_segment_displays_controller_s1_readdata_from_sa;
  output           seven_segment_displays_controller_s1_reset_n;
  output           seven_segment_displays_controller_s1_write_n;
  output  [  3: 0] seven_segment_displays_controller_s1_writedata;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            clk;
  input            reset_n;
  input   [  3: 0] seven_segment_displays_controller_s1_readdata;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_seven_segment_displays_controller_s1;
  wire             CPU_data_master_qualified_request_seven_segment_displays_controller_s1;
  wire             CPU_data_master_read_data_valid_seven_segment_displays_controller_s1;
  wire             CPU_data_master_requests_seven_segment_displays_controller_s1;
  wire             CPU_data_master_saved_grant_seven_segment_displays_controller_s1;
  reg              d1_reasons_to_wait;
  reg              d1_seven_segment_displays_controller_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_seven_segment_displays_controller_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] seven_segment_displays_controller_s1_address;
  wire             seven_segment_displays_controller_s1_allgrants;
  wire             seven_segment_displays_controller_s1_allow_new_arb_cycle;
  wire             seven_segment_displays_controller_s1_any_bursting_master_saved_grant;
  wire             seven_segment_displays_controller_s1_any_continuerequest;
  wire             seven_segment_displays_controller_s1_arb_counter_enable;
  reg     [  1: 0] seven_segment_displays_controller_s1_arb_share_counter;
  wire    [  1: 0] seven_segment_displays_controller_s1_arb_share_counter_next_value;
  wire    [  1: 0] seven_segment_displays_controller_s1_arb_share_set_values;
  wire             seven_segment_displays_controller_s1_beginbursttransfer_internal;
  wire             seven_segment_displays_controller_s1_begins_xfer;
  wire             seven_segment_displays_controller_s1_end_xfer;
  wire             seven_segment_displays_controller_s1_firsttransfer;
  wire             seven_segment_displays_controller_s1_grant_vector;
  wire             seven_segment_displays_controller_s1_in_a_read_cycle;
  wire             seven_segment_displays_controller_s1_in_a_write_cycle;
  wire             seven_segment_displays_controller_s1_master_qreq_vector;
  wire             seven_segment_displays_controller_s1_non_bursting_master_requests;
  wire             seven_segment_displays_controller_s1_read_n;
  wire    [  3: 0] seven_segment_displays_controller_s1_readdata_from_sa;
  reg              seven_segment_displays_controller_s1_reg_firsttransfer;
  wire             seven_segment_displays_controller_s1_reset_n;
  reg              seven_segment_displays_controller_s1_slavearbiterlockenable;
  wire             seven_segment_displays_controller_s1_slavearbiterlockenable2;
  wire             seven_segment_displays_controller_s1_unreg_firsttransfer;
  wire             seven_segment_displays_controller_s1_waits_for_read;
  wire             seven_segment_displays_controller_s1_waits_for_write;
  wire             seven_segment_displays_controller_s1_write_n;
  wire    [  3: 0] seven_segment_displays_controller_s1_writedata;
  wire    [ 27: 0] shifted_address_to_seven_segment_displays_controller_s1_from_CPU_data_master;
  wire             wait_for_seven_segment_displays_controller_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~seven_segment_displays_controller_s1_end_xfer;
    end


  assign seven_segment_displays_controller_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_seven_segment_displays_controller_s1));
  //assign seven_segment_displays_controller_s1_readdata_from_sa = seven_segment_displays_controller_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign seven_segment_displays_controller_s1_readdata_from_sa = seven_segment_displays_controller_s1_readdata;

  assign CPU_data_master_requests_seven_segment_displays_controller_s1 = ({CPU_data_master_address_to_slave[27 : 5] , 5'b0} == 28'h9411040) & (CPU_data_master_read | CPU_data_master_write);
  //seven_segment_displays_controller_s1_arb_share_counter set values, which is an e_mux
  assign seven_segment_displays_controller_s1_arb_share_set_values = 1;

  //seven_segment_displays_controller_s1_non_bursting_master_requests mux, which is an e_mux
  assign seven_segment_displays_controller_s1_non_bursting_master_requests = CPU_data_master_requests_seven_segment_displays_controller_s1;

  //seven_segment_displays_controller_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign seven_segment_displays_controller_s1_any_bursting_master_saved_grant = 0;

  //seven_segment_displays_controller_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign seven_segment_displays_controller_s1_arb_share_counter_next_value = seven_segment_displays_controller_s1_firsttransfer ? (seven_segment_displays_controller_s1_arb_share_set_values - 1) : |seven_segment_displays_controller_s1_arb_share_counter ? (seven_segment_displays_controller_s1_arb_share_counter - 1) : 0;

  //seven_segment_displays_controller_s1_allgrants all slave grants, which is an e_mux
  assign seven_segment_displays_controller_s1_allgrants = |seven_segment_displays_controller_s1_grant_vector;

  //seven_segment_displays_controller_s1_end_xfer assignment, which is an e_assign
  assign seven_segment_displays_controller_s1_end_xfer = ~(seven_segment_displays_controller_s1_waits_for_read | seven_segment_displays_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_seven_segment_displays_controller_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_seven_segment_displays_controller_s1 = seven_segment_displays_controller_s1_end_xfer & (~seven_segment_displays_controller_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //seven_segment_displays_controller_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign seven_segment_displays_controller_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_seven_segment_displays_controller_s1 & seven_segment_displays_controller_s1_allgrants) | (end_xfer_arb_share_counter_term_seven_segment_displays_controller_s1 & ~seven_segment_displays_controller_s1_non_bursting_master_requests);

  //seven_segment_displays_controller_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seven_segment_displays_controller_s1_arb_share_counter <= 0;
      else if (seven_segment_displays_controller_s1_arb_counter_enable)
          seven_segment_displays_controller_s1_arb_share_counter <= seven_segment_displays_controller_s1_arb_share_counter_next_value;
    end


  //seven_segment_displays_controller_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seven_segment_displays_controller_s1_slavearbiterlockenable <= 0;
      else if ((|seven_segment_displays_controller_s1_master_qreq_vector & end_xfer_arb_share_counter_term_seven_segment_displays_controller_s1) | (end_xfer_arb_share_counter_term_seven_segment_displays_controller_s1 & ~seven_segment_displays_controller_s1_non_bursting_master_requests))
          seven_segment_displays_controller_s1_slavearbiterlockenable <= |seven_segment_displays_controller_s1_arb_share_counter_next_value;
    end


  //CPU/data_master seven_segment_displays_controller/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = seven_segment_displays_controller_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //seven_segment_displays_controller_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign seven_segment_displays_controller_s1_slavearbiterlockenable2 = |seven_segment_displays_controller_s1_arb_share_counter_next_value;

  //CPU/data_master seven_segment_displays_controller/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = seven_segment_displays_controller_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //seven_segment_displays_controller_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign seven_segment_displays_controller_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_seven_segment_displays_controller_s1 = CPU_data_master_requests_seven_segment_displays_controller_s1 & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_seven_segment_displays_controller_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_seven_segment_displays_controller_s1 = CPU_data_master_granted_seven_segment_displays_controller_s1 & CPU_data_master_read & ~seven_segment_displays_controller_s1_waits_for_read;

  //seven_segment_displays_controller_s1_writedata mux, which is an e_mux
  assign seven_segment_displays_controller_s1_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_seven_segment_displays_controller_s1 = CPU_data_master_qualified_request_seven_segment_displays_controller_s1;

  //CPU/data_master saved-grant seven_segment_displays_controller/s1, which is an e_assign
  assign CPU_data_master_saved_grant_seven_segment_displays_controller_s1 = CPU_data_master_requests_seven_segment_displays_controller_s1;

  //allow new arb cycle for seven_segment_displays_controller/s1, which is an e_assign
  assign seven_segment_displays_controller_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign seven_segment_displays_controller_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign seven_segment_displays_controller_s1_master_qreq_vector = 1;

  //seven_segment_displays_controller_s1_reset_n assignment, which is an e_assign
  assign seven_segment_displays_controller_s1_reset_n = reset_n;

  //seven_segment_displays_controller_s1_firsttransfer first transaction, which is an e_assign
  assign seven_segment_displays_controller_s1_firsttransfer = seven_segment_displays_controller_s1_begins_xfer ? seven_segment_displays_controller_s1_unreg_firsttransfer : seven_segment_displays_controller_s1_reg_firsttransfer;

  //seven_segment_displays_controller_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign seven_segment_displays_controller_s1_unreg_firsttransfer = ~(seven_segment_displays_controller_s1_slavearbiterlockenable & seven_segment_displays_controller_s1_any_continuerequest);

  //seven_segment_displays_controller_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          seven_segment_displays_controller_s1_reg_firsttransfer <= 1'b1;
      else if (seven_segment_displays_controller_s1_begins_xfer)
          seven_segment_displays_controller_s1_reg_firsttransfer <= seven_segment_displays_controller_s1_unreg_firsttransfer;
    end


  //seven_segment_displays_controller_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign seven_segment_displays_controller_s1_beginbursttransfer_internal = seven_segment_displays_controller_s1_begins_xfer;

  //~seven_segment_displays_controller_s1_read_n assignment, which is an e_mux
  assign seven_segment_displays_controller_s1_read_n = ~(CPU_data_master_granted_seven_segment_displays_controller_s1 & CPU_data_master_read);

  //~seven_segment_displays_controller_s1_write_n assignment, which is an e_mux
  assign seven_segment_displays_controller_s1_write_n = ~(CPU_data_master_granted_seven_segment_displays_controller_s1 & CPU_data_master_write);

  assign shifted_address_to_seven_segment_displays_controller_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //seven_segment_displays_controller_s1_address mux, which is an e_mux
  assign seven_segment_displays_controller_s1_address = shifted_address_to_seven_segment_displays_controller_s1_from_CPU_data_master >> 2;

  //d1_seven_segment_displays_controller_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_seven_segment_displays_controller_s1_end_xfer <= 1;
      else 
        d1_seven_segment_displays_controller_s1_end_xfer <= seven_segment_displays_controller_s1_end_xfer;
    end


  //seven_segment_displays_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign seven_segment_displays_controller_s1_waits_for_read = seven_segment_displays_controller_s1_in_a_read_cycle & seven_segment_displays_controller_s1_begins_xfer;

  //seven_segment_displays_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign seven_segment_displays_controller_s1_in_a_read_cycle = CPU_data_master_granted_seven_segment_displays_controller_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = seven_segment_displays_controller_s1_in_a_read_cycle;

  //seven_segment_displays_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign seven_segment_displays_controller_s1_waits_for_write = seven_segment_displays_controller_s1_in_a_write_cycle & 0;

  //seven_segment_displays_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign seven_segment_displays_controller_s1_in_a_write_cycle = CPU_data_master_granted_seven_segment_displays_controller_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = seven_segment_displays_controller_s1_in_a_write_cycle;

  assign wait_for_seven_segment_displays_controller_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //seven_segment_displays_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         CPU_data_master_address_to_slave,
                                         CPU_data_master_latency_counter,
                                         CPU_data_master_read,
                                         CPU_data_master_write,
                                         clk,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         CPU_data_master_granted_sysid_control_slave,
                                         CPU_data_master_qualified_request_sysid_control_slave,
                                         CPU_data_master_read_data_valid_sysid_control_slave,
                                         CPU_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           CPU_data_master_granted_sysid_control_slave;
  output           CPU_data_master_qualified_request_sysid_control_slave;
  output           CPU_data_master_read_data_valid_sysid_control_slave;
  output           CPU_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input            clk;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_sysid_control_slave;
  wire             CPU_data_master_qualified_request_sysid_control_slave;
  wire             CPU_data_master_read_data_valid_sysid_control_slave;
  wire             CPU_data_master_requests_sysid_control_slave;
  wire             CPU_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_sysid_control_slave_from_CPU_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  1: 0] sysid_control_slave_arb_share_counter;
  wire    [  1: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign CPU_data_master_requests_sysid_control_slave = (({CPU_data_master_address_to_slave[27 : 3] , 3'b0} == 28'h94110c8) & (CPU_data_master_read | CPU_data_master_write)) & CPU_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = CPU_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //CPU/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & CPU_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //CPU/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_sysid_control_slave = CPU_data_master_requests_sysid_control_slave & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_sysid_control_slave, which is an e_mux
  assign CPU_data_master_read_data_valid_sysid_control_slave = CPU_data_master_granted_sysid_control_slave & CPU_data_master_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign CPU_data_master_granted_sysid_control_slave = CPU_data_master_qualified_request_sysid_control_slave;

  //CPU/data_master saved-grant sysid/control_slave, which is an e_assign
  assign CPU_data_master_saved_grant_sysid_control_slave = CPU_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_CPU_data_master = CPU_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_CPU_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = CPU_data_master_granted_sysid_control_slave & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = CPU_data_master_granted_sysid_control_slave & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module system_clock_timer_s1_arbitrator (
                                          // inputs:
                                           CPU_data_master_address_to_slave,
                                           CPU_data_master_latency_counter,
                                           CPU_data_master_read,
                                           CPU_data_master_write,
                                           CPU_data_master_writedata,
                                           clk,
                                           reset_n,
                                           system_clock_timer_s1_irq,
                                           system_clock_timer_s1_readdata,

                                          // outputs:
                                           CPU_data_master_granted_system_clock_timer_s1,
                                           CPU_data_master_qualified_request_system_clock_timer_s1,
                                           CPU_data_master_read_data_valid_system_clock_timer_s1,
                                           CPU_data_master_requests_system_clock_timer_s1,
                                           d1_system_clock_timer_s1_end_xfer,
                                           system_clock_timer_s1_address,
                                           system_clock_timer_s1_chipselect,
                                           system_clock_timer_s1_irq_from_sa,
                                           system_clock_timer_s1_readdata_from_sa,
                                           system_clock_timer_s1_reset_n,
                                           system_clock_timer_s1_write_n,
                                           system_clock_timer_s1_writedata
                                        )
;

  output           CPU_data_master_granted_system_clock_timer_s1;
  output           CPU_data_master_qualified_request_system_clock_timer_s1;
  output           CPU_data_master_read_data_valid_system_clock_timer_s1;
  output           CPU_data_master_requests_system_clock_timer_s1;
  output           d1_system_clock_timer_s1_end_xfer;
  output  [  2: 0] system_clock_timer_s1_address;
  output           system_clock_timer_s1_chipselect;
  output           system_clock_timer_s1_irq_from_sa;
  output  [ 15: 0] system_clock_timer_s1_readdata_from_sa;
  output           system_clock_timer_s1_reset_n;
  output           system_clock_timer_s1_write_n;
  output  [ 15: 0] system_clock_timer_s1_writedata;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            clk;
  input            reset_n;
  input            system_clock_timer_s1_irq;
  input   [ 15: 0] system_clock_timer_s1_readdata;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_system_clock_timer_s1;
  wire             CPU_data_master_qualified_request_system_clock_timer_s1;
  wire             CPU_data_master_read_data_valid_system_clock_timer_s1;
  wire             CPU_data_master_requests_system_clock_timer_s1;
  wire             CPU_data_master_saved_grant_system_clock_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_system_clock_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_system_clock_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_system_clock_timer_s1_from_CPU_data_master;
  wire    [  2: 0] system_clock_timer_s1_address;
  wire             system_clock_timer_s1_allgrants;
  wire             system_clock_timer_s1_allow_new_arb_cycle;
  wire             system_clock_timer_s1_any_bursting_master_saved_grant;
  wire             system_clock_timer_s1_any_continuerequest;
  wire             system_clock_timer_s1_arb_counter_enable;
  reg     [  1: 0] system_clock_timer_s1_arb_share_counter;
  wire    [  1: 0] system_clock_timer_s1_arb_share_counter_next_value;
  wire    [  1: 0] system_clock_timer_s1_arb_share_set_values;
  wire             system_clock_timer_s1_beginbursttransfer_internal;
  wire             system_clock_timer_s1_begins_xfer;
  wire             system_clock_timer_s1_chipselect;
  wire             system_clock_timer_s1_end_xfer;
  wire             system_clock_timer_s1_firsttransfer;
  wire             system_clock_timer_s1_grant_vector;
  wire             system_clock_timer_s1_in_a_read_cycle;
  wire             system_clock_timer_s1_in_a_write_cycle;
  wire             system_clock_timer_s1_irq_from_sa;
  wire             system_clock_timer_s1_master_qreq_vector;
  wire             system_clock_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] system_clock_timer_s1_readdata_from_sa;
  reg              system_clock_timer_s1_reg_firsttransfer;
  wire             system_clock_timer_s1_reset_n;
  reg              system_clock_timer_s1_slavearbiterlockenable;
  wire             system_clock_timer_s1_slavearbiterlockenable2;
  wire             system_clock_timer_s1_unreg_firsttransfer;
  wire             system_clock_timer_s1_waits_for_read;
  wire             system_clock_timer_s1_waits_for_write;
  wire             system_clock_timer_s1_write_n;
  wire    [ 15: 0] system_clock_timer_s1_writedata;
  wire             wait_for_system_clock_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~system_clock_timer_s1_end_xfer;
    end


  assign system_clock_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_system_clock_timer_s1));
  //assign system_clock_timer_s1_readdata_from_sa = system_clock_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign system_clock_timer_s1_readdata_from_sa = system_clock_timer_s1_readdata;

  assign CPU_data_master_requests_system_clock_timer_s1 = ({CPU_data_master_address_to_slave[27 : 5] , 5'b0} == 28'h9411000) & (CPU_data_master_read | CPU_data_master_write);
  //system_clock_timer_s1_arb_share_counter set values, which is an e_mux
  assign system_clock_timer_s1_arb_share_set_values = 1;

  //system_clock_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign system_clock_timer_s1_non_bursting_master_requests = CPU_data_master_requests_system_clock_timer_s1;

  //system_clock_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign system_clock_timer_s1_any_bursting_master_saved_grant = 0;

  //system_clock_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign system_clock_timer_s1_arb_share_counter_next_value = system_clock_timer_s1_firsttransfer ? (system_clock_timer_s1_arb_share_set_values - 1) : |system_clock_timer_s1_arb_share_counter ? (system_clock_timer_s1_arb_share_counter - 1) : 0;

  //system_clock_timer_s1_allgrants all slave grants, which is an e_mux
  assign system_clock_timer_s1_allgrants = |system_clock_timer_s1_grant_vector;

  //system_clock_timer_s1_end_xfer assignment, which is an e_assign
  assign system_clock_timer_s1_end_xfer = ~(system_clock_timer_s1_waits_for_read | system_clock_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_system_clock_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_system_clock_timer_s1 = system_clock_timer_s1_end_xfer & (~system_clock_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //system_clock_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign system_clock_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_system_clock_timer_s1 & system_clock_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_system_clock_timer_s1 & ~system_clock_timer_s1_non_bursting_master_requests);

  //system_clock_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          system_clock_timer_s1_arb_share_counter <= 0;
      else if (system_clock_timer_s1_arb_counter_enable)
          system_clock_timer_s1_arb_share_counter <= system_clock_timer_s1_arb_share_counter_next_value;
    end


  //system_clock_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          system_clock_timer_s1_slavearbiterlockenable <= 0;
      else if ((|system_clock_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_system_clock_timer_s1) | (end_xfer_arb_share_counter_term_system_clock_timer_s1 & ~system_clock_timer_s1_non_bursting_master_requests))
          system_clock_timer_s1_slavearbiterlockenable <= |system_clock_timer_s1_arb_share_counter_next_value;
    end


  //CPU/data_master system_clock_timer/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = system_clock_timer_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //system_clock_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign system_clock_timer_s1_slavearbiterlockenable2 = |system_clock_timer_s1_arb_share_counter_next_value;

  //CPU/data_master system_clock_timer/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = system_clock_timer_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //system_clock_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign system_clock_timer_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_system_clock_timer_s1 = CPU_data_master_requests_system_clock_timer_s1 & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_system_clock_timer_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_system_clock_timer_s1 = CPU_data_master_granted_system_clock_timer_s1 & CPU_data_master_read & ~system_clock_timer_s1_waits_for_read;

  //system_clock_timer_s1_writedata mux, which is an e_mux
  assign system_clock_timer_s1_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_system_clock_timer_s1 = CPU_data_master_qualified_request_system_clock_timer_s1;

  //CPU/data_master saved-grant system_clock_timer/s1, which is an e_assign
  assign CPU_data_master_saved_grant_system_clock_timer_s1 = CPU_data_master_requests_system_clock_timer_s1;

  //allow new arb cycle for system_clock_timer/s1, which is an e_assign
  assign system_clock_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign system_clock_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign system_clock_timer_s1_master_qreq_vector = 1;

  //system_clock_timer_s1_reset_n assignment, which is an e_assign
  assign system_clock_timer_s1_reset_n = reset_n;

  assign system_clock_timer_s1_chipselect = CPU_data_master_granted_system_clock_timer_s1;
  //system_clock_timer_s1_firsttransfer first transaction, which is an e_assign
  assign system_clock_timer_s1_firsttransfer = system_clock_timer_s1_begins_xfer ? system_clock_timer_s1_unreg_firsttransfer : system_clock_timer_s1_reg_firsttransfer;

  //system_clock_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign system_clock_timer_s1_unreg_firsttransfer = ~(system_clock_timer_s1_slavearbiterlockenable & system_clock_timer_s1_any_continuerequest);

  //system_clock_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          system_clock_timer_s1_reg_firsttransfer <= 1'b1;
      else if (system_clock_timer_s1_begins_xfer)
          system_clock_timer_s1_reg_firsttransfer <= system_clock_timer_s1_unreg_firsttransfer;
    end


  //system_clock_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign system_clock_timer_s1_beginbursttransfer_internal = system_clock_timer_s1_begins_xfer;

  //~system_clock_timer_s1_write_n assignment, which is an e_mux
  assign system_clock_timer_s1_write_n = ~(CPU_data_master_granted_system_clock_timer_s1 & CPU_data_master_write);

  assign shifted_address_to_system_clock_timer_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //system_clock_timer_s1_address mux, which is an e_mux
  assign system_clock_timer_s1_address = shifted_address_to_system_clock_timer_s1_from_CPU_data_master >> 2;

  //d1_system_clock_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_system_clock_timer_s1_end_xfer <= 1;
      else 
        d1_system_clock_timer_s1_end_xfer <= system_clock_timer_s1_end_xfer;
    end


  //system_clock_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign system_clock_timer_s1_waits_for_read = system_clock_timer_s1_in_a_read_cycle & system_clock_timer_s1_begins_xfer;

  //system_clock_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign system_clock_timer_s1_in_a_read_cycle = CPU_data_master_granted_system_clock_timer_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = system_clock_timer_s1_in_a_read_cycle;

  //system_clock_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign system_clock_timer_s1_waits_for_write = system_clock_timer_s1_in_a_write_cycle & 0;

  //system_clock_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign system_clock_timer_s1_in_a_write_cycle = CPU_data_master_granted_system_clock_timer_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = system_clock_timer_s1_in_a_write_cycle;

  assign wait_for_system_clock_timer_s1_counter = 0;
  //assign system_clock_timer_s1_irq_from_sa = system_clock_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign system_clock_timer_s1_irq_from_sa = system_clock_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //system_clock_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timestamp_timer_s1_arbitrator (
                                       // inputs:
                                        CPU_data_master_address_to_slave,
                                        CPU_data_master_latency_counter,
                                        CPU_data_master_read,
                                        CPU_data_master_write,
                                        CPU_data_master_writedata,
                                        clk,
                                        reset_n,
                                        timestamp_timer_s1_irq,
                                        timestamp_timer_s1_readdata,

                                       // outputs:
                                        CPU_data_master_granted_timestamp_timer_s1,
                                        CPU_data_master_qualified_request_timestamp_timer_s1,
                                        CPU_data_master_read_data_valid_timestamp_timer_s1,
                                        CPU_data_master_requests_timestamp_timer_s1,
                                        d1_timestamp_timer_s1_end_xfer,
                                        timestamp_timer_s1_address,
                                        timestamp_timer_s1_chipselect,
                                        timestamp_timer_s1_irq_from_sa,
                                        timestamp_timer_s1_readdata_from_sa,
                                        timestamp_timer_s1_reset_n,
                                        timestamp_timer_s1_write_n,
                                        timestamp_timer_s1_writedata
                                     )
;

  output           CPU_data_master_granted_timestamp_timer_s1;
  output           CPU_data_master_qualified_request_timestamp_timer_s1;
  output           CPU_data_master_read_data_valid_timestamp_timer_s1;
  output           CPU_data_master_requests_timestamp_timer_s1;
  output           d1_timestamp_timer_s1_end_xfer;
  output  [  2: 0] timestamp_timer_s1_address;
  output           timestamp_timer_s1_chipselect;
  output           timestamp_timer_s1_irq_from_sa;
  output  [ 15: 0] timestamp_timer_s1_readdata_from_sa;
  output           timestamp_timer_s1_reset_n;
  output           timestamp_timer_s1_write_n;
  output  [ 15: 0] timestamp_timer_s1_writedata;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input   [ 31: 0] CPU_data_master_writedata;
  input            clk;
  input            reset_n;
  input            timestamp_timer_s1_irq;
  input   [ 15: 0] timestamp_timer_s1_readdata;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_timestamp_timer_s1;
  wire             CPU_data_master_qualified_request_timestamp_timer_s1;
  wire             CPU_data_master_read_data_valid_timestamp_timer_s1;
  wire             CPU_data_master_requests_timestamp_timer_s1;
  wire             CPU_data_master_saved_grant_timestamp_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timestamp_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timestamp_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_timestamp_timer_s1_from_CPU_data_master;
  wire    [  2: 0] timestamp_timer_s1_address;
  wire             timestamp_timer_s1_allgrants;
  wire             timestamp_timer_s1_allow_new_arb_cycle;
  wire             timestamp_timer_s1_any_bursting_master_saved_grant;
  wire             timestamp_timer_s1_any_continuerequest;
  wire             timestamp_timer_s1_arb_counter_enable;
  reg     [  1: 0] timestamp_timer_s1_arb_share_counter;
  wire    [  1: 0] timestamp_timer_s1_arb_share_counter_next_value;
  wire    [  1: 0] timestamp_timer_s1_arb_share_set_values;
  wire             timestamp_timer_s1_beginbursttransfer_internal;
  wire             timestamp_timer_s1_begins_xfer;
  wire             timestamp_timer_s1_chipselect;
  wire             timestamp_timer_s1_end_xfer;
  wire             timestamp_timer_s1_firsttransfer;
  wire             timestamp_timer_s1_grant_vector;
  wire             timestamp_timer_s1_in_a_read_cycle;
  wire             timestamp_timer_s1_in_a_write_cycle;
  wire             timestamp_timer_s1_irq_from_sa;
  wire             timestamp_timer_s1_master_qreq_vector;
  wire             timestamp_timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] timestamp_timer_s1_readdata_from_sa;
  reg              timestamp_timer_s1_reg_firsttransfer;
  wire             timestamp_timer_s1_reset_n;
  reg              timestamp_timer_s1_slavearbiterlockenable;
  wire             timestamp_timer_s1_slavearbiterlockenable2;
  wire             timestamp_timer_s1_unreg_firsttransfer;
  wire             timestamp_timer_s1_waits_for_read;
  wire             timestamp_timer_s1_waits_for_write;
  wire             timestamp_timer_s1_write_n;
  wire    [ 15: 0] timestamp_timer_s1_writedata;
  wire             wait_for_timestamp_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timestamp_timer_s1_end_xfer;
    end


  assign timestamp_timer_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_timestamp_timer_s1));
  //assign timestamp_timer_s1_readdata_from_sa = timestamp_timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timestamp_timer_s1_readdata_from_sa = timestamp_timer_s1_readdata;

  assign CPU_data_master_requests_timestamp_timer_s1 = ({CPU_data_master_address_to_slave[27 : 5] , 5'b0} == 28'h9411020) & (CPU_data_master_read | CPU_data_master_write);
  //timestamp_timer_s1_arb_share_counter set values, which is an e_mux
  assign timestamp_timer_s1_arb_share_set_values = 1;

  //timestamp_timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign timestamp_timer_s1_non_bursting_master_requests = CPU_data_master_requests_timestamp_timer_s1;

  //timestamp_timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timestamp_timer_s1_any_bursting_master_saved_grant = 0;

  //timestamp_timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timestamp_timer_s1_arb_share_counter_next_value = timestamp_timer_s1_firsttransfer ? (timestamp_timer_s1_arb_share_set_values - 1) : |timestamp_timer_s1_arb_share_counter ? (timestamp_timer_s1_arb_share_counter - 1) : 0;

  //timestamp_timer_s1_allgrants all slave grants, which is an e_mux
  assign timestamp_timer_s1_allgrants = |timestamp_timer_s1_grant_vector;

  //timestamp_timer_s1_end_xfer assignment, which is an e_assign
  assign timestamp_timer_s1_end_xfer = ~(timestamp_timer_s1_waits_for_read | timestamp_timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timestamp_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timestamp_timer_s1 = timestamp_timer_s1_end_xfer & (~timestamp_timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timestamp_timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timestamp_timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timestamp_timer_s1 & timestamp_timer_s1_allgrants) | (end_xfer_arb_share_counter_term_timestamp_timer_s1 & ~timestamp_timer_s1_non_bursting_master_requests);

  //timestamp_timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timestamp_timer_s1_arb_share_counter <= 0;
      else if (timestamp_timer_s1_arb_counter_enable)
          timestamp_timer_s1_arb_share_counter <= timestamp_timer_s1_arb_share_counter_next_value;
    end


  //timestamp_timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timestamp_timer_s1_slavearbiterlockenable <= 0;
      else if ((|timestamp_timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timestamp_timer_s1) | (end_xfer_arb_share_counter_term_timestamp_timer_s1 & ~timestamp_timer_s1_non_bursting_master_requests))
          timestamp_timer_s1_slavearbiterlockenable <= |timestamp_timer_s1_arb_share_counter_next_value;
    end


  //CPU/data_master timestamp_timer/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = timestamp_timer_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //timestamp_timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timestamp_timer_s1_slavearbiterlockenable2 = |timestamp_timer_s1_arb_share_counter_next_value;

  //CPU/data_master timestamp_timer/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = timestamp_timer_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //timestamp_timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timestamp_timer_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_timestamp_timer_s1 = CPU_data_master_requests_timestamp_timer_s1 & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_timestamp_timer_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_timestamp_timer_s1 = CPU_data_master_granted_timestamp_timer_s1 & CPU_data_master_read & ~timestamp_timer_s1_waits_for_read;

  //timestamp_timer_s1_writedata mux, which is an e_mux
  assign timestamp_timer_s1_writedata = CPU_data_master_writedata;

  //master is always granted when requested
  assign CPU_data_master_granted_timestamp_timer_s1 = CPU_data_master_qualified_request_timestamp_timer_s1;

  //CPU/data_master saved-grant timestamp_timer/s1, which is an e_assign
  assign CPU_data_master_saved_grant_timestamp_timer_s1 = CPU_data_master_requests_timestamp_timer_s1;

  //allow new arb cycle for timestamp_timer/s1, which is an e_assign
  assign timestamp_timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timestamp_timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timestamp_timer_s1_master_qreq_vector = 1;

  //timestamp_timer_s1_reset_n assignment, which is an e_assign
  assign timestamp_timer_s1_reset_n = reset_n;

  assign timestamp_timer_s1_chipselect = CPU_data_master_granted_timestamp_timer_s1;
  //timestamp_timer_s1_firsttransfer first transaction, which is an e_assign
  assign timestamp_timer_s1_firsttransfer = timestamp_timer_s1_begins_xfer ? timestamp_timer_s1_unreg_firsttransfer : timestamp_timer_s1_reg_firsttransfer;

  //timestamp_timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timestamp_timer_s1_unreg_firsttransfer = ~(timestamp_timer_s1_slavearbiterlockenable & timestamp_timer_s1_any_continuerequest);

  //timestamp_timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timestamp_timer_s1_reg_firsttransfer <= 1'b1;
      else if (timestamp_timer_s1_begins_xfer)
          timestamp_timer_s1_reg_firsttransfer <= timestamp_timer_s1_unreg_firsttransfer;
    end


  //timestamp_timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timestamp_timer_s1_beginbursttransfer_internal = timestamp_timer_s1_begins_xfer;

  //~timestamp_timer_s1_write_n assignment, which is an e_mux
  assign timestamp_timer_s1_write_n = ~(CPU_data_master_granted_timestamp_timer_s1 & CPU_data_master_write);

  assign shifted_address_to_timestamp_timer_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //timestamp_timer_s1_address mux, which is an e_mux
  assign timestamp_timer_s1_address = shifted_address_to_timestamp_timer_s1_from_CPU_data_master >> 2;

  //d1_timestamp_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timestamp_timer_s1_end_xfer <= 1;
      else 
        d1_timestamp_timer_s1_end_xfer <= timestamp_timer_s1_end_xfer;
    end


  //timestamp_timer_s1_waits_for_read in a cycle, which is an e_mux
  assign timestamp_timer_s1_waits_for_read = timestamp_timer_s1_in_a_read_cycle & timestamp_timer_s1_begins_xfer;

  //timestamp_timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign timestamp_timer_s1_in_a_read_cycle = CPU_data_master_granted_timestamp_timer_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timestamp_timer_s1_in_a_read_cycle;

  //timestamp_timer_s1_waits_for_write in a cycle, which is an e_mux
  assign timestamp_timer_s1_waits_for_write = timestamp_timer_s1_in_a_write_cycle & 0;

  //timestamp_timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign timestamp_timer_s1_in_a_write_cycle = CPU_data_master_granted_timestamp_timer_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timestamp_timer_s1_in_a_write_cycle;

  assign wait_for_timestamp_timer_s1_counter = 0;
  //assign timestamp_timer_s1_irq_from_sa = timestamp_timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timestamp_timer_s1_irq_from_sa = timestamp_timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timestamp_timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module toggle_switches_controller_s1_arbitrator (
                                                  // inputs:
                                                   CPU_data_master_address_to_slave,
                                                   CPU_data_master_latency_counter,
                                                   CPU_data_master_read,
                                                   CPU_data_master_write,
                                                   clk,
                                                   reset_n,
                                                   toggle_switches_controller_s1_readdata,

                                                  // outputs:
                                                   CPU_data_master_granted_toggle_switches_controller_s1,
                                                   CPU_data_master_qualified_request_toggle_switches_controller_s1,
                                                   CPU_data_master_read_data_valid_toggle_switches_controller_s1,
                                                   CPU_data_master_requests_toggle_switches_controller_s1,
                                                   d1_toggle_switches_controller_s1_end_xfer,
                                                   toggle_switches_controller_s1_address,
                                                   toggle_switches_controller_s1_readdata_from_sa,
                                                   toggle_switches_controller_s1_reset_n
                                                )
;

  output           CPU_data_master_granted_toggle_switches_controller_s1;
  output           CPU_data_master_qualified_request_toggle_switches_controller_s1;
  output           CPU_data_master_read_data_valid_toggle_switches_controller_s1;
  output           CPU_data_master_requests_toggle_switches_controller_s1;
  output           d1_toggle_switches_controller_s1_end_xfer;
  output  [  1: 0] toggle_switches_controller_s1_address;
  output  [ 17: 0] toggle_switches_controller_s1_readdata_from_sa;
  output           toggle_switches_controller_s1_reset_n;
  input   [ 27: 0] CPU_data_master_address_to_slave;
  input   [  2: 0] CPU_data_master_latency_counter;
  input            CPU_data_master_read;
  input            CPU_data_master_write;
  input            clk;
  input            reset_n;
  input   [ 17: 0] toggle_switches_controller_s1_readdata;

  wire             CPU_data_master_arbiterlock;
  wire             CPU_data_master_arbiterlock2;
  wire             CPU_data_master_continuerequest;
  wire             CPU_data_master_granted_toggle_switches_controller_s1;
  wire             CPU_data_master_qualified_request_toggle_switches_controller_s1;
  wire             CPU_data_master_read_data_valid_toggle_switches_controller_s1;
  wire             CPU_data_master_requests_toggle_switches_controller_s1;
  wire             CPU_data_master_saved_grant_toggle_switches_controller_s1;
  reg              d1_reasons_to_wait;
  reg              d1_toggle_switches_controller_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_toggle_switches_controller_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_toggle_switches_controller_s1_from_CPU_data_master;
  wire    [  1: 0] toggle_switches_controller_s1_address;
  wire             toggle_switches_controller_s1_allgrants;
  wire             toggle_switches_controller_s1_allow_new_arb_cycle;
  wire             toggle_switches_controller_s1_any_bursting_master_saved_grant;
  wire             toggle_switches_controller_s1_any_continuerequest;
  wire             toggle_switches_controller_s1_arb_counter_enable;
  reg     [  1: 0] toggle_switches_controller_s1_arb_share_counter;
  wire    [  1: 0] toggle_switches_controller_s1_arb_share_counter_next_value;
  wire    [  1: 0] toggle_switches_controller_s1_arb_share_set_values;
  wire             toggle_switches_controller_s1_beginbursttransfer_internal;
  wire             toggle_switches_controller_s1_begins_xfer;
  wire             toggle_switches_controller_s1_end_xfer;
  wire             toggle_switches_controller_s1_firsttransfer;
  wire             toggle_switches_controller_s1_grant_vector;
  wire             toggle_switches_controller_s1_in_a_read_cycle;
  wire             toggle_switches_controller_s1_in_a_write_cycle;
  wire             toggle_switches_controller_s1_master_qreq_vector;
  wire             toggle_switches_controller_s1_non_bursting_master_requests;
  wire    [ 17: 0] toggle_switches_controller_s1_readdata_from_sa;
  reg              toggle_switches_controller_s1_reg_firsttransfer;
  wire             toggle_switches_controller_s1_reset_n;
  reg              toggle_switches_controller_s1_slavearbiterlockenable;
  wire             toggle_switches_controller_s1_slavearbiterlockenable2;
  wire             toggle_switches_controller_s1_unreg_firsttransfer;
  wire             toggle_switches_controller_s1_waits_for_read;
  wire             toggle_switches_controller_s1_waits_for_write;
  wire             wait_for_toggle_switches_controller_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~toggle_switches_controller_s1_end_xfer;
    end


  assign toggle_switches_controller_s1_begins_xfer = ~d1_reasons_to_wait & ((CPU_data_master_qualified_request_toggle_switches_controller_s1));
  //assign toggle_switches_controller_s1_readdata_from_sa = toggle_switches_controller_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign toggle_switches_controller_s1_readdata_from_sa = toggle_switches_controller_s1_readdata;

  assign CPU_data_master_requests_toggle_switches_controller_s1 = (({CPU_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h9411080) & (CPU_data_master_read | CPU_data_master_write)) & CPU_data_master_read;
  //toggle_switches_controller_s1_arb_share_counter set values, which is an e_mux
  assign toggle_switches_controller_s1_arb_share_set_values = 1;

  //toggle_switches_controller_s1_non_bursting_master_requests mux, which is an e_mux
  assign toggle_switches_controller_s1_non_bursting_master_requests = CPU_data_master_requests_toggle_switches_controller_s1;

  //toggle_switches_controller_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign toggle_switches_controller_s1_any_bursting_master_saved_grant = 0;

  //toggle_switches_controller_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign toggle_switches_controller_s1_arb_share_counter_next_value = toggle_switches_controller_s1_firsttransfer ? (toggle_switches_controller_s1_arb_share_set_values - 1) : |toggle_switches_controller_s1_arb_share_counter ? (toggle_switches_controller_s1_arb_share_counter - 1) : 0;

  //toggle_switches_controller_s1_allgrants all slave grants, which is an e_mux
  assign toggle_switches_controller_s1_allgrants = |toggle_switches_controller_s1_grant_vector;

  //toggle_switches_controller_s1_end_xfer assignment, which is an e_assign
  assign toggle_switches_controller_s1_end_xfer = ~(toggle_switches_controller_s1_waits_for_read | toggle_switches_controller_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_toggle_switches_controller_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_toggle_switches_controller_s1 = toggle_switches_controller_s1_end_xfer & (~toggle_switches_controller_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //toggle_switches_controller_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign toggle_switches_controller_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_toggle_switches_controller_s1 & toggle_switches_controller_s1_allgrants) | (end_xfer_arb_share_counter_term_toggle_switches_controller_s1 & ~toggle_switches_controller_s1_non_bursting_master_requests);

  //toggle_switches_controller_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          toggle_switches_controller_s1_arb_share_counter <= 0;
      else if (toggle_switches_controller_s1_arb_counter_enable)
          toggle_switches_controller_s1_arb_share_counter <= toggle_switches_controller_s1_arb_share_counter_next_value;
    end


  //toggle_switches_controller_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          toggle_switches_controller_s1_slavearbiterlockenable <= 0;
      else if ((|toggle_switches_controller_s1_master_qreq_vector & end_xfer_arb_share_counter_term_toggle_switches_controller_s1) | (end_xfer_arb_share_counter_term_toggle_switches_controller_s1 & ~toggle_switches_controller_s1_non_bursting_master_requests))
          toggle_switches_controller_s1_slavearbiterlockenable <= |toggle_switches_controller_s1_arb_share_counter_next_value;
    end


  //CPU/data_master toggle_switches_controller/s1 arbiterlock, which is an e_assign
  assign CPU_data_master_arbiterlock = toggle_switches_controller_s1_slavearbiterlockenable & CPU_data_master_continuerequest;

  //toggle_switches_controller_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign toggle_switches_controller_s1_slavearbiterlockenable2 = |toggle_switches_controller_s1_arb_share_counter_next_value;

  //CPU/data_master toggle_switches_controller/s1 arbiterlock2, which is an e_assign
  assign CPU_data_master_arbiterlock2 = toggle_switches_controller_s1_slavearbiterlockenable2 & CPU_data_master_continuerequest;

  //toggle_switches_controller_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign toggle_switches_controller_s1_any_continuerequest = 1;

  //CPU_data_master_continuerequest continued request, which is an e_assign
  assign CPU_data_master_continuerequest = 1;

  assign CPU_data_master_qualified_request_toggle_switches_controller_s1 = CPU_data_master_requests_toggle_switches_controller_s1 & ~((CPU_data_master_read & ((CPU_data_master_latency_counter != 0))));
  //local readdatavalid CPU_data_master_read_data_valid_toggle_switches_controller_s1, which is an e_mux
  assign CPU_data_master_read_data_valid_toggle_switches_controller_s1 = CPU_data_master_granted_toggle_switches_controller_s1 & CPU_data_master_read & ~toggle_switches_controller_s1_waits_for_read;

  //master is always granted when requested
  assign CPU_data_master_granted_toggle_switches_controller_s1 = CPU_data_master_qualified_request_toggle_switches_controller_s1;

  //CPU/data_master saved-grant toggle_switches_controller/s1, which is an e_assign
  assign CPU_data_master_saved_grant_toggle_switches_controller_s1 = CPU_data_master_requests_toggle_switches_controller_s1;

  //allow new arb cycle for toggle_switches_controller/s1, which is an e_assign
  assign toggle_switches_controller_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign toggle_switches_controller_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign toggle_switches_controller_s1_master_qreq_vector = 1;

  //toggle_switches_controller_s1_reset_n assignment, which is an e_assign
  assign toggle_switches_controller_s1_reset_n = reset_n;

  //toggle_switches_controller_s1_firsttransfer first transaction, which is an e_assign
  assign toggle_switches_controller_s1_firsttransfer = toggle_switches_controller_s1_begins_xfer ? toggle_switches_controller_s1_unreg_firsttransfer : toggle_switches_controller_s1_reg_firsttransfer;

  //toggle_switches_controller_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign toggle_switches_controller_s1_unreg_firsttransfer = ~(toggle_switches_controller_s1_slavearbiterlockenable & toggle_switches_controller_s1_any_continuerequest);

  //toggle_switches_controller_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          toggle_switches_controller_s1_reg_firsttransfer <= 1'b1;
      else if (toggle_switches_controller_s1_begins_xfer)
          toggle_switches_controller_s1_reg_firsttransfer <= toggle_switches_controller_s1_unreg_firsttransfer;
    end


  //toggle_switches_controller_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign toggle_switches_controller_s1_beginbursttransfer_internal = toggle_switches_controller_s1_begins_xfer;

  assign shifted_address_to_toggle_switches_controller_s1_from_CPU_data_master = CPU_data_master_address_to_slave;
  //toggle_switches_controller_s1_address mux, which is an e_mux
  assign toggle_switches_controller_s1_address = shifted_address_to_toggle_switches_controller_s1_from_CPU_data_master >> 2;

  //d1_toggle_switches_controller_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_toggle_switches_controller_s1_end_xfer <= 1;
      else 
        d1_toggle_switches_controller_s1_end_xfer <= toggle_switches_controller_s1_end_xfer;
    end


  //toggle_switches_controller_s1_waits_for_read in a cycle, which is an e_mux
  assign toggle_switches_controller_s1_waits_for_read = toggle_switches_controller_s1_in_a_read_cycle & toggle_switches_controller_s1_begins_xfer;

  //toggle_switches_controller_s1_in_a_read_cycle assignment, which is an e_assign
  assign toggle_switches_controller_s1_in_a_read_cycle = CPU_data_master_granted_toggle_switches_controller_s1 & CPU_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = toggle_switches_controller_s1_in_a_read_cycle;

  //toggle_switches_controller_s1_waits_for_write in a cycle, which is an e_mux
  assign toggle_switches_controller_s1_waits_for_write = toggle_switches_controller_s1_in_a_write_cycle & 0;

  //toggle_switches_controller_s1_in_a_write_cycle assignment, which is an e_assign
  assign toggle_switches_controller_s1_in_a_write_cycle = CPU_data_master_granted_toggle_switches_controller_s1 & CPU_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = toggle_switches_controller_s1_in_a_write_cycle;

  assign wait_for_toggle_switches_controller_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //toggle_switches_controller/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_reset_clock_to_CPU_domain_synch_module (
                                                          // inputs:
                                                           clk,
                                                           data_in,
                                                           reset_n,

                                                          // outputs:
                                                           data_out
                                                        )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_reset_clock_from_board_domain_synch_module (
                                                              // inputs:
                                                               clk,
                                                               data_in,
                                                               reset_n,

                                                              // outputs:
                                                               data_out
                                                            )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC_reset_clock_to_SDRAM_domain_synch_module (
                                                            // inputs:
                                                             clk,
                                                             data_in,
                                                             reset_n,

                                                            // outputs:
                                                             data_out
                                                          )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Lab2_SOPC (
                   // 1) global signals:
                    clock_from_board,
                    clock_to_CPU,
                    clock_to_SDRAM,
                    reset_n,

                   // the_Flash_bridge_avalon_slave
                    address_to_the_Flash_controller,
                    data_to_and_from_the_Flash_controller,
                    read_n_to_the_Flash_controller,
                    select_n_to_the_Flash_controller,
                    write_n_to_the_Flash_controller,

                   // the_LCD_controller
                    LCD_E_from_the_LCD_controller,
                    LCD_RS_from_the_LCD_controller,
                    LCD_RW_from_the_LCD_controller,
                    LCD_data_to_and_from_the_LCD_controller,

                   // the_PLL
                    locked_from_the_PLL,
                    phasedone_from_the_PLL,

                   // the_SDRAM_controller
                    zs_addr_from_the_SDRAM_controller,
                    zs_ba_from_the_SDRAM_controller,
                    zs_cas_n_from_the_SDRAM_controller,
                    zs_cke_from_the_SDRAM_controller,
                    zs_cs_n_from_the_SDRAM_controller,
                    zs_dq_to_and_from_the_SDRAM_controller,
                    zs_dqm_from_the_SDRAM_controller,
                    zs_ras_n_from_the_SDRAM_controller,
                    zs_we_n_from_the_SDRAM_controller,

                   // the_SSRAM_bridge_avalon_slave
                    address_to_the_SSRAM_controller,
                    adsc_n_to_the_SSRAM_controller,
                    bw_n_to_the_SSRAM_controller,
                    bwe_n_to_the_SSRAM_controller,
                    chipenable1_n_to_the_SSRAM_controller,
                    data_to_and_from_the_SSRAM_controller,
                    outputenable_n_to_the_SSRAM_controller,
                    reset_n_to_the_SSRAM_controller,

                   // the_green_LEDs_controller
                    out_port_from_the_green_LEDs_controller,

                   // the_push_button_switches_controller
                    in_port_to_the_push_button_switches_controller,

                   // the_red_LEDs_controller
                    out_port_from_the_red_LEDs_controller,

                   // the_seven_segment_displays_controller
                    coe_s2_export_oHEX0_DP_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX0_D_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX1_DP_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX1_D_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX2_DP_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX2_D_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX3_DP_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX3_D_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX4_DP_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX4_D_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX5_DP_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX5_D_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX6_DP_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX6_D_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX7_DP_from_the_seven_segment_displays_controller,
                    coe_s2_export_oHEX7_D_from_the_seven_segment_displays_controller,

                   // the_toggle_switches_controller
                    in_port_to_the_toggle_switches_controller
                 )
;

  output           LCD_E_from_the_LCD_controller;
  output           LCD_RS_from_the_LCD_controller;
  output           LCD_RW_from_the_LCD_controller;
  inout   [  7: 0] LCD_data_to_and_from_the_LCD_controller;
  output  [ 22: 0] address_to_the_Flash_controller;
  output  [ 20: 0] address_to_the_SSRAM_controller;
  output           adsc_n_to_the_SSRAM_controller;
  output  [  3: 0] bw_n_to_the_SSRAM_controller;
  output           bwe_n_to_the_SSRAM_controller;
  output           chipenable1_n_to_the_SSRAM_controller;
  output           clock_to_CPU;
  output           clock_to_SDRAM;
  output           coe_s2_export_oHEX0_DP_from_the_seven_segment_displays_controller;
  output  [  6: 0] coe_s2_export_oHEX0_D_from_the_seven_segment_displays_controller;
  output           coe_s2_export_oHEX1_DP_from_the_seven_segment_displays_controller;
  output  [  6: 0] coe_s2_export_oHEX1_D_from_the_seven_segment_displays_controller;
  output           coe_s2_export_oHEX2_DP_from_the_seven_segment_displays_controller;
  output  [  6: 0] coe_s2_export_oHEX2_D_from_the_seven_segment_displays_controller;
  output           coe_s2_export_oHEX3_DP_from_the_seven_segment_displays_controller;
  output  [  6: 0] coe_s2_export_oHEX3_D_from_the_seven_segment_displays_controller;
  output           coe_s2_export_oHEX4_DP_from_the_seven_segment_displays_controller;
  output  [  6: 0] coe_s2_export_oHEX4_D_from_the_seven_segment_displays_controller;
  output           coe_s2_export_oHEX5_DP_from_the_seven_segment_displays_controller;
  output  [  6: 0] coe_s2_export_oHEX5_D_from_the_seven_segment_displays_controller;
  output           coe_s2_export_oHEX6_DP_from_the_seven_segment_displays_controller;
  output  [  6: 0] coe_s2_export_oHEX6_D_from_the_seven_segment_displays_controller;
  output           coe_s2_export_oHEX7_DP_from_the_seven_segment_displays_controller;
  output  [  6: 0] coe_s2_export_oHEX7_D_from_the_seven_segment_displays_controller;
  inout   [ 15: 0] data_to_and_from_the_Flash_controller;
  inout   [ 31: 0] data_to_and_from_the_SSRAM_controller;
  output           locked_from_the_PLL;
  output  [  7: 0] out_port_from_the_green_LEDs_controller;
  output  [ 17: 0] out_port_from_the_red_LEDs_controller;
  output           outputenable_n_to_the_SSRAM_controller;
  output           phasedone_from_the_PLL;
  output           read_n_to_the_Flash_controller;
  output           reset_n_to_the_SSRAM_controller;
  output           select_n_to_the_Flash_controller;
  output           write_n_to_the_Flash_controller;
  output  [ 12: 0] zs_addr_from_the_SDRAM_controller;
  output  [  1: 0] zs_ba_from_the_SDRAM_controller;
  output           zs_cas_n_from_the_SDRAM_controller;
  output           zs_cke_from_the_SDRAM_controller;
  output           zs_cs_n_from_the_SDRAM_controller;
  inout   [ 31: 0] zs_dq_to_and_from_the_SDRAM_controller;
  output  [  3: 0] zs_dqm_from_the_SDRAM_controller;
  output           zs_ras_n_from_the_SDRAM_controller;
  output           zs_we_n_from_the_SDRAM_controller;
  input            clock_from_board;
  input   [  3: 0] in_port_to_the_push_button_switches_controller;
  input   [ 17: 0] in_port_to_the_toggle_switches_controller;
  input            reset_n;

  wire    [ 27: 0] CPU_data_master_address;
  wire    [ 27: 0] CPU_data_master_address_to_slave;
  wire    [  3: 0] CPU_data_master_byteenable;
  wire    [  1: 0] CPU_data_master_byteenable_Flash_controller_s1;
  wire    [  1: 0] CPU_data_master_dbs_address;
  wire    [ 15: 0] CPU_data_master_dbs_write_16;
  wire             CPU_data_master_debugaccess;
  wire             CPU_data_master_granted_CPU_jtag_debug_module;
  wire             CPU_data_master_granted_Flash_controller_s1;
  wire             CPU_data_master_granted_JTAG_controller_avalon_jtag_slave;
  wire             CPU_data_master_granted_LCD_controller_control_slave;
  wire             CPU_data_master_granted_Lab2_SOPC_clock_0_in;
  wire             CPU_data_master_granted_Lab2_SOPC_clock_2_in;
  wire             CPU_data_master_granted_SSRAM_controller_s1;
  wire             CPU_data_master_granted_green_LEDs_controller_s1;
  wire             CPU_data_master_granted_on_chip_memory_s1;
  wire             CPU_data_master_granted_push_button_switches_controller_s1;
  wire             CPU_data_master_granted_red_LEDs_controller_s1;
  wire             CPU_data_master_granted_seven_segment_displays_controller_s1;
  wire             CPU_data_master_granted_sysid_control_slave;
  wire             CPU_data_master_granted_system_clock_timer_s1;
  wire             CPU_data_master_granted_timestamp_timer_s1;
  wire             CPU_data_master_granted_toggle_switches_controller_s1;
  wire    [ 31: 0] CPU_data_master_irq;
  wire    [  2: 0] CPU_data_master_latency_counter;
  wire             CPU_data_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_data_master_qualified_request_Flash_controller_s1;
  wire             CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave;
  wire             CPU_data_master_qualified_request_LCD_controller_control_slave;
  wire             CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in;
  wire             CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in;
  wire             CPU_data_master_qualified_request_SSRAM_controller_s1;
  wire             CPU_data_master_qualified_request_green_LEDs_controller_s1;
  wire             CPU_data_master_qualified_request_on_chip_memory_s1;
  wire             CPU_data_master_qualified_request_push_button_switches_controller_s1;
  wire             CPU_data_master_qualified_request_red_LEDs_controller_s1;
  wire             CPU_data_master_qualified_request_seven_segment_displays_controller_s1;
  wire             CPU_data_master_qualified_request_sysid_control_slave;
  wire             CPU_data_master_qualified_request_system_clock_timer_s1;
  wire             CPU_data_master_qualified_request_timestamp_timer_s1;
  wire             CPU_data_master_qualified_request_toggle_switches_controller_s1;
  wire             CPU_data_master_read;
  wire             CPU_data_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_data_master_read_data_valid_Flash_controller_s1;
  wire             CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave;
  wire             CPU_data_master_read_data_valid_LCD_controller_control_slave;
  wire             CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in;
  wire             CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in;
  wire             CPU_data_master_read_data_valid_SSRAM_controller_s1;
  wire             CPU_data_master_read_data_valid_green_LEDs_controller_s1;
  wire             CPU_data_master_read_data_valid_on_chip_memory_s1;
  wire             CPU_data_master_read_data_valid_push_button_switches_controller_s1;
  wire             CPU_data_master_read_data_valid_red_LEDs_controller_s1;
  wire             CPU_data_master_read_data_valid_seven_segment_displays_controller_s1;
  wire             CPU_data_master_read_data_valid_sysid_control_slave;
  wire             CPU_data_master_read_data_valid_system_clock_timer_s1;
  wire             CPU_data_master_read_data_valid_timestamp_timer_s1;
  wire             CPU_data_master_read_data_valid_toggle_switches_controller_s1;
  wire    [ 31: 0] CPU_data_master_readdata;
  wire             CPU_data_master_readdatavalid;
  wire             CPU_data_master_requests_CPU_jtag_debug_module;
  wire             CPU_data_master_requests_Flash_controller_s1;
  wire             CPU_data_master_requests_JTAG_controller_avalon_jtag_slave;
  wire             CPU_data_master_requests_LCD_controller_control_slave;
  wire             CPU_data_master_requests_Lab2_SOPC_clock_0_in;
  wire             CPU_data_master_requests_Lab2_SOPC_clock_2_in;
  wire             CPU_data_master_requests_SSRAM_controller_s1;
  wire             CPU_data_master_requests_green_LEDs_controller_s1;
  wire             CPU_data_master_requests_on_chip_memory_s1;
  wire             CPU_data_master_requests_push_button_switches_controller_s1;
  wire             CPU_data_master_requests_red_LEDs_controller_s1;
  wire             CPU_data_master_requests_seven_segment_displays_controller_s1;
  wire             CPU_data_master_requests_sysid_control_slave;
  wire             CPU_data_master_requests_system_clock_timer_s1;
  wire             CPU_data_master_requests_timestamp_timer_s1;
  wire             CPU_data_master_requests_toggle_switches_controller_s1;
  wire             CPU_data_master_waitrequest;
  wire             CPU_data_master_write;
  wire    [ 31: 0] CPU_data_master_writedata;
  wire    [ 27: 0] CPU_instruction_master_address;
  wire    [ 27: 0] CPU_instruction_master_address_to_slave;
  wire    [  1: 0] CPU_instruction_master_dbs_address;
  wire             CPU_instruction_master_granted_CPU_jtag_debug_module;
  wire             CPU_instruction_master_granted_Flash_controller_s1;
  wire             CPU_instruction_master_granted_Lab2_SOPC_clock_1_in;
  wire             CPU_instruction_master_granted_SSRAM_controller_s1;
  wire             CPU_instruction_master_granted_on_chip_memory_s1;
  wire    [  2: 0] CPU_instruction_master_latency_counter;
  wire             CPU_instruction_master_qualified_request_CPU_jtag_debug_module;
  wire             CPU_instruction_master_qualified_request_Flash_controller_s1;
  wire             CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in;
  wire             CPU_instruction_master_qualified_request_SSRAM_controller_s1;
  wire             CPU_instruction_master_qualified_request_on_chip_memory_s1;
  wire             CPU_instruction_master_read;
  wire             CPU_instruction_master_read_data_valid_CPU_jtag_debug_module;
  wire             CPU_instruction_master_read_data_valid_Flash_controller_s1;
  wire             CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in;
  wire             CPU_instruction_master_read_data_valid_SSRAM_controller_s1;
  wire             CPU_instruction_master_read_data_valid_on_chip_memory_s1;
  wire    [ 31: 0] CPU_instruction_master_readdata;
  wire             CPU_instruction_master_readdatavalid;
  wire             CPU_instruction_master_requests_CPU_jtag_debug_module;
  wire             CPU_instruction_master_requests_Flash_controller_s1;
  wire             CPU_instruction_master_requests_Lab2_SOPC_clock_1_in;
  wire             CPU_instruction_master_requests_SSRAM_controller_s1;
  wire             CPU_instruction_master_requests_on_chip_memory_s1;
  wire             CPU_instruction_master_waitrequest;
  wire    [  8: 0] CPU_jtag_debug_module_address;
  wire             CPU_jtag_debug_module_begintransfer;
  wire    [  3: 0] CPU_jtag_debug_module_byteenable;
  wire             CPU_jtag_debug_module_chipselect;
  wire             CPU_jtag_debug_module_debugaccess;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata;
  wire    [ 31: 0] CPU_jtag_debug_module_readdata_from_sa;
  wire             CPU_jtag_debug_module_reset_n;
  wire             CPU_jtag_debug_module_resetrequest;
  wire             CPU_jtag_debug_module_resetrequest_from_sa;
  wire             CPU_jtag_debug_module_write;
  wire    [ 31: 0] CPU_jtag_debug_module_writedata;
  wire             Flash_controller_s1_wait_counter_eq_0;
  wire             JTAG_controller_avalon_jtag_slave_address;
  wire             JTAG_controller_avalon_jtag_slave_chipselect;
  wire             JTAG_controller_avalon_jtag_slave_dataavailable;
  wire             JTAG_controller_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_irq;
  wire             JTAG_controller_avalon_jtag_slave_irq_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_read_n;
  wire    [ 31: 0] JTAG_controller_avalon_jtag_slave_readdata;
  wire    [ 31: 0] JTAG_controller_avalon_jtag_slave_readdata_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_readyfordata;
  wire             JTAG_controller_avalon_jtag_slave_readyfordata_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_reset_n;
  wire             JTAG_controller_avalon_jtag_slave_waitrequest;
  wire             JTAG_controller_avalon_jtag_slave_waitrequest_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_write_n;
  wire    [ 31: 0] JTAG_controller_avalon_jtag_slave_writedata;
  wire             LCD_E_from_the_LCD_controller;
  wire             LCD_RS_from_the_LCD_controller;
  wire             LCD_RW_from_the_LCD_controller;
  wire    [  1: 0] LCD_controller_control_slave_address;
  wire             LCD_controller_control_slave_begintransfer;
  wire             LCD_controller_control_slave_read;
  wire    [  7: 0] LCD_controller_control_slave_readdata;
  wire    [  7: 0] LCD_controller_control_slave_readdata_from_sa;
  wire             LCD_controller_control_slave_wait_counter_eq_0;
  wire             LCD_controller_control_slave_write;
  wire    [  7: 0] LCD_controller_control_slave_writedata;
  wire    [  7: 0] LCD_data_to_and_from_the_LCD_controller;
  wire    [  3: 0] Lab2_SOPC_clock_0_in_address;
  wire    [  3: 0] Lab2_SOPC_clock_0_in_byteenable;
  wire             Lab2_SOPC_clock_0_in_endofpacket;
  wire             Lab2_SOPC_clock_0_in_endofpacket_from_sa;
  wire    [  1: 0] Lab2_SOPC_clock_0_in_nativeaddress;
  wire             Lab2_SOPC_clock_0_in_read;
  wire    [ 31: 0] Lab2_SOPC_clock_0_in_readdata;
  wire    [ 31: 0] Lab2_SOPC_clock_0_in_readdata_from_sa;
  wire             Lab2_SOPC_clock_0_in_reset_n;
  wire             Lab2_SOPC_clock_0_in_waitrequest;
  wire             Lab2_SOPC_clock_0_in_waitrequest_from_sa;
  wire             Lab2_SOPC_clock_0_in_write;
  wire    [ 31: 0] Lab2_SOPC_clock_0_in_writedata;
  wire    [  3: 0] Lab2_SOPC_clock_0_out_address;
  wire    [  3: 0] Lab2_SOPC_clock_0_out_address_to_slave;
  wire    [  3: 0] Lab2_SOPC_clock_0_out_byteenable;
  wire             Lab2_SOPC_clock_0_out_endofpacket;
  wire             Lab2_SOPC_clock_0_out_granted_PLL_pll_slave;
  wire    [  1: 0] Lab2_SOPC_clock_0_out_nativeaddress;
  wire             Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave;
  wire             Lab2_SOPC_clock_0_out_read;
  wire             Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave;
  wire    [ 31: 0] Lab2_SOPC_clock_0_out_readdata;
  wire             Lab2_SOPC_clock_0_out_requests_PLL_pll_slave;
  wire             Lab2_SOPC_clock_0_out_reset_n;
  wire             Lab2_SOPC_clock_0_out_waitrequest;
  wire             Lab2_SOPC_clock_0_out_write;
  wire    [ 31: 0] Lab2_SOPC_clock_0_out_writedata;
  wire    [ 25: 0] Lab2_SOPC_clock_1_in_address;
  wire    [  3: 0] Lab2_SOPC_clock_1_in_byteenable;
  wire             Lab2_SOPC_clock_1_in_endofpacket;
  wire             Lab2_SOPC_clock_1_in_endofpacket_from_sa;
  wire    [ 23: 0] Lab2_SOPC_clock_1_in_nativeaddress;
  wire             Lab2_SOPC_clock_1_in_read;
  wire    [ 31: 0] Lab2_SOPC_clock_1_in_readdata;
  wire    [ 31: 0] Lab2_SOPC_clock_1_in_readdata_from_sa;
  wire             Lab2_SOPC_clock_1_in_reset_n;
  wire             Lab2_SOPC_clock_1_in_waitrequest;
  wire             Lab2_SOPC_clock_1_in_waitrequest_from_sa;
  wire             Lab2_SOPC_clock_1_in_write;
  wire    [ 31: 0] Lab2_SOPC_clock_1_in_writedata;
  wire    [ 25: 0] Lab2_SOPC_clock_1_out_address;
  wire    [ 25: 0] Lab2_SOPC_clock_1_out_address_to_slave;
  wire    [  3: 0] Lab2_SOPC_clock_1_out_byteenable;
  wire             Lab2_SOPC_clock_1_out_endofpacket;
  wire             Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1;
  wire    [ 23: 0] Lab2_SOPC_clock_1_out_nativeaddress;
  wire             Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_read;
  wire             Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register;
  wire    [ 31: 0] Lab2_SOPC_clock_1_out_readdata;
  wire             Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_1_out_reset_n;
  wire             Lab2_SOPC_clock_1_out_waitrequest;
  wire             Lab2_SOPC_clock_1_out_write;
  wire    [ 31: 0] Lab2_SOPC_clock_1_out_writedata;
  wire    [ 25: 0] Lab2_SOPC_clock_2_in_address;
  wire    [  3: 0] Lab2_SOPC_clock_2_in_byteenable;
  wire             Lab2_SOPC_clock_2_in_endofpacket;
  wire             Lab2_SOPC_clock_2_in_endofpacket_from_sa;
  wire    [ 23: 0] Lab2_SOPC_clock_2_in_nativeaddress;
  wire             Lab2_SOPC_clock_2_in_read;
  wire    [ 31: 0] Lab2_SOPC_clock_2_in_readdata;
  wire    [ 31: 0] Lab2_SOPC_clock_2_in_readdata_from_sa;
  wire             Lab2_SOPC_clock_2_in_reset_n;
  wire             Lab2_SOPC_clock_2_in_waitrequest;
  wire             Lab2_SOPC_clock_2_in_waitrequest_from_sa;
  wire             Lab2_SOPC_clock_2_in_write;
  wire    [ 31: 0] Lab2_SOPC_clock_2_in_writedata;
  wire    [ 25: 0] Lab2_SOPC_clock_2_out_address;
  wire    [ 25: 0] Lab2_SOPC_clock_2_out_address_to_slave;
  wire    [  3: 0] Lab2_SOPC_clock_2_out_byteenable;
  wire             Lab2_SOPC_clock_2_out_endofpacket;
  wire             Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1;
  wire    [ 23: 0] Lab2_SOPC_clock_2_out_nativeaddress;
  wire             Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_read;
  wire             Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register;
  wire    [ 31: 0] Lab2_SOPC_clock_2_out_readdata;
  wire             Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1;
  wire             Lab2_SOPC_clock_2_out_reset_n;
  wire             Lab2_SOPC_clock_2_out_waitrequest;
  wire             Lab2_SOPC_clock_2_out_write;
  wire    [ 31: 0] Lab2_SOPC_clock_2_out_writedata;
  wire    [  1: 0] PLL_pll_slave_address;
  wire             PLL_pll_slave_read;
  wire    [ 31: 0] PLL_pll_slave_readdata;
  wire    [ 31: 0] PLL_pll_slave_readdata_from_sa;
  wire             PLL_pll_slave_reset;
  wire             PLL_pll_slave_write;
  wire    [ 31: 0] PLL_pll_slave_writedata;
  wire    [ 23: 0] SDRAM_controller_s1_address;
  wire    [  3: 0] SDRAM_controller_s1_byteenable_n;
  wire             SDRAM_controller_s1_chipselect;
  wire             SDRAM_controller_s1_read_n;
  wire    [ 31: 0] SDRAM_controller_s1_readdata;
  wire    [ 31: 0] SDRAM_controller_s1_readdata_from_sa;
  wire             SDRAM_controller_s1_readdatavalid;
  wire             SDRAM_controller_s1_reset_n;
  wire             SDRAM_controller_s1_waitrequest;
  wire             SDRAM_controller_s1_waitrequest_from_sa;
  wire             SDRAM_controller_s1_write_n;
  wire    [ 31: 0] SDRAM_controller_s1_writedata;
  wire    [ 22: 0] address_to_the_Flash_controller;
  wire    [ 20: 0] address_to_the_SSRAM_controller;
  wire             adsc_n_to_the_SSRAM_controller;
  wire    [  3: 0] bw_n_to_the_SSRAM_controller;
  wire             bwe_n_to_the_SSRAM_controller;
  wire             chipenable1_n_to_the_SSRAM_controller;
  wire             clock_from_board_reset_n;
  wire             clock_to_CPU;
  wire             clock_to_CPU_reset_n;
  wire             clock_to_SDRAM;
  wire             clock_to_SDRAM_reset_n;
  wire             coe_s2_export_oHEX0_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX0_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX1_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX1_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX2_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX2_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX3_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX3_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX4_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX4_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX5_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX5_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX6_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX6_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX7_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX7_D_from_the_seven_segment_displays_controller;
  wire             d1_CPU_jtag_debug_module_end_xfer;
  wire             d1_Flash_bridge_avalon_slave_end_xfer;
  wire             d1_JTAG_controller_avalon_jtag_slave_end_xfer;
  wire             d1_LCD_controller_control_slave_end_xfer;
  wire             d1_Lab2_SOPC_clock_0_in_end_xfer;
  wire             d1_Lab2_SOPC_clock_1_in_end_xfer;
  wire             d1_Lab2_SOPC_clock_2_in_end_xfer;
  wire             d1_PLL_pll_slave_end_xfer;
  wire             d1_SDRAM_controller_s1_end_xfer;
  wire             d1_SSRAM_bridge_avalon_slave_end_xfer;
  wire             d1_green_LEDs_controller_s1_end_xfer;
  wire             d1_on_chip_memory_s1_end_xfer;
  wire             d1_push_button_switches_controller_s1_end_xfer;
  wire             d1_red_LEDs_controller_s1_end_xfer;
  wire             d1_seven_segment_displays_controller_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_system_clock_timer_s1_end_xfer;
  wire             d1_timestamp_timer_s1_end_xfer;
  wire             d1_toggle_switches_controller_s1_end_xfer;
  wire    [ 15: 0] data_to_and_from_the_Flash_controller;
  wire    [ 31: 0] data_to_and_from_the_SSRAM_controller;
  wire    [  1: 0] green_LEDs_controller_s1_address;
  wire             green_LEDs_controller_s1_chipselect;
  wire    [  7: 0] green_LEDs_controller_s1_readdata;
  wire    [  7: 0] green_LEDs_controller_s1_readdata_from_sa;
  wire             green_LEDs_controller_s1_reset_n;
  wire             green_LEDs_controller_s1_write_n;
  wire    [  7: 0] green_LEDs_controller_s1_writedata;
  wire    [ 15: 0] incoming_data_to_and_from_the_Flash_controller;
  wire    [ 15: 0] incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0;
  wire    [ 31: 0] incoming_data_to_and_from_the_SSRAM_controller;
  wire             locked_from_the_PLL;
  wire    [ 12: 0] on_chip_memory_s1_address;
  wire    [  3: 0] on_chip_memory_s1_byteenable;
  wire             on_chip_memory_s1_chipselect;
  wire             on_chip_memory_s1_clken;
  wire    [ 31: 0] on_chip_memory_s1_readdata;
  wire    [ 31: 0] on_chip_memory_s1_readdata_from_sa;
  wire             on_chip_memory_s1_reset;
  wire             on_chip_memory_s1_write;
  wire    [ 31: 0] on_chip_memory_s1_writedata;
  wire             out_clk_PLL_c0;
  wire             out_clk_PLL_c1;
  wire    [  7: 0] out_port_from_the_green_LEDs_controller;
  wire    [ 17: 0] out_port_from_the_red_LEDs_controller;
  wire             outputenable_n_to_the_SSRAM_controller;
  wire             phasedone_from_the_PLL;
  wire    [  1: 0] push_button_switches_controller_s1_address;
  wire    [  3: 0] push_button_switches_controller_s1_readdata;
  wire    [  3: 0] push_button_switches_controller_s1_readdata_from_sa;
  wire             push_button_switches_controller_s1_reset_n;
  wire             read_n_to_the_Flash_controller;
  wire    [  1: 0] red_LEDs_controller_s1_address;
  wire             red_LEDs_controller_s1_chipselect;
  wire    [ 17: 0] red_LEDs_controller_s1_readdata;
  wire    [ 17: 0] red_LEDs_controller_s1_readdata_from_sa;
  wire             red_LEDs_controller_s1_reset_n;
  wire             red_LEDs_controller_s1_write_n;
  wire    [ 17: 0] red_LEDs_controller_s1_writedata;
  wire             reset_n_sources;
  wire             reset_n_to_the_SSRAM_controller;
  wire             select_n_to_the_Flash_controller;
  wire    [  2: 0] seven_segment_displays_controller_s1_address;
  wire             seven_segment_displays_controller_s1_read_n;
  wire    [  3: 0] seven_segment_displays_controller_s1_readdata;
  wire    [  3: 0] seven_segment_displays_controller_s1_readdata_from_sa;
  wire             seven_segment_displays_controller_s1_reset_n;
  wire             seven_segment_displays_controller_s1_write_n;
  wire    [  3: 0] seven_segment_displays_controller_s1_writedata;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [  2: 0] system_clock_timer_s1_address;
  wire             system_clock_timer_s1_chipselect;
  wire             system_clock_timer_s1_irq;
  wire             system_clock_timer_s1_irq_from_sa;
  wire    [ 15: 0] system_clock_timer_s1_readdata;
  wire    [ 15: 0] system_clock_timer_s1_readdata_from_sa;
  wire             system_clock_timer_s1_reset_n;
  wire             system_clock_timer_s1_write_n;
  wire    [ 15: 0] system_clock_timer_s1_writedata;
  wire    [  2: 0] timestamp_timer_s1_address;
  wire             timestamp_timer_s1_chipselect;
  wire             timestamp_timer_s1_irq;
  wire             timestamp_timer_s1_irq_from_sa;
  wire    [ 15: 0] timestamp_timer_s1_readdata;
  wire    [ 15: 0] timestamp_timer_s1_readdata_from_sa;
  wire             timestamp_timer_s1_reset_n;
  wire             timestamp_timer_s1_write_n;
  wire    [ 15: 0] timestamp_timer_s1_writedata;
  wire    [  1: 0] toggle_switches_controller_s1_address;
  wire    [ 17: 0] toggle_switches_controller_s1_readdata;
  wire    [ 17: 0] toggle_switches_controller_s1_readdata_from_sa;
  wire             toggle_switches_controller_s1_reset_n;
  wire             write_n_to_the_Flash_controller;
  wire    [ 12: 0] zs_addr_from_the_SDRAM_controller;
  wire    [  1: 0] zs_ba_from_the_SDRAM_controller;
  wire             zs_cas_n_from_the_SDRAM_controller;
  wire             zs_cke_from_the_SDRAM_controller;
  wire             zs_cs_n_from_the_SDRAM_controller;
  wire    [ 31: 0] zs_dq_to_and_from_the_SDRAM_controller;
  wire    [  3: 0] zs_dqm_from_the_SDRAM_controller;
  wire             zs_ras_n_from_the_SDRAM_controller;
  wire             zs_we_n_from_the_SDRAM_controller;
  CPU_jtag_debug_module_arbitrator the_CPU_jtag_debug_module
    (
      .CPU_data_master_address_to_slave                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                     (CPU_data_master_byteenable),
      .CPU_data_master_debugaccess                                    (CPU_data_master_debugaccess),
      .CPU_data_master_granted_CPU_jtag_debug_module                  (CPU_data_master_granted_CPU_jtag_debug_module),
      .CPU_data_master_latency_counter                                (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_CPU_jtag_debug_module        (CPU_data_master_qualified_request_CPU_jtag_debug_module),
      .CPU_data_master_read                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_CPU_jtag_debug_module          (CPU_data_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_data_master_requests_CPU_jtag_debug_module                 (CPU_data_master_requests_CPU_jtag_debug_module),
      .CPU_data_master_write                                          (CPU_data_master_write),
      .CPU_data_master_writedata                                      (CPU_data_master_writedata),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_CPU_jtag_debug_module           (CPU_instruction_master_granted_CPU_jtag_debug_module),
      .CPU_instruction_master_latency_counter                         (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_CPU_jtag_debug_module (CPU_instruction_master_qualified_request_CPU_jtag_debug_module),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_CPU_jtag_debug_module   (CPU_instruction_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_instruction_master_requests_CPU_jtag_debug_module          (CPU_instruction_master_requests_CPU_jtag_debug_module),
      .CPU_jtag_debug_module_address                                  (CPU_jtag_debug_module_address),
      .CPU_jtag_debug_module_begintransfer                            (CPU_jtag_debug_module_begintransfer),
      .CPU_jtag_debug_module_byteenable                               (CPU_jtag_debug_module_byteenable),
      .CPU_jtag_debug_module_chipselect                               (CPU_jtag_debug_module_chipselect),
      .CPU_jtag_debug_module_debugaccess                              (CPU_jtag_debug_module_debugaccess),
      .CPU_jtag_debug_module_readdata                                 (CPU_jtag_debug_module_readdata),
      .CPU_jtag_debug_module_readdata_from_sa                         (CPU_jtag_debug_module_readdata_from_sa),
      .CPU_jtag_debug_module_reset_n                                  (CPU_jtag_debug_module_reset_n),
      .CPU_jtag_debug_module_resetrequest                             (CPU_jtag_debug_module_resetrequest),
      .CPU_jtag_debug_module_resetrequest_from_sa                     (CPU_jtag_debug_module_resetrequest_from_sa),
      .CPU_jtag_debug_module_write                                    (CPU_jtag_debug_module_write),
      .CPU_jtag_debug_module_writedata                                (CPU_jtag_debug_module_writedata),
      .clk                                                            (clock_to_CPU),
      .d1_CPU_jtag_debug_module_end_xfer                              (d1_CPU_jtag_debug_module_end_xfer),
      .reset_n                                                        (clock_to_CPU_reset_n)
    );

  CPU_data_master_arbitrator the_CPU_data_master
    (
      .CPU_data_master_address                                                (CPU_data_master_address),
      .CPU_data_master_address_to_slave                                       (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                             (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_Flash_controller_s1                         (CPU_data_master_byteenable_Flash_controller_s1),
      .CPU_data_master_dbs_address                                            (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                           (CPU_data_master_dbs_write_16),
      .CPU_data_master_granted_CPU_jtag_debug_module                          (CPU_data_master_granted_CPU_jtag_debug_module),
      .CPU_data_master_granted_Flash_controller_s1                            (CPU_data_master_granted_Flash_controller_s1),
      .CPU_data_master_granted_JTAG_controller_avalon_jtag_slave              (CPU_data_master_granted_JTAG_controller_avalon_jtag_slave),
      .CPU_data_master_granted_LCD_controller_control_slave                   (CPU_data_master_granted_LCD_controller_control_slave),
      .CPU_data_master_granted_Lab2_SOPC_clock_0_in                           (CPU_data_master_granted_Lab2_SOPC_clock_0_in),
      .CPU_data_master_granted_Lab2_SOPC_clock_2_in                           (CPU_data_master_granted_Lab2_SOPC_clock_2_in),
      .CPU_data_master_granted_SSRAM_controller_s1                            (CPU_data_master_granted_SSRAM_controller_s1),
      .CPU_data_master_granted_green_LEDs_controller_s1                       (CPU_data_master_granted_green_LEDs_controller_s1),
      .CPU_data_master_granted_on_chip_memory_s1                              (CPU_data_master_granted_on_chip_memory_s1),
      .CPU_data_master_granted_push_button_switches_controller_s1             (CPU_data_master_granted_push_button_switches_controller_s1),
      .CPU_data_master_granted_red_LEDs_controller_s1                         (CPU_data_master_granted_red_LEDs_controller_s1),
      .CPU_data_master_granted_seven_segment_displays_controller_s1           (CPU_data_master_granted_seven_segment_displays_controller_s1),
      .CPU_data_master_granted_sysid_control_slave                            (CPU_data_master_granted_sysid_control_slave),
      .CPU_data_master_granted_system_clock_timer_s1                          (CPU_data_master_granted_system_clock_timer_s1),
      .CPU_data_master_granted_timestamp_timer_s1                             (CPU_data_master_granted_timestamp_timer_s1),
      .CPU_data_master_granted_toggle_switches_controller_s1                  (CPU_data_master_granted_toggle_switches_controller_s1),
      .CPU_data_master_irq                                                    (CPU_data_master_irq),
      .CPU_data_master_latency_counter                                        (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_CPU_jtag_debug_module                (CPU_data_master_qualified_request_CPU_jtag_debug_module),
      .CPU_data_master_qualified_request_Flash_controller_s1                  (CPU_data_master_qualified_request_Flash_controller_s1),
      .CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave    (CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave),
      .CPU_data_master_qualified_request_LCD_controller_control_slave         (CPU_data_master_qualified_request_LCD_controller_control_slave),
      .CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in                 (CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in),
      .CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in                 (CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in),
      .CPU_data_master_qualified_request_SSRAM_controller_s1                  (CPU_data_master_qualified_request_SSRAM_controller_s1),
      .CPU_data_master_qualified_request_green_LEDs_controller_s1             (CPU_data_master_qualified_request_green_LEDs_controller_s1),
      .CPU_data_master_qualified_request_on_chip_memory_s1                    (CPU_data_master_qualified_request_on_chip_memory_s1),
      .CPU_data_master_qualified_request_push_button_switches_controller_s1   (CPU_data_master_qualified_request_push_button_switches_controller_s1),
      .CPU_data_master_qualified_request_red_LEDs_controller_s1               (CPU_data_master_qualified_request_red_LEDs_controller_s1),
      .CPU_data_master_qualified_request_seven_segment_displays_controller_s1 (CPU_data_master_qualified_request_seven_segment_displays_controller_s1),
      .CPU_data_master_qualified_request_sysid_control_slave                  (CPU_data_master_qualified_request_sysid_control_slave),
      .CPU_data_master_qualified_request_system_clock_timer_s1                (CPU_data_master_qualified_request_system_clock_timer_s1),
      .CPU_data_master_qualified_request_timestamp_timer_s1                   (CPU_data_master_qualified_request_timestamp_timer_s1),
      .CPU_data_master_qualified_request_toggle_switches_controller_s1        (CPU_data_master_qualified_request_toggle_switches_controller_s1),
      .CPU_data_master_read                                                   (CPU_data_master_read),
      .CPU_data_master_read_data_valid_CPU_jtag_debug_module                  (CPU_data_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_data_master_read_data_valid_Flash_controller_s1                    (CPU_data_master_read_data_valid_Flash_controller_s1),
      .CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave      (CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave),
      .CPU_data_master_read_data_valid_LCD_controller_control_slave           (CPU_data_master_read_data_valid_LCD_controller_control_slave),
      .CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in                   (CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in),
      .CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in                   (CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in),
      .CPU_data_master_read_data_valid_SSRAM_controller_s1                    (CPU_data_master_read_data_valid_SSRAM_controller_s1),
      .CPU_data_master_read_data_valid_green_LEDs_controller_s1               (CPU_data_master_read_data_valid_green_LEDs_controller_s1),
      .CPU_data_master_read_data_valid_on_chip_memory_s1                      (CPU_data_master_read_data_valid_on_chip_memory_s1),
      .CPU_data_master_read_data_valid_push_button_switches_controller_s1     (CPU_data_master_read_data_valid_push_button_switches_controller_s1),
      .CPU_data_master_read_data_valid_red_LEDs_controller_s1                 (CPU_data_master_read_data_valid_red_LEDs_controller_s1),
      .CPU_data_master_read_data_valid_seven_segment_displays_controller_s1   (CPU_data_master_read_data_valid_seven_segment_displays_controller_s1),
      .CPU_data_master_read_data_valid_sysid_control_slave                    (CPU_data_master_read_data_valid_sysid_control_slave),
      .CPU_data_master_read_data_valid_system_clock_timer_s1                  (CPU_data_master_read_data_valid_system_clock_timer_s1),
      .CPU_data_master_read_data_valid_timestamp_timer_s1                     (CPU_data_master_read_data_valid_timestamp_timer_s1),
      .CPU_data_master_read_data_valid_toggle_switches_controller_s1          (CPU_data_master_read_data_valid_toggle_switches_controller_s1),
      .CPU_data_master_readdata                                               (CPU_data_master_readdata),
      .CPU_data_master_readdatavalid                                          (CPU_data_master_readdatavalid),
      .CPU_data_master_requests_CPU_jtag_debug_module                         (CPU_data_master_requests_CPU_jtag_debug_module),
      .CPU_data_master_requests_Flash_controller_s1                           (CPU_data_master_requests_Flash_controller_s1),
      .CPU_data_master_requests_JTAG_controller_avalon_jtag_slave             (CPU_data_master_requests_JTAG_controller_avalon_jtag_slave),
      .CPU_data_master_requests_LCD_controller_control_slave                  (CPU_data_master_requests_LCD_controller_control_slave),
      .CPU_data_master_requests_Lab2_SOPC_clock_0_in                          (CPU_data_master_requests_Lab2_SOPC_clock_0_in),
      .CPU_data_master_requests_Lab2_SOPC_clock_2_in                          (CPU_data_master_requests_Lab2_SOPC_clock_2_in),
      .CPU_data_master_requests_SSRAM_controller_s1                           (CPU_data_master_requests_SSRAM_controller_s1),
      .CPU_data_master_requests_green_LEDs_controller_s1                      (CPU_data_master_requests_green_LEDs_controller_s1),
      .CPU_data_master_requests_on_chip_memory_s1                             (CPU_data_master_requests_on_chip_memory_s1),
      .CPU_data_master_requests_push_button_switches_controller_s1            (CPU_data_master_requests_push_button_switches_controller_s1),
      .CPU_data_master_requests_red_LEDs_controller_s1                        (CPU_data_master_requests_red_LEDs_controller_s1),
      .CPU_data_master_requests_seven_segment_displays_controller_s1          (CPU_data_master_requests_seven_segment_displays_controller_s1),
      .CPU_data_master_requests_sysid_control_slave                           (CPU_data_master_requests_sysid_control_slave),
      .CPU_data_master_requests_system_clock_timer_s1                         (CPU_data_master_requests_system_clock_timer_s1),
      .CPU_data_master_requests_timestamp_timer_s1                            (CPU_data_master_requests_timestamp_timer_s1),
      .CPU_data_master_requests_toggle_switches_controller_s1                 (CPU_data_master_requests_toggle_switches_controller_s1),
      .CPU_data_master_waitrequest                                            (CPU_data_master_waitrequest),
      .CPU_data_master_write                                                  (CPU_data_master_write),
      .CPU_data_master_writedata                                              (CPU_data_master_writedata),
      .CPU_jtag_debug_module_readdata_from_sa                                 (CPU_jtag_debug_module_readdata_from_sa),
      .Flash_controller_s1_wait_counter_eq_0                                  (Flash_controller_s1_wait_counter_eq_0),
      .JTAG_controller_avalon_jtag_slave_irq_from_sa                          (JTAG_controller_avalon_jtag_slave_irq_from_sa),
      .JTAG_controller_avalon_jtag_slave_readdata_from_sa                     (JTAG_controller_avalon_jtag_slave_readdata_from_sa),
      .JTAG_controller_avalon_jtag_slave_waitrequest_from_sa                  (JTAG_controller_avalon_jtag_slave_waitrequest_from_sa),
      .LCD_controller_control_slave_readdata_from_sa                          (LCD_controller_control_slave_readdata_from_sa),
      .LCD_controller_control_slave_wait_counter_eq_0                         (LCD_controller_control_slave_wait_counter_eq_0),
      .Lab2_SOPC_clock_0_in_readdata_from_sa                                  (Lab2_SOPC_clock_0_in_readdata_from_sa),
      .Lab2_SOPC_clock_0_in_waitrequest_from_sa                               (Lab2_SOPC_clock_0_in_waitrequest_from_sa),
      .Lab2_SOPC_clock_2_in_readdata_from_sa                                  (Lab2_SOPC_clock_2_in_readdata_from_sa),
      .Lab2_SOPC_clock_2_in_waitrequest_from_sa                               (Lab2_SOPC_clock_2_in_waitrequest_from_sa),
      .clk                                                                    (clock_to_CPU),
      .d1_CPU_jtag_debug_module_end_xfer                                      (d1_CPU_jtag_debug_module_end_xfer),
      .d1_Flash_bridge_avalon_slave_end_xfer                                  (d1_Flash_bridge_avalon_slave_end_xfer),
      .d1_JTAG_controller_avalon_jtag_slave_end_xfer                          (d1_JTAG_controller_avalon_jtag_slave_end_xfer),
      .d1_LCD_controller_control_slave_end_xfer                               (d1_LCD_controller_control_slave_end_xfer),
      .d1_Lab2_SOPC_clock_0_in_end_xfer                                       (d1_Lab2_SOPC_clock_0_in_end_xfer),
      .d1_Lab2_SOPC_clock_2_in_end_xfer                                       (d1_Lab2_SOPC_clock_2_in_end_xfer),
      .d1_SSRAM_bridge_avalon_slave_end_xfer                                  (d1_SSRAM_bridge_avalon_slave_end_xfer),
      .d1_green_LEDs_controller_s1_end_xfer                                   (d1_green_LEDs_controller_s1_end_xfer),
      .d1_on_chip_memory_s1_end_xfer                                          (d1_on_chip_memory_s1_end_xfer),
      .d1_push_button_switches_controller_s1_end_xfer                         (d1_push_button_switches_controller_s1_end_xfer),
      .d1_red_LEDs_controller_s1_end_xfer                                     (d1_red_LEDs_controller_s1_end_xfer),
      .d1_seven_segment_displays_controller_s1_end_xfer                       (d1_seven_segment_displays_controller_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                        (d1_sysid_control_slave_end_xfer),
      .d1_system_clock_timer_s1_end_xfer                                      (d1_system_clock_timer_s1_end_xfer),
      .d1_timestamp_timer_s1_end_xfer                                         (d1_timestamp_timer_s1_end_xfer),
      .d1_toggle_switches_controller_s1_end_xfer                              (d1_toggle_switches_controller_s1_end_xfer),
      .green_LEDs_controller_s1_readdata_from_sa                              (green_LEDs_controller_s1_readdata_from_sa),
      .incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0  (incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0),
      .incoming_data_to_and_from_the_SSRAM_controller                         (incoming_data_to_and_from_the_SSRAM_controller),
      .on_chip_memory_s1_readdata_from_sa                                     (on_chip_memory_s1_readdata_from_sa),
      .push_button_switches_controller_s1_readdata_from_sa                    (push_button_switches_controller_s1_readdata_from_sa),
      .red_LEDs_controller_s1_readdata_from_sa                                (red_LEDs_controller_s1_readdata_from_sa),
      .reset_n                                                                (clock_to_CPU_reset_n),
      .seven_segment_displays_controller_s1_readdata_from_sa                  (seven_segment_displays_controller_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                   (sysid_control_slave_readdata_from_sa),
      .system_clock_timer_s1_irq_from_sa                                      (system_clock_timer_s1_irq_from_sa),
      .system_clock_timer_s1_readdata_from_sa                                 (system_clock_timer_s1_readdata_from_sa),
      .timestamp_timer_s1_irq_from_sa                                         (timestamp_timer_s1_irq_from_sa),
      .timestamp_timer_s1_readdata_from_sa                                    (timestamp_timer_s1_readdata_from_sa),
      .toggle_switches_controller_s1_readdata_from_sa                         (toggle_switches_controller_s1_readdata_from_sa)
    );

  CPU_instruction_master_arbitrator the_CPU_instruction_master
    (
      .CPU_instruction_master_address                                 (CPU_instruction_master_address),
      .CPU_instruction_master_address_to_slave                        (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_dbs_address                             (CPU_instruction_master_dbs_address),
      .CPU_instruction_master_granted_CPU_jtag_debug_module           (CPU_instruction_master_granted_CPU_jtag_debug_module),
      .CPU_instruction_master_granted_Flash_controller_s1             (CPU_instruction_master_granted_Flash_controller_s1),
      .CPU_instruction_master_granted_Lab2_SOPC_clock_1_in            (CPU_instruction_master_granted_Lab2_SOPC_clock_1_in),
      .CPU_instruction_master_granted_SSRAM_controller_s1             (CPU_instruction_master_granted_SSRAM_controller_s1),
      .CPU_instruction_master_granted_on_chip_memory_s1               (CPU_instruction_master_granted_on_chip_memory_s1),
      .CPU_instruction_master_latency_counter                         (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_CPU_jtag_debug_module (CPU_instruction_master_qualified_request_CPU_jtag_debug_module),
      .CPU_instruction_master_qualified_request_Flash_controller_s1   (CPU_instruction_master_qualified_request_Flash_controller_s1),
      .CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in  (CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in),
      .CPU_instruction_master_qualified_request_SSRAM_controller_s1   (CPU_instruction_master_qualified_request_SSRAM_controller_s1),
      .CPU_instruction_master_qualified_request_on_chip_memory_s1     (CPU_instruction_master_qualified_request_on_chip_memory_s1),
      .CPU_instruction_master_read                                    (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_CPU_jtag_debug_module   (CPU_instruction_master_read_data_valid_CPU_jtag_debug_module),
      .CPU_instruction_master_read_data_valid_Flash_controller_s1     (CPU_instruction_master_read_data_valid_Flash_controller_s1),
      .CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in    (CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in),
      .CPU_instruction_master_read_data_valid_SSRAM_controller_s1     (CPU_instruction_master_read_data_valid_SSRAM_controller_s1),
      .CPU_instruction_master_read_data_valid_on_chip_memory_s1       (CPU_instruction_master_read_data_valid_on_chip_memory_s1),
      .CPU_instruction_master_readdata                                (CPU_instruction_master_readdata),
      .CPU_instruction_master_readdatavalid                           (CPU_instruction_master_readdatavalid),
      .CPU_instruction_master_requests_CPU_jtag_debug_module          (CPU_instruction_master_requests_CPU_jtag_debug_module),
      .CPU_instruction_master_requests_Flash_controller_s1            (CPU_instruction_master_requests_Flash_controller_s1),
      .CPU_instruction_master_requests_Lab2_SOPC_clock_1_in           (CPU_instruction_master_requests_Lab2_SOPC_clock_1_in),
      .CPU_instruction_master_requests_SSRAM_controller_s1            (CPU_instruction_master_requests_SSRAM_controller_s1),
      .CPU_instruction_master_requests_on_chip_memory_s1              (CPU_instruction_master_requests_on_chip_memory_s1),
      .CPU_instruction_master_waitrequest                             (CPU_instruction_master_waitrequest),
      .CPU_jtag_debug_module_readdata_from_sa                         (CPU_jtag_debug_module_readdata_from_sa),
      .Flash_controller_s1_wait_counter_eq_0                          (Flash_controller_s1_wait_counter_eq_0),
      .Lab2_SOPC_clock_1_in_readdata_from_sa                          (Lab2_SOPC_clock_1_in_readdata_from_sa),
      .Lab2_SOPC_clock_1_in_waitrequest_from_sa                       (Lab2_SOPC_clock_1_in_waitrequest_from_sa),
      .clk                                                            (clock_to_CPU),
      .d1_CPU_jtag_debug_module_end_xfer                              (d1_CPU_jtag_debug_module_end_xfer),
      .d1_Flash_bridge_avalon_slave_end_xfer                          (d1_Flash_bridge_avalon_slave_end_xfer),
      .d1_Lab2_SOPC_clock_1_in_end_xfer                               (d1_Lab2_SOPC_clock_1_in_end_xfer),
      .d1_SSRAM_bridge_avalon_slave_end_xfer                          (d1_SSRAM_bridge_avalon_slave_end_xfer),
      .d1_on_chip_memory_s1_end_xfer                                  (d1_on_chip_memory_s1_end_xfer),
      .incoming_data_to_and_from_the_Flash_controller                 (incoming_data_to_and_from_the_Flash_controller),
      .incoming_data_to_and_from_the_SSRAM_controller                 (incoming_data_to_and_from_the_SSRAM_controller),
      .on_chip_memory_s1_readdata_from_sa                             (on_chip_memory_s1_readdata_from_sa),
      .reset_n                                                        (clock_to_CPU_reset_n)
    );

  CPU the_CPU
    (
      .clk                                   (clock_to_CPU),
      .d_address                             (CPU_data_master_address),
      .d_byteenable                          (CPU_data_master_byteenable),
      .d_irq                                 (CPU_data_master_irq),
      .d_read                                (CPU_data_master_read),
      .d_readdata                            (CPU_data_master_readdata),
      .d_readdatavalid                       (CPU_data_master_readdatavalid),
      .d_waitrequest                         (CPU_data_master_waitrequest),
      .d_write                               (CPU_data_master_write),
      .d_writedata                           (CPU_data_master_writedata),
      .i_address                             (CPU_instruction_master_address),
      .i_read                                (CPU_instruction_master_read),
      .i_readdata                            (CPU_instruction_master_readdata),
      .i_readdatavalid                       (CPU_instruction_master_readdatavalid),
      .i_waitrequest                         (CPU_instruction_master_waitrequest),
      .jtag_debug_module_address             (CPU_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (CPU_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (CPU_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (CPU_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (CPU_data_master_debugaccess),
      .jtag_debug_module_readdata            (CPU_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (CPU_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (CPU_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (CPU_jtag_debug_module_write),
      .jtag_debug_module_writedata           (CPU_jtag_debug_module_writedata),
      .reset_n                               (CPU_jtag_debug_module_reset_n)
    );

  Flash_bridge_avalon_slave_arbitrator the_Flash_bridge_avalon_slave
    (
      .CPU_data_master_address_to_slave                                      (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                            (CPU_data_master_byteenable),
      .CPU_data_master_byteenable_Flash_controller_s1                        (CPU_data_master_byteenable_Flash_controller_s1),
      .CPU_data_master_dbs_address                                           (CPU_data_master_dbs_address),
      .CPU_data_master_dbs_write_16                                          (CPU_data_master_dbs_write_16),
      .CPU_data_master_granted_Flash_controller_s1                           (CPU_data_master_granted_Flash_controller_s1),
      .CPU_data_master_latency_counter                                       (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_Flash_controller_s1                 (CPU_data_master_qualified_request_Flash_controller_s1),
      .CPU_data_master_read                                                  (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Flash_controller_s1                   (CPU_data_master_read_data_valid_Flash_controller_s1),
      .CPU_data_master_requests_Flash_controller_s1                          (CPU_data_master_requests_Flash_controller_s1),
      .CPU_data_master_write                                                 (CPU_data_master_write),
      .CPU_instruction_master_address_to_slave                               (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_dbs_address                                    (CPU_instruction_master_dbs_address),
      .CPU_instruction_master_granted_Flash_controller_s1                    (CPU_instruction_master_granted_Flash_controller_s1),
      .CPU_instruction_master_latency_counter                                (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_Flash_controller_s1          (CPU_instruction_master_qualified_request_Flash_controller_s1),
      .CPU_instruction_master_read                                           (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_Flash_controller_s1            (CPU_instruction_master_read_data_valid_Flash_controller_s1),
      .CPU_instruction_master_requests_Flash_controller_s1                   (CPU_instruction_master_requests_Flash_controller_s1),
      .Flash_controller_s1_wait_counter_eq_0                                 (Flash_controller_s1_wait_counter_eq_0),
      .address_to_the_Flash_controller                                       (address_to_the_Flash_controller),
      .clk                                                                   (clock_to_CPU),
      .d1_Flash_bridge_avalon_slave_end_xfer                                 (d1_Flash_bridge_avalon_slave_end_xfer),
      .data_to_and_from_the_Flash_controller                                 (data_to_and_from_the_Flash_controller),
      .incoming_data_to_and_from_the_Flash_controller                        (incoming_data_to_and_from_the_Flash_controller),
      .incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0 (incoming_data_to_and_from_the_Flash_controller_with_Xs_converted_to_0),
      .read_n_to_the_Flash_controller                                        (read_n_to_the_Flash_controller),
      .reset_n                                                               (clock_to_CPU_reset_n),
      .select_n_to_the_Flash_controller                                      (select_n_to_the_Flash_controller),
      .write_n_to_the_Flash_controller                                       (write_n_to_the_Flash_controller)
    );

  JTAG_controller_avalon_jtag_slave_arbitrator the_JTAG_controller_avalon_jtag_slave
    (
      .CPU_data_master_address_to_slave                                    (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_JTAG_controller_avalon_jtag_slave           (CPU_data_master_granted_JTAG_controller_avalon_jtag_slave),
      .CPU_data_master_latency_counter                                     (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave (CPU_data_master_qualified_request_JTAG_controller_avalon_jtag_slave),
      .CPU_data_master_read                                                (CPU_data_master_read),
      .CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave   (CPU_data_master_read_data_valid_JTAG_controller_avalon_jtag_slave),
      .CPU_data_master_requests_JTAG_controller_avalon_jtag_slave          (CPU_data_master_requests_JTAG_controller_avalon_jtag_slave),
      .CPU_data_master_write                                               (CPU_data_master_write),
      .CPU_data_master_writedata                                           (CPU_data_master_writedata),
      .JTAG_controller_avalon_jtag_slave_address                           (JTAG_controller_avalon_jtag_slave_address),
      .JTAG_controller_avalon_jtag_slave_chipselect                        (JTAG_controller_avalon_jtag_slave_chipselect),
      .JTAG_controller_avalon_jtag_slave_dataavailable                     (JTAG_controller_avalon_jtag_slave_dataavailable),
      .JTAG_controller_avalon_jtag_slave_dataavailable_from_sa             (JTAG_controller_avalon_jtag_slave_dataavailable_from_sa),
      .JTAG_controller_avalon_jtag_slave_irq                               (JTAG_controller_avalon_jtag_slave_irq),
      .JTAG_controller_avalon_jtag_slave_irq_from_sa                       (JTAG_controller_avalon_jtag_slave_irq_from_sa),
      .JTAG_controller_avalon_jtag_slave_read_n                            (JTAG_controller_avalon_jtag_slave_read_n),
      .JTAG_controller_avalon_jtag_slave_readdata                          (JTAG_controller_avalon_jtag_slave_readdata),
      .JTAG_controller_avalon_jtag_slave_readdata_from_sa                  (JTAG_controller_avalon_jtag_slave_readdata_from_sa),
      .JTAG_controller_avalon_jtag_slave_readyfordata                      (JTAG_controller_avalon_jtag_slave_readyfordata),
      .JTAG_controller_avalon_jtag_slave_readyfordata_from_sa              (JTAG_controller_avalon_jtag_slave_readyfordata_from_sa),
      .JTAG_controller_avalon_jtag_slave_reset_n                           (JTAG_controller_avalon_jtag_slave_reset_n),
      .JTAG_controller_avalon_jtag_slave_waitrequest                       (JTAG_controller_avalon_jtag_slave_waitrequest),
      .JTAG_controller_avalon_jtag_slave_waitrequest_from_sa               (JTAG_controller_avalon_jtag_slave_waitrequest_from_sa),
      .JTAG_controller_avalon_jtag_slave_write_n                           (JTAG_controller_avalon_jtag_slave_write_n),
      .JTAG_controller_avalon_jtag_slave_writedata                         (JTAG_controller_avalon_jtag_slave_writedata),
      .clk                                                                 (clock_to_CPU),
      .d1_JTAG_controller_avalon_jtag_slave_end_xfer                       (d1_JTAG_controller_avalon_jtag_slave_end_xfer),
      .reset_n                                                             (clock_to_CPU_reset_n)
    );

  JTAG_controller the_JTAG_controller
    (
      .av_address     (JTAG_controller_avalon_jtag_slave_address),
      .av_chipselect  (JTAG_controller_avalon_jtag_slave_chipselect),
      .av_irq         (JTAG_controller_avalon_jtag_slave_irq),
      .av_read_n      (JTAG_controller_avalon_jtag_slave_read_n),
      .av_readdata    (JTAG_controller_avalon_jtag_slave_readdata),
      .av_waitrequest (JTAG_controller_avalon_jtag_slave_waitrequest),
      .av_write_n     (JTAG_controller_avalon_jtag_slave_write_n),
      .av_writedata   (JTAG_controller_avalon_jtag_slave_writedata),
      .clk            (clock_to_CPU),
      .dataavailable  (JTAG_controller_avalon_jtag_slave_dataavailable),
      .readyfordata   (JTAG_controller_avalon_jtag_slave_readyfordata),
      .rst_n          (JTAG_controller_avalon_jtag_slave_reset_n)
    );

  LCD_controller_control_slave_arbitrator the_LCD_controller_control_slave
    (
      .CPU_data_master_address_to_slave                               (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                     (CPU_data_master_byteenable),
      .CPU_data_master_granted_LCD_controller_control_slave           (CPU_data_master_granted_LCD_controller_control_slave),
      .CPU_data_master_latency_counter                                (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_LCD_controller_control_slave (CPU_data_master_qualified_request_LCD_controller_control_slave),
      .CPU_data_master_read                                           (CPU_data_master_read),
      .CPU_data_master_read_data_valid_LCD_controller_control_slave   (CPU_data_master_read_data_valid_LCD_controller_control_slave),
      .CPU_data_master_requests_LCD_controller_control_slave          (CPU_data_master_requests_LCD_controller_control_slave),
      .CPU_data_master_write                                          (CPU_data_master_write),
      .CPU_data_master_writedata                                      (CPU_data_master_writedata),
      .LCD_controller_control_slave_address                           (LCD_controller_control_slave_address),
      .LCD_controller_control_slave_begintransfer                     (LCD_controller_control_slave_begintransfer),
      .LCD_controller_control_slave_read                              (LCD_controller_control_slave_read),
      .LCD_controller_control_slave_readdata                          (LCD_controller_control_slave_readdata),
      .LCD_controller_control_slave_readdata_from_sa                  (LCD_controller_control_slave_readdata_from_sa),
      .LCD_controller_control_slave_wait_counter_eq_0                 (LCD_controller_control_slave_wait_counter_eq_0),
      .LCD_controller_control_slave_write                             (LCD_controller_control_slave_write),
      .LCD_controller_control_slave_writedata                         (LCD_controller_control_slave_writedata),
      .clk                                                            (clock_to_CPU),
      .d1_LCD_controller_control_slave_end_xfer                       (d1_LCD_controller_control_slave_end_xfer),
      .reset_n                                                        (clock_to_CPU_reset_n)
    );

  LCD_controller the_LCD_controller
    (
      .LCD_E         (LCD_E_from_the_LCD_controller),
      .LCD_RS        (LCD_RS_from_the_LCD_controller),
      .LCD_RW        (LCD_RW_from_the_LCD_controller),
      .LCD_data      (LCD_data_to_and_from_the_LCD_controller),
      .address       (LCD_controller_control_slave_address),
      .begintransfer (LCD_controller_control_slave_begintransfer),
      .read          (LCD_controller_control_slave_read),
      .readdata      (LCD_controller_control_slave_readdata),
      .write         (LCD_controller_control_slave_write),
      .writedata     (LCD_controller_control_slave_writedata)
    );

  Lab2_SOPC_clock_0_in_arbitrator the_Lab2_SOPC_clock_0_in
    (
      .CPU_data_master_address_to_slave                       (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                             (CPU_data_master_byteenable),
      .CPU_data_master_granted_Lab2_SOPC_clock_0_in           (CPU_data_master_granted_Lab2_SOPC_clock_0_in),
      .CPU_data_master_latency_counter                        (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in (CPU_data_master_qualified_request_Lab2_SOPC_clock_0_in),
      .CPU_data_master_read                                   (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in   (CPU_data_master_read_data_valid_Lab2_SOPC_clock_0_in),
      .CPU_data_master_requests_Lab2_SOPC_clock_0_in          (CPU_data_master_requests_Lab2_SOPC_clock_0_in),
      .CPU_data_master_write                                  (CPU_data_master_write),
      .CPU_data_master_writedata                              (CPU_data_master_writedata),
      .Lab2_SOPC_clock_0_in_address                           (Lab2_SOPC_clock_0_in_address),
      .Lab2_SOPC_clock_0_in_byteenable                        (Lab2_SOPC_clock_0_in_byteenable),
      .Lab2_SOPC_clock_0_in_endofpacket                       (Lab2_SOPC_clock_0_in_endofpacket),
      .Lab2_SOPC_clock_0_in_endofpacket_from_sa               (Lab2_SOPC_clock_0_in_endofpacket_from_sa),
      .Lab2_SOPC_clock_0_in_nativeaddress                     (Lab2_SOPC_clock_0_in_nativeaddress),
      .Lab2_SOPC_clock_0_in_read                              (Lab2_SOPC_clock_0_in_read),
      .Lab2_SOPC_clock_0_in_readdata                          (Lab2_SOPC_clock_0_in_readdata),
      .Lab2_SOPC_clock_0_in_readdata_from_sa                  (Lab2_SOPC_clock_0_in_readdata_from_sa),
      .Lab2_SOPC_clock_0_in_reset_n                           (Lab2_SOPC_clock_0_in_reset_n),
      .Lab2_SOPC_clock_0_in_waitrequest                       (Lab2_SOPC_clock_0_in_waitrequest),
      .Lab2_SOPC_clock_0_in_waitrequest_from_sa               (Lab2_SOPC_clock_0_in_waitrequest_from_sa),
      .Lab2_SOPC_clock_0_in_write                             (Lab2_SOPC_clock_0_in_write),
      .Lab2_SOPC_clock_0_in_writedata                         (Lab2_SOPC_clock_0_in_writedata),
      .clk                                                    (clock_to_CPU),
      .d1_Lab2_SOPC_clock_0_in_end_xfer                       (d1_Lab2_SOPC_clock_0_in_end_xfer),
      .reset_n                                                (clock_to_CPU_reset_n)
    );

  Lab2_SOPC_clock_0_out_arbitrator the_Lab2_SOPC_clock_0_out
    (
      .Lab2_SOPC_clock_0_out_address                         (Lab2_SOPC_clock_0_out_address),
      .Lab2_SOPC_clock_0_out_address_to_slave                (Lab2_SOPC_clock_0_out_address_to_slave),
      .Lab2_SOPC_clock_0_out_byteenable                      (Lab2_SOPC_clock_0_out_byteenable),
      .Lab2_SOPC_clock_0_out_granted_PLL_pll_slave           (Lab2_SOPC_clock_0_out_granted_PLL_pll_slave),
      .Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave (Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave),
      .Lab2_SOPC_clock_0_out_read                            (Lab2_SOPC_clock_0_out_read),
      .Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave   (Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave),
      .Lab2_SOPC_clock_0_out_readdata                        (Lab2_SOPC_clock_0_out_readdata),
      .Lab2_SOPC_clock_0_out_requests_PLL_pll_slave          (Lab2_SOPC_clock_0_out_requests_PLL_pll_slave),
      .Lab2_SOPC_clock_0_out_reset_n                         (Lab2_SOPC_clock_0_out_reset_n),
      .Lab2_SOPC_clock_0_out_waitrequest                     (Lab2_SOPC_clock_0_out_waitrequest),
      .Lab2_SOPC_clock_0_out_write                           (Lab2_SOPC_clock_0_out_write),
      .Lab2_SOPC_clock_0_out_writedata                       (Lab2_SOPC_clock_0_out_writedata),
      .PLL_pll_slave_readdata_from_sa                        (PLL_pll_slave_readdata_from_sa),
      .clk                                                   (clock_from_board),
      .d1_PLL_pll_slave_end_xfer                             (d1_PLL_pll_slave_end_xfer),
      .reset_n                                               (clock_from_board_reset_n)
    );

  Lab2_SOPC_clock_0 the_Lab2_SOPC_clock_0
    (
      .master_address       (Lab2_SOPC_clock_0_out_address),
      .master_byteenable    (Lab2_SOPC_clock_0_out_byteenable),
      .master_clk           (clock_from_board),
      .master_endofpacket   (Lab2_SOPC_clock_0_out_endofpacket),
      .master_nativeaddress (Lab2_SOPC_clock_0_out_nativeaddress),
      .master_read          (Lab2_SOPC_clock_0_out_read),
      .master_readdata      (Lab2_SOPC_clock_0_out_readdata),
      .master_reset_n       (Lab2_SOPC_clock_0_out_reset_n),
      .master_waitrequest   (Lab2_SOPC_clock_0_out_waitrequest),
      .master_write         (Lab2_SOPC_clock_0_out_write),
      .master_writedata     (Lab2_SOPC_clock_0_out_writedata),
      .slave_address        (Lab2_SOPC_clock_0_in_address),
      .slave_byteenable     (Lab2_SOPC_clock_0_in_byteenable),
      .slave_clk            (clock_to_CPU),
      .slave_endofpacket    (Lab2_SOPC_clock_0_in_endofpacket),
      .slave_nativeaddress  (Lab2_SOPC_clock_0_in_nativeaddress),
      .slave_read           (Lab2_SOPC_clock_0_in_read),
      .slave_readdata       (Lab2_SOPC_clock_0_in_readdata),
      .slave_reset_n        (Lab2_SOPC_clock_0_in_reset_n),
      .slave_waitrequest    (Lab2_SOPC_clock_0_in_waitrequest),
      .slave_write          (Lab2_SOPC_clock_0_in_write),
      .slave_writedata      (Lab2_SOPC_clock_0_in_writedata)
    );

  Lab2_SOPC_clock_1_in_arbitrator the_Lab2_SOPC_clock_1_in
    (
      .CPU_instruction_master_address_to_slave                       (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_Lab2_SOPC_clock_1_in           (CPU_instruction_master_granted_Lab2_SOPC_clock_1_in),
      .CPU_instruction_master_latency_counter                        (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in (CPU_instruction_master_qualified_request_Lab2_SOPC_clock_1_in),
      .CPU_instruction_master_read                                   (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in   (CPU_instruction_master_read_data_valid_Lab2_SOPC_clock_1_in),
      .CPU_instruction_master_requests_Lab2_SOPC_clock_1_in          (CPU_instruction_master_requests_Lab2_SOPC_clock_1_in),
      .Lab2_SOPC_clock_1_in_address                                  (Lab2_SOPC_clock_1_in_address),
      .Lab2_SOPC_clock_1_in_byteenable                               (Lab2_SOPC_clock_1_in_byteenable),
      .Lab2_SOPC_clock_1_in_endofpacket                              (Lab2_SOPC_clock_1_in_endofpacket),
      .Lab2_SOPC_clock_1_in_endofpacket_from_sa                      (Lab2_SOPC_clock_1_in_endofpacket_from_sa),
      .Lab2_SOPC_clock_1_in_nativeaddress                            (Lab2_SOPC_clock_1_in_nativeaddress),
      .Lab2_SOPC_clock_1_in_read                                     (Lab2_SOPC_clock_1_in_read),
      .Lab2_SOPC_clock_1_in_readdata                                 (Lab2_SOPC_clock_1_in_readdata),
      .Lab2_SOPC_clock_1_in_readdata_from_sa                         (Lab2_SOPC_clock_1_in_readdata_from_sa),
      .Lab2_SOPC_clock_1_in_reset_n                                  (Lab2_SOPC_clock_1_in_reset_n),
      .Lab2_SOPC_clock_1_in_waitrequest                              (Lab2_SOPC_clock_1_in_waitrequest),
      .Lab2_SOPC_clock_1_in_waitrequest_from_sa                      (Lab2_SOPC_clock_1_in_waitrequest_from_sa),
      .Lab2_SOPC_clock_1_in_write                                    (Lab2_SOPC_clock_1_in_write),
      .clk                                                           (clock_to_CPU),
      .d1_Lab2_SOPC_clock_1_in_end_xfer                              (d1_Lab2_SOPC_clock_1_in_end_xfer),
      .reset_n                                                       (clock_to_CPU_reset_n)
    );

  Lab2_SOPC_clock_1_out_arbitrator the_Lab2_SOPC_clock_1_out
    (
      .Lab2_SOPC_clock_1_out_address                                            (Lab2_SOPC_clock_1_out_address),
      .Lab2_SOPC_clock_1_out_address_to_slave                                   (Lab2_SOPC_clock_1_out_address_to_slave),
      .Lab2_SOPC_clock_1_out_byteenable                                         (Lab2_SOPC_clock_1_out_byteenable),
      .Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1                        (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1),
      .Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1              (Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1),
      .Lab2_SOPC_clock_1_out_read                                               (Lab2_SOPC_clock_1_out_read),
      .Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1                (Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1),
      .Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register (Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register),
      .Lab2_SOPC_clock_1_out_readdata                                           (Lab2_SOPC_clock_1_out_readdata),
      .Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1                       (Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1),
      .Lab2_SOPC_clock_1_out_reset_n                                            (Lab2_SOPC_clock_1_out_reset_n),
      .Lab2_SOPC_clock_1_out_waitrequest                                        (Lab2_SOPC_clock_1_out_waitrequest),
      .Lab2_SOPC_clock_1_out_write                                              (Lab2_SOPC_clock_1_out_write),
      .Lab2_SOPC_clock_1_out_writedata                                          (Lab2_SOPC_clock_1_out_writedata),
      .SDRAM_controller_s1_readdata_from_sa                                     (SDRAM_controller_s1_readdata_from_sa),
      .SDRAM_controller_s1_waitrequest_from_sa                                  (SDRAM_controller_s1_waitrequest_from_sa),
      .clk                                                                      (clock_to_SDRAM),
      .d1_SDRAM_controller_s1_end_xfer                                          (d1_SDRAM_controller_s1_end_xfer),
      .reset_n                                                                  (clock_to_SDRAM_reset_n)
    );

  Lab2_SOPC_clock_1 the_Lab2_SOPC_clock_1
    (
      .master_address       (Lab2_SOPC_clock_1_out_address),
      .master_byteenable    (Lab2_SOPC_clock_1_out_byteenable),
      .master_clk           (clock_to_SDRAM),
      .master_endofpacket   (Lab2_SOPC_clock_1_out_endofpacket),
      .master_nativeaddress (Lab2_SOPC_clock_1_out_nativeaddress),
      .master_read          (Lab2_SOPC_clock_1_out_read),
      .master_readdata      (Lab2_SOPC_clock_1_out_readdata),
      .master_reset_n       (Lab2_SOPC_clock_1_out_reset_n),
      .master_waitrequest   (Lab2_SOPC_clock_1_out_waitrequest),
      .master_write         (Lab2_SOPC_clock_1_out_write),
      .master_writedata     (Lab2_SOPC_clock_1_out_writedata),
      .slave_address        (Lab2_SOPC_clock_1_in_address),
      .slave_byteenable     (Lab2_SOPC_clock_1_in_byteenable),
      .slave_clk            (clock_to_CPU),
      .slave_endofpacket    (Lab2_SOPC_clock_1_in_endofpacket),
      .slave_nativeaddress  (Lab2_SOPC_clock_1_in_nativeaddress),
      .slave_read           (Lab2_SOPC_clock_1_in_read),
      .slave_readdata       (Lab2_SOPC_clock_1_in_readdata),
      .slave_reset_n        (Lab2_SOPC_clock_1_in_reset_n),
      .slave_waitrequest    (Lab2_SOPC_clock_1_in_waitrequest),
      .slave_write          (Lab2_SOPC_clock_1_in_write),
      .slave_writedata      (Lab2_SOPC_clock_1_in_writedata)
    );

  Lab2_SOPC_clock_2_in_arbitrator the_Lab2_SOPC_clock_2_in
    (
      .CPU_data_master_address_to_slave                       (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                             (CPU_data_master_byteenable),
      .CPU_data_master_granted_Lab2_SOPC_clock_2_in           (CPU_data_master_granted_Lab2_SOPC_clock_2_in),
      .CPU_data_master_latency_counter                        (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in (CPU_data_master_qualified_request_Lab2_SOPC_clock_2_in),
      .CPU_data_master_read                                   (CPU_data_master_read),
      .CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in   (CPU_data_master_read_data_valid_Lab2_SOPC_clock_2_in),
      .CPU_data_master_requests_Lab2_SOPC_clock_2_in          (CPU_data_master_requests_Lab2_SOPC_clock_2_in),
      .CPU_data_master_write                                  (CPU_data_master_write),
      .CPU_data_master_writedata                              (CPU_data_master_writedata),
      .Lab2_SOPC_clock_2_in_address                           (Lab2_SOPC_clock_2_in_address),
      .Lab2_SOPC_clock_2_in_byteenable                        (Lab2_SOPC_clock_2_in_byteenable),
      .Lab2_SOPC_clock_2_in_endofpacket                       (Lab2_SOPC_clock_2_in_endofpacket),
      .Lab2_SOPC_clock_2_in_endofpacket_from_sa               (Lab2_SOPC_clock_2_in_endofpacket_from_sa),
      .Lab2_SOPC_clock_2_in_nativeaddress                     (Lab2_SOPC_clock_2_in_nativeaddress),
      .Lab2_SOPC_clock_2_in_read                              (Lab2_SOPC_clock_2_in_read),
      .Lab2_SOPC_clock_2_in_readdata                          (Lab2_SOPC_clock_2_in_readdata),
      .Lab2_SOPC_clock_2_in_readdata_from_sa                  (Lab2_SOPC_clock_2_in_readdata_from_sa),
      .Lab2_SOPC_clock_2_in_reset_n                           (Lab2_SOPC_clock_2_in_reset_n),
      .Lab2_SOPC_clock_2_in_waitrequest                       (Lab2_SOPC_clock_2_in_waitrequest),
      .Lab2_SOPC_clock_2_in_waitrequest_from_sa               (Lab2_SOPC_clock_2_in_waitrequest_from_sa),
      .Lab2_SOPC_clock_2_in_write                             (Lab2_SOPC_clock_2_in_write),
      .Lab2_SOPC_clock_2_in_writedata                         (Lab2_SOPC_clock_2_in_writedata),
      .clk                                                    (clock_to_CPU),
      .d1_Lab2_SOPC_clock_2_in_end_xfer                       (d1_Lab2_SOPC_clock_2_in_end_xfer),
      .reset_n                                                (clock_to_CPU_reset_n)
    );

  Lab2_SOPC_clock_2_out_arbitrator the_Lab2_SOPC_clock_2_out
    (
      .Lab2_SOPC_clock_2_out_address                                            (Lab2_SOPC_clock_2_out_address),
      .Lab2_SOPC_clock_2_out_address_to_slave                                   (Lab2_SOPC_clock_2_out_address_to_slave),
      .Lab2_SOPC_clock_2_out_byteenable                                         (Lab2_SOPC_clock_2_out_byteenable),
      .Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1                        (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1),
      .Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1              (Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1),
      .Lab2_SOPC_clock_2_out_read                                               (Lab2_SOPC_clock_2_out_read),
      .Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1                (Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1),
      .Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register (Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register),
      .Lab2_SOPC_clock_2_out_readdata                                           (Lab2_SOPC_clock_2_out_readdata),
      .Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1                       (Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1),
      .Lab2_SOPC_clock_2_out_reset_n                                            (Lab2_SOPC_clock_2_out_reset_n),
      .Lab2_SOPC_clock_2_out_waitrequest                                        (Lab2_SOPC_clock_2_out_waitrequest),
      .Lab2_SOPC_clock_2_out_write                                              (Lab2_SOPC_clock_2_out_write),
      .Lab2_SOPC_clock_2_out_writedata                                          (Lab2_SOPC_clock_2_out_writedata),
      .SDRAM_controller_s1_readdata_from_sa                                     (SDRAM_controller_s1_readdata_from_sa),
      .SDRAM_controller_s1_waitrequest_from_sa                                  (SDRAM_controller_s1_waitrequest_from_sa),
      .clk                                                                      (clock_to_SDRAM),
      .d1_SDRAM_controller_s1_end_xfer                                          (d1_SDRAM_controller_s1_end_xfer),
      .reset_n                                                                  (clock_to_SDRAM_reset_n)
    );

  Lab2_SOPC_clock_2 the_Lab2_SOPC_clock_2
    (
      .master_address       (Lab2_SOPC_clock_2_out_address),
      .master_byteenable    (Lab2_SOPC_clock_2_out_byteenable),
      .master_clk           (clock_to_SDRAM),
      .master_endofpacket   (Lab2_SOPC_clock_2_out_endofpacket),
      .master_nativeaddress (Lab2_SOPC_clock_2_out_nativeaddress),
      .master_read          (Lab2_SOPC_clock_2_out_read),
      .master_readdata      (Lab2_SOPC_clock_2_out_readdata),
      .master_reset_n       (Lab2_SOPC_clock_2_out_reset_n),
      .master_waitrequest   (Lab2_SOPC_clock_2_out_waitrequest),
      .master_write         (Lab2_SOPC_clock_2_out_write),
      .master_writedata     (Lab2_SOPC_clock_2_out_writedata),
      .slave_address        (Lab2_SOPC_clock_2_in_address),
      .slave_byteenable     (Lab2_SOPC_clock_2_in_byteenable),
      .slave_clk            (clock_to_CPU),
      .slave_endofpacket    (Lab2_SOPC_clock_2_in_endofpacket),
      .slave_nativeaddress  (Lab2_SOPC_clock_2_in_nativeaddress),
      .slave_read           (Lab2_SOPC_clock_2_in_read),
      .slave_readdata       (Lab2_SOPC_clock_2_in_readdata),
      .slave_reset_n        (Lab2_SOPC_clock_2_in_reset_n),
      .slave_waitrequest    (Lab2_SOPC_clock_2_in_waitrequest),
      .slave_write          (Lab2_SOPC_clock_2_in_write),
      .slave_writedata      (Lab2_SOPC_clock_2_in_writedata)
    );

  PLL_pll_slave_arbitrator the_PLL_pll_slave
    (
      .Lab2_SOPC_clock_0_out_address_to_slave                (Lab2_SOPC_clock_0_out_address_to_slave),
      .Lab2_SOPC_clock_0_out_granted_PLL_pll_slave           (Lab2_SOPC_clock_0_out_granted_PLL_pll_slave),
      .Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave (Lab2_SOPC_clock_0_out_qualified_request_PLL_pll_slave),
      .Lab2_SOPC_clock_0_out_read                            (Lab2_SOPC_clock_0_out_read),
      .Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave   (Lab2_SOPC_clock_0_out_read_data_valid_PLL_pll_slave),
      .Lab2_SOPC_clock_0_out_requests_PLL_pll_slave          (Lab2_SOPC_clock_0_out_requests_PLL_pll_slave),
      .Lab2_SOPC_clock_0_out_write                           (Lab2_SOPC_clock_0_out_write),
      .Lab2_SOPC_clock_0_out_writedata                       (Lab2_SOPC_clock_0_out_writedata),
      .PLL_pll_slave_address                                 (PLL_pll_slave_address),
      .PLL_pll_slave_read                                    (PLL_pll_slave_read),
      .PLL_pll_slave_readdata                                (PLL_pll_slave_readdata),
      .PLL_pll_slave_readdata_from_sa                        (PLL_pll_slave_readdata_from_sa),
      .PLL_pll_slave_reset                                   (PLL_pll_slave_reset),
      .PLL_pll_slave_write                                   (PLL_pll_slave_write),
      .PLL_pll_slave_writedata                               (PLL_pll_slave_writedata),
      .clk                                                   (clock_from_board),
      .d1_PLL_pll_slave_end_xfer                             (d1_PLL_pll_slave_end_xfer),
      .reset_n                                               (clock_from_board_reset_n)
    );

  //clock_to_CPU out_clk assignment, which is an e_assign
  assign clock_to_CPU = out_clk_PLL_c0;

  //clock_to_SDRAM out_clk assignment, which is an e_assign
  assign clock_to_SDRAM = out_clk_PLL_c1;

  PLL the_PLL
    (
      .address   (PLL_pll_slave_address),
      .c0        (out_clk_PLL_c0),
      .c1        (out_clk_PLL_c1),
      .clk       (clock_from_board),
      .locked    (locked_from_the_PLL),
      .phasedone (phasedone_from_the_PLL),
      .read      (PLL_pll_slave_read),
      .readdata  (PLL_pll_slave_readdata),
      .reset     (PLL_pll_slave_reset),
      .write     (PLL_pll_slave_write),
      .writedata (PLL_pll_slave_writedata)
    );

  SDRAM_controller_s1_arbitrator the_SDRAM_controller_s1
    (
      .Lab2_SOPC_clock_1_out_address_to_slave                                   (Lab2_SOPC_clock_1_out_address_to_slave),
      .Lab2_SOPC_clock_1_out_byteenable                                         (Lab2_SOPC_clock_1_out_byteenable),
      .Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1                        (Lab2_SOPC_clock_1_out_granted_SDRAM_controller_s1),
      .Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1              (Lab2_SOPC_clock_1_out_qualified_request_SDRAM_controller_s1),
      .Lab2_SOPC_clock_1_out_read                                               (Lab2_SOPC_clock_1_out_read),
      .Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1                (Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1),
      .Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register (Lab2_SOPC_clock_1_out_read_data_valid_SDRAM_controller_s1_shift_register),
      .Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1                       (Lab2_SOPC_clock_1_out_requests_SDRAM_controller_s1),
      .Lab2_SOPC_clock_1_out_write                                              (Lab2_SOPC_clock_1_out_write),
      .Lab2_SOPC_clock_1_out_writedata                                          (Lab2_SOPC_clock_1_out_writedata),
      .Lab2_SOPC_clock_2_out_address_to_slave                                   (Lab2_SOPC_clock_2_out_address_to_slave),
      .Lab2_SOPC_clock_2_out_byteenable                                         (Lab2_SOPC_clock_2_out_byteenable),
      .Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1                        (Lab2_SOPC_clock_2_out_granted_SDRAM_controller_s1),
      .Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1              (Lab2_SOPC_clock_2_out_qualified_request_SDRAM_controller_s1),
      .Lab2_SOPC_clock_2_out_read                                               (Lab2_SOPC_clock_2_out_read),
      .Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1                (Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1),
      .Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register (Lab2_SOPC_clock_2_out_read_data_valid_SDRAM_controller_s1_shift_register),
      .Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1                       (Lab2_SOPC_clock_2_out_requests_SDRAM_controller_s1),
      .Lab2_SOPC_clock_2_out_write                                              (Lab2_SOPC_clock_2_out_write),
      .Lab2_SOPC_clock_2_out_writedata                                          (Lab2_SOPC_clock_2_out_writedata),
      .SDRAM_controller_s1_address                                              (SDRAM_controller_s1_address),
      .SDRAM_controller_s1_byteenable_n                                         (SDRAM_controller_s1_byteenable_n),
      .SDRAM_controller_s1_chipselect                                           (SDRAM_controller_s1_chipselect),
      .SDRAM_controller_s1_read_n                                               (SDRAM_controller_s1_read_n),
      .SDRAM_controller_s1_readdata                                             (SDRAM_controller_s1_readdata),
      .SDRAM_controller_s1_readdata_from_sa                                     (SDRAM_controller_s1_readdata_from_sa),
      .SDRAM_controller_s1_readdatavalid                                        (SDRAM_controller_s1_readdatavalid),
      .SDRAM_controller_s1_reset_n                                              (SDRAM_controller_s1_reset_n),
      .SDRAM_controller_s1_waitrequest                                          (SDRAM_controller_s1_waitrequest),
      .SDRAM_controller_s1_waitrequest_from_sa                                  (SDRAM_controller_s1_waitrequest_from_sa),
      .SDRAM_controller_s1_write_n                                              (SDRAM_controller_s1_write_n),
      .SDRAM_controller_s1_writedata                                            (SDRAM_controller_s1_writedata),
      .clk                                                                      (clock_to_SDRAM),
      .d1_SDRAM_controller_s1_end_xfer                                          (d1_SDRAM_controller_s1_end_xfer),
      .reset_n                                                                  (clock_to_SDRAM_reset_n)
    );

  SDRAM_controller the_SDRAM_controller
    (
      .az_addr        (SDRAM_controller_s1_address),
      .az_be_n        (SDRAM_controller_s1_byteenable_n),
      .az_cs          (SDRAM_controller_s1_chipselect),
      .az_data        (SDRAM_controller_s1_writedata),
      .az_rd_n        (SDRAM_controller_s1_read_n),
      .az_wr_n        (SDRAM_controller_s1_write_n),
      .clk            (clock_to_SDRAM),
      .reset_n        (SDRAM_controller_s1_reset_n),
      .za_data        (SDRAM_controller_s1_readdata),
      .za_valid       (SDRAM_controller_s1_readdatavalid),
      .za_waitrequest (SDRAM_controller_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_SDRAM_controller),
      .zs_ba          (zs_ba_from_the_SDRAM_controller),
      .zs_cas_n       (zs_cas_n_from_the_SDRAM_controller),
      .zs_cke         (zs_cke_from_the_SDRAM_controller),
      .zs_cs_n        (zs_cs_n_from_the_SDRAM_controller),
      .zs_dq          (zs_dq_to_and_from_the_SDRAM_controller),
      .zs_dqm         (zs_dqm_from_the_SDRAM_controller),
      .zs_ras_n       (zs_ras_n_from_the_SDRAM_controller),
      .zs_we_n        (zs_we_n_from_the_SDRAM_controller)
    );

  SSRAM_bridge_avalon_slave_arbitrator the_SSRAM_bridge_avalon_slave
    (
      .CPU_data_master_address_to_slave                             (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                   (CPU_data_master_byteenable),
      .CPU_data_master_granted_SSRAM_controller_s1                  (CPU_data_master_granted_SSRAM_controller_s1),
      .CPU_data_master_latency_counter                              (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_SSRAM_controller_s1        (CPU_data_master_qualified_request_SSRAM_controller_s1),
      .CPU_data_master_read                                         (CPU_data_master_read),
      .CPU_data_master_read_data_valid_SSRAM_controller_s1          (CPU_data_master_read_data_valid_SSRAM_controller_s1),
      .CPU_data_master_requests_SSRAM_controller_s1                 (CPU_data_master_requests_SSRAM_controller_s1),
      .CPU_data_master_write                                        (CPU_data_master_write),
      .CPU_data_master_writedata                                    (CPU_data_master_writedata),
      .CPU_instruction_master_address_to_slave                      (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_SSRAM_controller_s1           (CPU_instruction_master_granted_SSRAM_controller_s1),
      .CPU_instruction_master_latency_counter                       (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_SSRAM_controller_s1 (CPU_instruction_master_qualified_request_SSRAM_controller_s1),
      .CPU_instruction_master_read                                  (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_SSRAM_controller_s1   (CPU_instruction_master_read_data_valid_SSRAM_controller_s1),
      .CPU_instruction_master_requests_SSRAM_controller_s1          (CPU_instruction_master_requests_SSRAM_controller_s1),
      .address_to_the_SSRAM_controller                              (address_to_the_SSRAM_controller),
      .adsc_n_to_the_SSRAM_controller                               (adsc_n_to_the_SSRAM_controller),
      .bw_n_to_the_SSRAM_controller                                 (bw_n_to_the_SSRAM_controller),
      .bwe_n_to_the_SSRAM_controller                                (bwe_n_to_the_SSRAM_controller),
      .chipenable1_n_to_the_SSRAM_controller                        (chipenable1_n_to_the_SSRAM_controller),
      .clk                                                          (clock_to_CPU),
      .d1_SSRAM_bridge_avalon_slave_end_xfer                        (d1_SSRAM_bridge_avalon_slave_end_xfer),
      .data_to_and_from_the_SSRAM_controller                        (data_to_and_from_the_SSRAM_controller),
      .incoming_data_to_and_from_the_SSRAM_controller               (incoming_data_to_and_from_the_SSRAM_controller),
      .outputenable_n_to_the_SSRAM_controller                       (outputenable_n_to_the_SSRAM_controller),
      .reset_n                                                      (clock_to_CPU_reset_n),
      .reset_n_to_the_SSRAM_controller                              (reset_n_to_the_SSRAM_controller)
    );

  green_LEDs_controller_s1_arbitrator the_green_LEDs_controller_s1
    (
      .CPU_data_master_address_to_slave                           (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                 (CPU_data_master_byteenable),
      .CPU_data_master_granted_green_LEDs_controller_s1           (CPU_data_master_granted_green_LEDs_controller_s1),
      .CPU_data_master_latency_counter                            (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_green_LEDs_controller_s1 (CPU_data_master_qualified_request_green_LEDs_controller_s1),
      .CPU_data_master_read                                       (CPU_data_master_read),
      .CPU_data_master_read_data_valid_green_LEDs_controller_s1   (CPU_data_master_read_data_valid_green_LEDs_controller_s1),
      .CPU_data_master_requests_green_LEDs_controller_s1          (CPU_data_master_requests_green_LEDs_controller_s1),
      .CPU_data_master_write                                      (CPU_data_master_write),
      .CPU_data_master_writedata                                  (CPU_data_master_writedata),
      .clk                                                        (clock_to_CPU),
      .d1_green_LEDs_controller_s1_end_xfer                       (d1_green_LEDs_controller_s1_end_xfer),
      .green_LEDs_controller_s1_address                           (green_LEDs_controller_s1_address),
      .green_LEDs_controller_s1_chipselect                        (green_LEDs_controller_s1_chipselect),
      .green_LEDs_controller_s1_readdata                          (green_LEDs_controller_s1_readdata),
      .green_LEDs_controller_s1_readdata_from_sa                  (green_LEDs_controller_s1_readdata_from_sa),
      .green_LEDs_controller_s1_reset_n                           (green_LEDs_controller_s1_reset_n),
      .green_LEDs_controller_s1_write_n                           (green_LEDs_controller_s1_write_n),
      .green_LEDs_controller_s1_writedata                         (green_LEDs_controller_s1_writedata),
      .reset_n                                                    (clock_to_CPU_reset_n)
    );

  green_LEDs_controller the_green_LEDs_controller
    (
      .address    (green_LEDs_controller_s1_address),
      .chipselect (green_LEDs_controller_s1_chipselect),
      .clk        (clock_to_CPU),
      .out_port   (out_port_from_the_green_LEDs_controller),
      .readdata   (green_LEDs_controller_s1_readdata),
      .reset_n    (green_LEDs_controller_s1_reset_n),
      .write_n    (green_LEDs_controller_s1_write_n),
      .writedata  (green_LEDs_controller_s1_writedata)
    );

  on_chip_memory_s1_arbitrator the_on_chip_memory_s1
    (
      .CPU_data_master_address_to_slave                           (CPU_data_master_address_to_slave),
      .CPU_data_master_byteenable                                 (CPU_data_master_byteenable),
      .CPU_data_master_granted_on_chip_memory_s1                  (CPU_data_master_granted_on_chip_memory_s1),
      .CPU_data_master_latency_counter                            (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_on_chip_memory_s1        (CPU_data_master_qualified_request_on_chip_memory_s1),
      .CPU_data_master_read                                       (CPU_data_master_read),
      .CPU_data_master_read_data_valid_on_chip_memory_s1          (CPU_data_master_read_data_valid_on_chip_memory_s1),
      .CPU_data_master_requests_on_chip_memory_s1                 (CPU_data_master_requests_on_chip_memory_s1),
      .CPU_data_master_write                                      (CPU_data_master_write),
      .CPU_data_master_writedata                                  (CPU_data_master_writedata),
      .CPU_instruction_master_address_to_slave                    (CPU_instruction_master_address_to_slave),
      .CPU_instruction_master_granted_on_chip_memory_s1           (CPU_instruction_master_granted_on_chip_memory_s1),
      .CPU_instruction_master_latency_counter                     (CPU_instruction_master_latency_counter),
      .CPU_instruction_master_qualified_request_on_chip_memory_s1 (CPU_instruction_master_qualified_request_on_chip_memory_s1),
      .CPU_instruction_master_read                                (CPU_instruction_master_read),
      .CPU_instruction_master_read_data_valid_on_chip_memory_s1   (CPU_instruction_master_read_data_valid_on_chip_memory_s1),
      .CPU_instruction_master_requests_on_chip_memory_s1          (CPU_instruction_master_requests_on_chip_memory_s1),
      .clk                                                        (clock_to_CPU),
      .d1_on_chip_memory_s1_end_xfer                              (d1_on_chip_memory_s1_end_xfer),
      .on_chip_memory_s1_address                                  (on_chip_memory_s1_address),
      .on_chip_memory_s1_byteenable                               (on_chip_memory_s1_byteenable),
      .on_chip_memory_s1_chipselect                               (on_chip_memory_s1_chipselect),
      .on_chip_memory_s1_clken                                    (on_chip_memory_s1_clken),
      .on_chip_memory_s1_readdata                                 (on_chip_memory_s1_readdata),
      .on_chip_memory_s1_readdata_from_sa                         (on_chip_memory_s1_readdata_from_sa),
      .on_chip_memory_s1_reset                                    (on_chip_memory_s1_reset),
      .on_chip_memory_s1_write                                    (on_chip_memory_s1_write),
      .on_chip_memory_s1_writedata                                (on_chip_memory_s1_writedata),
      .reset_n                                                    (clock_to_CPU_reset_n)
    );

  on_chip_memory the_on_chip_memory
    (
      .address    (on_chip_memory_s1_address),
      .byteenable (on_chip_memory_s1_byteenable),
      .chipselect (on_chip_memory_s1_chipselect),
      .clk        (clock_to_CPU),
      .clken      (on_chip_memory_s1_clken),
      .readdata   (on_chip_memory_s1_readdata),
      .reset      (on_chip_memory_s1_reset),
      .write      (on_chip_memory_s1_write),
      .writedata  (on_chip_memory_s1_writedata)
    );

  push_button_switches_controller_s1_arbitrator the_push_button_switches_controller_s1
    (
      .CPU_data_master_address_to_slave                                     (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_push_button_switches_controller_s1           (CPU_data_master_granted_push_button_switches_controller_s1),
      .CPU_data_master_latency_counter                                      (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_push_button_switches_controller_s1 (CPU_data_master_qualified_request_push_button_switches_controller_s1),
      .CPU_data_master_read                                                 (CPU_data_master_read),
      .CPU_data_master_read_data_valid_push_button_switches_controller_s1   (CPU_data_master_read_data_valid_push_button_switches_controller_s1),
      .CPU_data_master_requests_push_button_switches_controller_s1          (CPU_data_master_requests_push_button_switches_controller_s1),
      .CPU_data_master_write                                                (CPU_data_master_write),
      .clk                                                                  (clock_to_CPU),
      .d1_push_button_switches_controller_s1_end_xfer                       (d1_push_button_switches_controller_s1_end_xfer),
      .push_button_switches_controller_s1_address                           (push_button_switches_controller_s1_address),
      .push_button_switches_controller_s1_readdata                          (push_button_switches_controller_s1_readdata),
      .push_button_switches_controller_s1_readdata_from_sa                  (push_button_switches_controller_s1_readdata_from_sa),
      .push_button_switches_controller_s1_reset_n                           (push_button_switches_controller_s1_reset_n),
      .reset_n                                                              (clock_to_CPU_reset_n)
    );

  push_button_switches_controller the_push_button_switches_controller
    (
      .address  (push_button_switches_controller_s1_address),
      .clk      (clock_to_CPU),
      .in_port  (in_port_to_the_push_button_switches_controller),
      .readdata (push_button_switches_controller_s1_readdata),
      .reset_n  (push_button_switches_controller_s1_reset_n)
    );

  red_LEDs_controller_s1_arbitrator the_red_LEDs_controller_s1
    (
      .CPU_data_master_address_to_slave                         (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_red_LEDs_controller_s1           (CPU_data_master_granted_red_LEDs_controller_s1),
      .CPU_data_master_latency_counter                          (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_red_LEDs_controller_s1 (CPU_data_master_qualified_request_red_LEDs_controller_s1),
      .CPU_data_master_read                                     (CPU_data_master_read),
      .CPU_data_master_read_data_valid_red_LEDs_controller_s1   (CPU_data_master_read_data_valid_red_LEDs_controller_s1),
      .CPU_data_master_requests_red_LEDs_controller_s1          (CPU_data_master_requests_red_LEDs_controller_s1),
      .CPU_data_master_write                                    (CPU_data_master_write),
      .CPU_data_master_writedata                                (CPU_data_master_writedata),
      .clk                                                      (clock_to_CPU),
      .d1_red_LEDs_controller_s1_end_xfer                       (d1_red_LEDs_controller_s1_end_xfer),
      .red_LEDs_controller_s1_address                           (red_LEDs_controller_s1_address),
      .red_LEDs_controller_s1_chipselect                        (red_LEDs_controller_s1_chipselect),
      .red_LEDs_controller_s1_readdata                          (red_LEDs_controller_s1_readdata),
      .red_LEDs_controller_s1_readdata_from_sa                  (red_LEDs_controller_s1_readdata_from_sa),
      .red_LEDs_controller_s1_reset_n                           (red_LEDs_controller_s1_reset_n),
      .red_LEDs_controller_s1_write_n                           (red_LEDs_controller_s1_write_n),
      .red_LEDs_controller_s1_writedata                         (red_LEDs_controller_s1_writedata),
      .reset_n                                                  (clock_to_CPU_reset_n)
    );

  red_LEDs_controller the_red_LEDs_controller
    (
      .address    (red_LEDs_controller_s1_address),
      .chipselect (red_LEDs_controller_s1_chipselect),
      .clk        (clock_to_CPU),
      .out_port   (out_port_from_the_red_LEDs_controller),
      .readdata   (red_LEDs_controller_s1_readdata),
      .reset_n    (red_LEDs_controller_s1_reset_n),
      .write_n    (red_LEDs_controller_s1_write_n),
      .writedata  (red_LEDs_controller_s1_writedata)
    );

  seven_segment_displays_controller_s1_arbitrator the_seven_segment_displays_controller_s1
    (
      .CPU_data_master_address_to_slave                                       (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_seven_segment_displays_controller_s1           (CPU_data_master_granted_seven_segment_displays_controller_s1),
      .CPU_data_master_latency_counter                                        (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_seven_segment_displays_controller_s1 (CPU_data_master_qualified_request_seven_segment_displays_controller_s1),
      .CPU_data_master_read                                                   (CPU_data_master_read),
      .CPU_data_master_read_data_valid_seven_segment_displays_controller_s1   (CPU_data_master_read_data_valid_seven_segment_displays_controller_s1),
      .CPU_data_master_requests_seven_segment_displays_controller_s1          (CPU_data_master_requests_seven_segment_displays_controller_s1),
      .CPU_data_master_write                                                  (CPU_data_master_write),
      .CPU_data_master_writedata                                              (CPU_data_master_writedata),
      .clk                                                                    (clock_to_CPU),
      .d1_seven_segment_displays_controller_s1_end_xfer                       (d1_seven_segment_displays_controller_s1_end_xfer),
      .reset_n                                                                (clock_to_CPU_reset_n),
      .seven_segment_displays_controller_s1_address                           (seven_segment_displays_controller_s1_address),
      .seven_segment_displays_controller_s1_read_n                            (seven_segment_displays_controller_s1_read_n),
      .seven_segment_displays_controller_s1_readdata                          (seven_segment_displays_controller_s1_readdata),
      .seven_segment_displays_controller_s1_readdata_from_sa                  (seven_segment_displays_controller_s1_readdata_from_sa),
      .seven_segment_displays_controller_s1_reset_n                           (seven_segment_displays_controller_s1_reset_n),
      .seven_segment_displays_controller_s1_write_n                           (seven_segment_displays_controller_s1_write_n),
      .seven_segment_displays_controller_s1_writedata                         (seven_segment_displays_controller_s1_writedata)
    );

  seven_segment_displays_controller the_seven_segment_displays_controller
    (
      .avs_s1_address         (seven_segment_displays_controller_s1_address),
      .avs_s1_read_n          (seven_segment_displays_controller_s1_read_n),
      .avs_s1_readdata        (seven_segment_displays_controller_s1_readdata),
      .avs_s1_write_n         (seven_segment_displays_controller_s1_write_n),
      .avs_s1_writedata       (seven_segment_displays_controller_s1_writedata),
      .coe_s2_export_oHEX0_D  (coe_s2_export_oHEX0_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX0_DP (coe_s2_export_oHEX0_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX1_D  (coe_s2_export_oHEX1_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX1_DP (coe_s2_export_oHEX1_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX2_D  (coe_s2_export_oHEX2_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX2_DP (coe_s2_export_oHEX2_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX3_D  (coe_s2_export_oHEX3_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX3_DP (coe_s2_export_oHEX3_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX4_D  (coe_s2_export_oHEX4_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX4_DP (coe_s2_export_oHEX4_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX5_D  (coe_s2_export_oHEX5_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX5_DP (coe_s2_export_oHEX5_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX6_D  (coe_s2_export_oHEX6_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX6_DP (coe_s2_export_oHEX6_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX7_D  (coe_s2_export_oHEX7_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX7_DP (coe_s2_export_oHEX7_DP_from_the_seven_segment_displays_controller),
      .csi_s0_clk             (clock_to_CPU),
      .csi_s0_reset_n         (seven_segment_displays_controller_s1_reset_n)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .CPU_data_master_address_to_slave                      (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_sysid_control_slave           (CPU_data_master_granted_sysid_control_slave),
      .CPU_data_master_latency_counter                       (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_sysid_control_slave (CPU_data_master_qualified_request_sysid_control_slave),
      .CPU_data_master_read                                  (CPU_data_master_read),
      .CPU_data_master_read_data_valid_sysid_control_slave   (CPU_data_master_read_data_valid_sysid_control_slave),
      .CPU_data_master_requests_sysid_control_slave          (CPU_data_master_requests_sysid_control_slave),
      .CPU_data_master_write                                 (CPU_data_master_write),
      .clk                                                   (clock_to_CPU),
      .d1_sysid_control_slave_end_xfer                       (d1_sysid_control_slave_end_xfer),
      .reset_n                                               (clock_to_CPU_reset_n),
      .sysid_control_slave_address                           (sysid_control_slave_address),
      .sysid_control_slave_readdata                          (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                  (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                           (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  system_clock_timer_s1_arbitrator the_system_clock_timer_s1
    (
      .CPU_data_master_address_to_slave                        (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_system_clock_timer_s1           (CPU_data_master_granted_system_clock_timer_s1),
      .CPU_data_master_latency_counter                         (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_system_clock_timer_s1 (CPU_data_master_qualified_request_system_clock_timer_s1),
      .CPU_data_master_read                                    (CPU_data_master_read),
      .CPU_data_master_read_data_valid_system_clock_timer_s1   (CPU_data_master_read_data_valid_system_clock_timer_s1),
      .CPU_data_master_requests_system_clock_timer_s1          (CPU_data_master_requests_system_clock_timer_s1),
      .CPU_data_master_write                                   (CPU_data_master_write),
      .CPU_data_master_writedata                               (CPU_data_master_writedata),
      .clk                                                     (clock_to_CPU),
      .d1_system_clock_timer_s1_end_xfer                       (d1_system_clock_timer_s1_end_xfer),
      .reset_n                                                 (clock_to_CPU_reset_n),
      .system_clock_timer_s1_address                           (system_clock_timer_s1_address),
      .system_clock_timer_s1_chipselect                        (system_clock_timer_s1_chipselect),
      .system_clock_timer_s1_irq                               (system_clock_timer_s1_irq),
      .system_clock_timer_s1_irq_from_sa                       (system_clock_timer_s1_irq_from_sa),
      .system_clock_timer_s1_readdata                          (system_clock_timer_s1_readdata),
      .system_clock_timer_s1_readdata_from_sa                  (system_clock_timer_s1_readdata_from_sa),
      .system_clock_timer_s1_reset_n                           (system_clock_timer_s1_reset_n),
      .system_clock_timer_s1_write_n                           (system_clock_timer_s1_write_n),
      .system_clock_timer_s1_writedata                         (system_clock_timer_s1_writedata)
    );

  system_clock_timer the_system_clock_timer
    (
      .address    (system_clock_timer_s1_address),
      .chipselect (system_clock_timer_s1_chipselect),
      .clk        (clock_to_CPU),
      .irq        (system_clock_timer_s1_irq),
      .readdata   (system_clock_timer_s1_readdata),
      .reset_n    (system_clock_timer_s1_reset_n),
      .write_n    (system_clock_timer_s1_write_n),
      .writedata  (system_clock_timer_s1_writedata)
    );

  timestamp_timer_s1_arbitrator the_timestamp_timer_s1
    (
      .CPU_data_master_address_to_slave                     (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_timestamp_timer_s1           (CPU_data_master_granted_timestamp_timer_s1),
      .CPU_data_master_latency_counter                      (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_timestamp_timer_s1 (CPU_data_master_qualified_request_timestamp_timer_s1),
      .CPU_data_master_read                                 (CPU_data_master_read),
      .CPU_data_master_read_data_valid_timestamp_timer_s1   (CPU_data_master_read_data_valid_timestamp_timer_s1),
      .CPU_data_master_requests_timestamp_timer_s1          (CPU_data_master_requests_timestamp_timer_s1),
      .CPU_data_master_write                                (CPU_data_master_write),
      .CPU_data_master_writedata                            (CPU_data_master_writedata),
      .clk                                                  (clock_to_CPU),
      .d1_timestamp_timer_s1_end_xfer                       (d1_timestamp_timer_s1_end_xfer),
      .reset_n                                              (clock_to_CPU_reset_n),
      .timestamp_timer_s1_address                           (timestamp_timer_s1_address),
      .timestamp_timer_s1_chipselect                        (timestamp_timer_s1_chipselect),
      .timestamp_timer_s1_irq                               (timestamp_timer_s1_irq),
      .timestamp_timer_s1_irq_from_sa                       (timestamp_timer_s1_irq_from_sa),
      .timestamp_timer_s1_readdata                          (timestamp_timer_s1_readdata),
      .timestamp_timer_s1_readdata_from_sa                  (timestamp_timer_s1_readdata_from_sa),
      .timestamp_timer_s1_reset_n                           (timestamp_timer_s1_reset_n),
      .timestamp_timer_s1_write_n                           (timestamp_timer_s1_write_n),
      .timestamp_timer_s1_writedata                         (timestamp_timer_s1_writedata)
    );

  timestamp_timer the_timestamp_timer
    (
      .address    (timestamp_timer_s1_address),
      .chipselect (timestamp_timer_s1_chipselect),
      .clk        (clock_to_CPU),
      .irq        (timestamp_timer_s1_irq),
      .readdata   (timestamp_timer_s1_readdata),
      .reset_n    (timestamp_timer_s1_reset_n),
      .write_n    (timestamp_timer_s1_write_n),
      .writedata  (timestamp_timer_s1_writedata)
    );

  toggle_switches_controller_s1_arbitrator the_toggle_switches_controller_s1
    (
      .CPU_data_master_address_to_slave                                (CPU_data_master_address_to_slave),
      .CPU_data_master_granted_toggle_switches_controller_s1           (CPU_data_master_granted_toggle_switches_controller_s1),
      .CPU_data_master_latency_counter                                 (CPU_data_master_latency_counter),
      .CPU_data_master_qualified_request_toggle_switches_controller_s1 (CPU_data_master_qualified_request_toggle_switches_controller_s1),
      .CPU_data_master_read                                            (CPU_data_master_read),
      .CPU_data_master_read_data_valid_toggle_switches_controller_s1   (CPU_data_master_read_data_valid_toggle_switches_controller_s1),
      .CPU_data_master_requests_toggle_switches_controller_s1          (CPU_data_master_requests_toggle_switches_controller_s1),
      .CPU_data_master_write                                           (CPU_data_master_write),
      .clk                                                             (clock_to_CPU),
      .d1_toggle_switches_controller_s1_end_xfer                       (d1_toggle_switches_controller_s1_end_xfer),
      .reset_n                                                         (clock_to_CPU_reset_n),
      .toggle_switches_controller_s1_address                           (toggle_switches_controller_s1_address),
      .toggle_switches_controller_s1_readdata                          (toggle_switches_controller_s1_readdata),
      .toggle_switches_controller_s1_readdata_from_sa                  (toggle_switches_controller_s1_readdata_from_sa),
      .toggle_switches_controller_s1_reset_n                           (toggle_switches_controller_s1_reset_n)
    );

  toggle_switches_controller the_toggle_switches_controller
    (
      .address  (toggle_switches_controller_s1_address),
      .clk      (clock_to_CPU),
      .in_port  (in_port_to_the_toggle_switches_controller),
      .readdata (toggle_switches_controller_s1_readdata),
      .reset_n  (toggle_switches_controller_s1_reset_n)
    );

  //reset is asserted asynchronously and deasserted synchronously
  Lab2_SOPC_reset_clock_to_CPU_domain_synch_module Lab2_SOPC_reset_clock_to_CPU_domain_synch
    (
      .clk      (clock_to_CPU),
      .data_in  (1'b1),
      .data_out (clock_to_CPU_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    CPU_jtag_debug_module_resetrequest_from_sa |
    CPU_jtag_debug_module_resetrequest_from_sa |
    0 |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  Lab2_SOPC_reset_clock_from_board_domain_synch_module Lab2_SOPC_reset_clock_from_board_domain_synch
    (
      .clk      (clock_from_board),
      .data_in  (1'b1),
      .data_out (clock_from_board_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  Lab2_SOPC_reset_clock_to_SDRAM_domain_synch_module Lab2_SOPC_reset_clock_to_SDRAM_domain_synch
    (
      .clk      (clock_to_SDRAM),
      .data_in  (1'b1),
      .data_out (clock_to_SDRAM_reset_n),
      .reset_n  (reset_n_sources)
    );

  //Lab2_SOPC_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Lab2_SOPC_clock_0_out_endofpacket = 0;

  //Lab2_SOPC_clock_1_in_writedata of type writedata does not connect to anything so wire it to default (0)
  assign Lab2_SOPC_clock_1_in_writedata = 0;

  //Lab2_SOPC_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Lab2_SOPC_clock_1_out_endofpacket = 0;

  //Lab2_SOPC_clock_2_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign Lab2_SOPC_clock_2_out_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Flash_controller_lane0_module (
                                       // inputs:
                                        data,
                                        rdaddress,
                                        rdclken,
                                        wraddress,
                                        wrclock,
                                        wren,

                                       // outputs:
                                        q
                                     )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 21: 0] rdaddress;
  input            rdclken;
  input   [ 21: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [4194303: 0];
  wire    [  7: 0] q;
  reg     [ 21: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("Flash_controller_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "Flash_controller_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 22,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Flash_controller_lane1_module (
                                       // inputs:
                                        data,
                                        rdaddress,
                                        rdclken,
                                        wraddress,
                                        wrclock,
                                        wren,

                                       // outputs:
                                        q
                                     )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 21: 0] rdaddress;
  input            rdclken;
  input   [ 21: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [4194303: 0];
  wire    [  7: 0] q;
  reg     [ 21: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("Flash_controller_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "Flash_controller_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 22,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module Flash_controller (
                          // inputs:
                           address,
                           read_n,
                           select_n,
                           write_n,

                          // outputs:
                           data
                        )
;

  inout   [ 15: 0] data;
  input   [ 21: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [ 15: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [ 15: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //Flash_controller_lane0, which is an e_ram
  Flash_controller_lane0_module Flash_controller_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //Flash_controller_lane1, which is an e_ram
  Flash_controller_lane1_module Flash_controller_lane1
    (
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? {q_1,
    q_0}: {16{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SSRAM_controller_lane0_module (
                                       // inputs:
                                        clk,
                                        data,
                                        rdaddress,
                                        rdclken,
                                        reset_n,
                                        wraddress,
                                        wrclock,
                                        wren,

                                       // outputs:
                                        q
                                     )
;

  output  [  7: 0] q;
  input            clk;
  input   [  7: 0] data;
  input   [ 18: 0] rdaddress;
  input            rdclken;
  input            reset_n;
  input   [ 18: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 18: 0] d1_rdaddress;
  reg     [  7: 0] mem_array [524287: 0];
  wire    [  7: 0] q;
  reg     [ 18: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_rdaddress <= 0;
          read_address <= 0;
        end
      else if (rdclken)
        begin
          d1_rdaddress <= rdaddress;
          read_address <= d1_rdaddress;
        end
    end


  // Data read is synchronized through latent_rdaddress.
  assign q = mem_array[read_address];

initial
    $readmemh("SSRAM_controller_lane0.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .rdclock (clk),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "SSRAM_controller_lane0.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "REGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "REGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 19,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SSRAM_controller_lane1_module (
                                       // inputs:
                                        clk,
                                        data,
                                        rdaddress,
                                        rdclken,
                                        reset_n,
                                        wraddress,
                                        wrclock,
                                        wren,

                                       // outputs:
                                        q
                                     )
;

  output  [  7: 0] q;
  input            clk;
  input   [  7: 0] data;
  input   [ 18: 0] rdaddress;
  input            rdclken;
  input            reset_n;
  input   [ 18: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 18: 0] d1_rdaddress;
  reg     [  7: 0] mem_array [524287: 0];
  wire    [  7: 0] q;
  reg     [ 18: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_rdaddress <= 0;
          read_address <= 0;
        end
      else if (rdclken)
        begin
          d1_rdaddress <= rdaddress;
          read_address <= d1_rdaddress;
        end
    end


  // Data read is synchronized through latent_rdaddress.
  assign q = mem_array[read_address];

initial
    $readmemh("SSRAM_controller_lane1.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .rdclock (clk),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "SSRAM_controller_lane1.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "REGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "REGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 19,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SSRAM_controller_lane2_module (
                                       // inputs:
                                        clk,
                                        data,
                                        rdaddress,
                                        rdclken,
                                        reset_n,
                                        wraddress,
                                        wrclock,
                                        wren,

                                       // outputs:
                                        q
                                     )
;

  output  [  7: 0] q;
  input            clk;
  input   [  7: 0] data;
  input   [ 18: 0] rdaddress;
  input            rdclken;
  input            reset_n;
  input   [ 18: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 18: 0] d1_rdaddress;
  reg     [  7: 0] mem_array [524287: 0];
  wire    [  7: 0] q;
  reg     [ 18: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_rdaddress <= 0;
          read_address <= 0;
        end
      else if (rdclken)
        begin
          d1_rdaddress <= rdaddress;
          read_address <= d1_rdaddress;
        end
    end


  // Data read is synchronized through latent_rdaddress.
  assign q = mem_array[read_address];

initial
    $readmemh("SSRAM_controller_lane2.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .rdclock (clk),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "SSRAM_controller_lane2.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "REGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "REGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 19,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SSRAM_controller_lane3_module (
                                       // inputs:
                                        clk,
                                        data,
                                        rdaddress,
                                        rdclken,
                                        reset_n,
                                        wraddress,
                                        wrclock,
                                        wren,

                                       // outputs:
                                        q
                                     )
;

  output  [  7: 0] q;
  input            clk;
  input   [  7: 0] data;
  input   [ 18: 0] rdaddress;
  input            rdclken;
  input            reset_n;
  input   [ 18: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [ 18: 0] d1_rdaddress;
  reg     [  7: 0] mem_array [524287: 0];
  wire    [  7: 0] q;
  reg     [ 18: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_rdaddress <= 0;
          read_address <= 0;
        end
      else if (rdclken)
        begin
          d1_rdaddress <= rdaddress;
          read_address <= d1_rdaddress;
        end
    end


  // Data read is synchronized through latent_rdaddress.
  assign q = mem_array[read_address];

initial
    $readmemh("SSRAM_controller_lane3.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .rdclock (clk),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "SSRAM_controller_lane3.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "REGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "REGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 19,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module SSRAM_controller (
                          // inputs:
                           address,
                           adsc_n,
                           bw_n,
                           bwe_n,
                           chipenable1_n,
                           clk,
                           outputenable_n,
                           reset_n,

                          // outputs:
                           data
                        )
;

  inout   [ 31: 0] data;
  input   [ 18: 0] address;
  input            adsc_n;
  input   [  3: 0] bw_n;
  input            bwe_n;
  input            chipenable1_n;
  input            clk;
  input            outputenable_n;
  input            reset_n;

  wire    [ 31: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] data_1;
  wire    [  7: 0] data_2;
  wire    [  7: 0] data_3;
  wire    [ 31: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  wire    [  7: 0] q_1;
  wire    [  7: 0] q_2;
  wire    [  7: 0] q_3;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //SSRAM_controller_lane0, which is an e_ram
  SSRAM_controller_lane0_module SSRAM_controller_lane0
    (
      .clk       (clk),
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .reset_n   (reset_n),
      .wraddress (address),
      .wrclock   (clk),
      .wren      (~chipenable1_n & ~bwe_n & ~bw_n[0])
    );

  assign data_1 = logic_vector_gasket[15 : 8];
  //SSRAM_controller_lane1, which is an e_ram
  SSRAM_controller_lane1_module SSRAM_controller_lane1
    (
      .clk       (clk),
      .data      (data_1),
      .q         (q_1),
      .rdaddress (address),
      .rdclken   (1'b1),
      .reset_n   (reset_n),
      .wraddress (address),
      .wrclock   (clk),
      .wren      (~chipenable1_n & ~bwe_n & ~bw_n[1])
    );

  assign data_2 = logic_vector_gasket[23 : 16];
  //SSRAM_controller_lane2, which is an e_ram
  SSRAM_controller_lane2_module SSRAM_controller_lane2
    (
      .clk       (clk),
      .data      (data_2),
      .q         (q_2),
      .rdaddress (address),
      .rdclken   (1'b1),
      .reset_n   (reset_n),
      .wraddress (address),
      .wrclock   (clk),
      .wren      (~chipenable1_n & ~bwe_n & ~bw_n[2])
    );

  assign data_3 = logic_vector_gasket[31 : 24];
  //SSRAM_controller_lane3, which is an e_ram
  SSRAM_controller_lane3_module SSRAM_controller_lane3
    (
      .clk       (clk),
      .data      (data_3),
      .q         (q_3),
      .rdaddress (address),
      .rdclken   (1'b1),
      .reset_n   (reset_n),
      .wraddress (address),
      .wrclock   (clk),
      .wren      (~chipenable1_n & ~bwe_n & ~bw_n[3])
    );

  assign data = (~chipenable1_n & ~outputenable_n)? {q_3,
    q_2,
    q_1,
    q_0}: {32{1'bz}};


//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/10.1/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/220model.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/sgate.v"
`include "PLL.vo"
`include "seg7.v"
`include "seven_segment_displays_controller.v"
`include "sysid.v"
`include "push_button_switches_controller.v"
`include "Lab2_SOPC_clock_0.v"
`include "toggle_switches_controller.v"
`include "green_LEDs_controller.v"
`include "system_clock_timer.v"
`include "on_chip_memory.v"
`include "LCD_controller.v"
`include "Lab2_SOPC_clock_2.v"
`include "CPU_test_bench.v"
`include "CPU_mult_cell.v"
`include "CPU_oci_test_bench.v"
`include "CPU_jtag_debug_module_tck.v"
`include "CPU_jtag_debug_module_sysclk.v"
`include "CPU_jtag_debug_module_wrapper.v"
`include "CPU.v"
`include "red_LEDs_controller.v"
`include "timestamp_timer.v"
`include "JTAG_controller.v"
`include "Lab2_SOPC_clock_1.v"
`include "SDRAM_controller.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             JTAG_controller_avalon_jtag_slave_dataavailable_from_sa;
  wire             JTAG_controller_avalon_jtag_slave_readyfordata_from_sa;
  wire             LCD_E_from_the_LCD_controller;
  wire             LCD_RS_from_the_LCD_controller;
  wire             LCD_RW_from_the_LCD_controller;
  wire    [  7: 0] LCD_data_to_and_from_the_LCD_controller;
  wire             Lab2_SOPC_clock_0_in_endofpacket_from_sa;
  wire             Lab2_SOPC_clock_0_out_endofpacket;
  wire    [  1: 0] Lab2_SOPC_clock_0_out_nativeaddress;
  wire             Lab2_SOPC_clock_1_in_endofpacket_from_sa;
  wire    [ 31: 0] Lab2_SOPC_clock_1_in_writedata;
  wire             Lab2_SOPC_clock_1_out_endofpacket;
  wire    [ 23: 0] Lab2_SOPC_clock_1_out_nativeaddress;
  wire             Lab2_SOPC_clock_2_in_endofpacket_from_sa;
  wire             Lab2_SOPC_clock_2_out_endofpacket;
  wire    [ 23: 0] Lab2_SOPC_clock_2_out_nativeaddress;
  wire    [ 22: 0] address_to_the_Flash_controller;
  wire    [ 20: 0] address_to_the_SSRAM_controller;
  wire             adsc_n_to_the_SSRAM_controller;
  wire    [  3: 0] bw_n_to_the_SSRAM_controller;
  wire             bwe_n_to_the_SSRAM_controller;
  wire             chipenable1_n_to_the_SSRAM_controller;
  wire             clk;
  reg              clock_from_board;
  wire             clock_to_CPU;
  wire             clock_to_SDRAM;
  wire             coe_s2_export_oHEX0_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX0_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX1_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX1_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX2_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX2_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX3_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX3_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX4_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX4_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX5_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX5_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX6_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX6_D_from_the_seven_segment_displays_controller;
  wire             coe_s2_export_oHEX7_DP_from_the_seven_segment_displays_controller;
  wire    [  6: 0] coe_s2_export_oHEX7_D_from_the_seven_segment_displays_controller;
  wire    [ 15: 0] data_to_and_from_the_Flash_controller;
  wire    [ 31: 0] data_to_and_from_the_SSRAM_controller;
  wire    [  3: 0] in_port_to_the_push_button_switches_controller;
  wire    [ 17: 0] in_port_to_the_toggle_switches_controller;
  wire             locked_from_the_PLL;
  wire    [  7: 0] out_port_from_the_green_LEDs_controller;
  wire    [ 17: 0] out_port_from_the_red_LEDs_controller;
  wire             outputenable_n_to_the_SSRAM_controller;
  wire             phasedone_from_the_PLL;
  wire             read_n_to_the_Flash_controller;
  reg              reset_n;
  wire             reset_n_to_the_SSRAM_controller;
  wire             select_n_to_the_Flash_controller;
  wire             sysid_control_slave_clock;
  wire             write_n_to_the_Flash_controller;
  wire    [ 12: 0] zs_addr_from_the_SDRAM_controller;
  wire    [  1: 0] zs_ba_from_the_SDRAM_controller;
  wire             zs_cas_n_from_the_SDRAM_controller;
  wire             zs_cke_from_the_SDRAM_controller;
  wire             zs_cs_n_from_the_SDRAM_controller;
  wire    [ 31: 0] zs_dq_to_and_from_the_SDRAM_controller;
  wire    [  3: 0] zs_dqm_from_the_SDRAM_controller;
  wire             zs_ras_n_from_the_SDRAM_controller;
  wire             zs_we_n_from_the_SDRAM_controller;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  Lab2_SOPC DUT
    (
      .LCD_E_from_the_LCD_controller                                     (LCD_E_from_the_LCD_controller),
      .LCD_RS_from_the_LCD_controller                                    (LCD_RS_from_the_LCD_controller),
      .LCD_RW_from_the_LCD_controller                                    (LCD_RW_from_the_LCD_controller),
      .LCD_data_to_and_from_the_LCD_controller                           (LCD_data_to_and_from_the_LCD_controller),
      .address_to_the_Flash_controller                                   (address_to_the_Flash_controller),
      .address_to_the_SSRAM_controller                                   (address_to_the_SSRAM_controller),
      .adsc_n_to_the_SSRAM_controller                                    (adsc_n_to_the_SSRAM_controller),
      .bw_n_to_the_SSRAM_controller                                      (bw_n_to_the_SSRAM_controller),
      .bwe_n_to_the_SSRAM_controller                                     (bwe_n_to_the_SSRAM_controller),
      .chipenable1_n_to_the_SSRAM_controller                             (chipenable1_n_to_the_SSRAM_controller),
      .clock_from_board                                                  (clock_from_board),
      .clock_to_CPU                                                      (clock_to_CPU),
      .clock_to_SDRAM                                                    (clock_to_SDRAM),
      .coe_s2_export_oHEX0_DP_from_the_seven_segment_displays_controller (coe_s2_export_oHEX0_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX0_D_from_the_seven_segment_displays_controller  (coe_s2_export_oHEX0_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX1_DP_from_the_seven_segment_displays_controller (coe_s2_export_oHEX1_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX1_D_from_the_seven_segment_displays_controller  (coe_s2_export_oHEX1_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX2_DP_from_the_seven_segment_displays_controller (coe_s2_export_oHEX2_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX2_D_from_the_seven_segment_displays_controller  (coe_s2_export_oHEX2_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX3_DP_from_the_seven_segment_displays_controller (coe_s2_export_oHEX3_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX3_D_from_the_seven_segment_displays_controller  (coe_s2_export_oHEX3_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX4_DP_from_the_seven_segment_displays_controller (coe_s2_export_oHEX4_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX4_D_from_the_seven_segment_displays_controller  (coe_s2_export_oHEX4_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX5_DP_from_the_seven_segment_displays_controller (coe_s2_export_oHEX5_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX5_D_from_the_seven_segment_displays_controller  (coe_s2_export_oHEX5_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX6_DP_from_the_seven_segment_displays_controller (coe_s2_export_oHEX6_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX6_D_from_the_seven_segment_displays_controller  (coe_s2_export_oHEX6_D_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX7_DP_from_the_seven_segment_displays_controller (coe_s2_export_oHEX7_DP_from_the_seven_segment_displays_controller),
      .coe_s2_export_oHEX7_D_from_the_seven_segment_displays_controller  (coe_s2_export_oHEX7_D_from_the_seven_segment_displays_controller),
      .data_to_and_from_the_Flash_controller                             (data_to_and_from_the_Flash_controller),
      .data_to_and_from_the_SSRAM_controller                             (data_to_and_from_the_SSRAM_controller),
      .in_port_to_the_push_button_switches_controller                    (in_port_to_the_push_button_switches_controller),
      .in_port_to_the_toggle_switches_controller                         (in_port_to_the_toggle_switches_controller),
      .locked_from_the_PLL                                               (locked_from_the_PLL),
      .out_port_from_the_green_LEDs_controller                           (out_port_from_the_green_LEDs_controller),
      .out_port_from_the_red_LEDs_controller                             (out_port_from_the_red_LEDs_controller),
      .outputenable_n_to_the_SSRAM_controller                            (outputenable_n_to_the_SSRAM_controller),
      .phasedone_from_the_PLL                                            (phasedone_from_the_PLL),
      .read_n_to_the_Flash_controller                                    (read_n_to_the_Flash_controller),
      .reset_n                                                           (reset_n),
      .reset_n_to_the_SSRAM_controller                                   (reset_n_to_the_SSRAM_controller),
      .select_n_to_the_Flash_controller                                  (select_n_to_the_Flash_controller),
      .write_n_to_the_Flash_controller                                   (write_n_to_the_Flash_controller),
      .zs_addr_from_the_SDRAM_controller                                 (zs_addr_from_the_SDRAM_controller),
      .zs_ba_from_the_SDRAM_controller                                   (zs_ba_from_the_SDRAM_controller),
      .zs_cas_n_from_the_SDRAM_controller                                (zs_cas_n_from_the_SDRAM_controller),
      .zs_cke_from_the_SDRAM_controller                                  (zs_cke_from_the_SDRAM_controller),
      .zs_cs_n_from_the_SDRAM_controller                                 (zs_cs_n_from_the_SDRAM_controller),
      .zs_dq_to_and_from_the_SDRAM_controller                            (zs_dq_to_and_from_the_SDRAM_controller),
      .zs_dqm_from_the_SDRAM_controller                                  (zs_dqm_from_the_SDRAM_controller),
      .zs_ras_n_from_the_SDRAM_controller                                (zs_ras_n_from_the_SDRAM_controller),
      .zs_we_n_from_the_SDRAM_controller                                 (zs_we_n_from_the_SDRAM_controller)
    );

  Flash_controller the_Flash_controller
    (
      .address  (address_to_the_Flash_controller[22 : 1]),
      .data     (data_to_and_from_the_Flash_controller),
      .read_n   (read_n_to_the_Flash_controller),
      .select_n (select_n_to_the_Flash_controller),
      .write_n  (write_n_to_the_Flash_controller)
    );

  SSRAM_controller the_SSRAM_controller
    (
      .address        (address_to_the_SSRAM_controller[20 : 2]),
      .adsc_n         (adsc_n_to_the_SSRAM_controller),
      .bw_n           (bw_n_to_the_SSRAM_controller),
      .bwe_n          (bwe_n_to_the_SSRAM_controller),
      .chipenable1_n  (chipenable1_n_to_the_SSRAM_controller),
      .clk            (clock_to_CPU),
      .data           (data_to_and_from_the_SSRAM_controller),
      .outputenable_n (outputenable_n_to_the_SSRAM_controller),
      .reset_n        (reset_n_to_the_SSRAM_controller)
    );

  initial
    clock_from_board = 1'b0;
  always
    #10 clock_from_board <= ~clock_from_board;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on