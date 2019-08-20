// seven_segment_displays_controller.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module seven_segment_displays_controller (
		input  wire       csi_s0_clk,             // s0.clk
		input  wire       csi_s0_reset_n,         //   .reset_n
		input  wire       avs_s1_write_n,         // s1.write_n
		input  wire       avs_s1_read_n,          //   .read_n
		input  wire [2:0] avs_s1_address,         //   .address
		input  wire [3:0] avs_s1_writedata,       //   .writedata
		output wire [3:0] avs_s1_readdata,        //   .readdata
		output wire [6:0] coe_s2_export_oHEX0_D,  // s2.export
		output wire [6:0] coe_s2_export_oHEX1_D,  //   .export
		output wire [6:0] coe_s2_export_oHEX2_D,  //   .export
		output wire [6:0] coe_s2_export_oHEX3_D,  //   .export
		output wire [6:0] coe_s2_export_oHEX4_D,  //   .export
		output wire [6:0] coe_s2_export_oHEX5_D,  //   .export
		output wire [6:0] coe_s2_export_oHEX6_D,  //   .export
		output wire [6:0] coe_s2_export_oHEX7_D,  //   .export
		output wire       coe_s2_export_oHEX7_DP, //   .export
		output wire       coe_s2_export_oHEX0_DP, //   .export
		output wire       coe_s2_export_oHEX1_DP, //   .export
		output wire       coe_s2_export_oHEX2_DP, //   .export
		output wire       coe_s2_export_oHEX3_DP, //   .export
		output wire       coe_s2_export_oHEX4_DP, //   .export
		output wire       coe_s2_export_oHEX5_DP, //   .export
		output wire       coe_s2_export_oHEX6_DP  //   .export
	);

	seg7 seven_segment_displays_controller (
		.csi_s0_clk             (csi_s0_clk),             // s0.clk
		.csi_s0_reset_n         (csi_s0_reset_n),         //   .reset_n
		.avs_s1_write_n         (avs_s1_write_n),         // s1.write_n
		.avs_s1_read_n          (avs_s1_read_n),          //   .read_n
		.avs_s1_address         (avs_s1_address),         //   .address
		.avs_s1_writedata       (avs_s1_writedata),       //   .writedata
		.avs_s1_readdata        (avs_s1_readdata),        //   .readdata
		.coe_s2_export_oHEX0_D  (coe_s2_export_oHEX0_D),  // s2.export
		.coe_s2_export_oHEX1_D  (coe_s2_export_oHEX1_D),  //   .export
		.coe_s2_export_oHEX2_D  (coe_s2_export_oHEX2_D),  //   .export
		.coe_s2_export_oHEX3_D  (coe_s2_export_oHEX3_D),  //   .export
		.coe_s2_export_oHEX4_D  (coe_s2_export_oHEX4_D),  //   .export
		.coe_s2_export_oHEX5_D  (coe_s2_export_oHEX5_D),  //   .export
		.coe_s2_export_oHEX6_D  (coe_s2_export_oHEX6_D),  //   .export
		.coe_s2_export_oHEX7_D  (coe_s2_export_oHEX7_D),  //   .export
		.coe_s2_export_oHEX7_DP (coe_s2_export_oHEX7_DP), //   .export
		.coe_s2_export_oHEX0_DP (coe_s2_export_oHEX0_DP), //   .export
		.coe_s2_export_oHEX1_DP (coe_s2_export_oHEX1_DP), //   .export
		.coe_s2_export_oHEX2_DP (coe_s2_export_oHEX2_DP), //   .export
		.coe_s2_export_oHEX3_DP (coe_s2_export_oHEX3_DP), //   .export
		.coe_s2_export_oHEX4_DP (coe_s2_export_oHEX4_DP), //   .export
		.coe_s2_export_oHEX5_DP (coe_s2_export_oHEX5_DP), //   .export
		.coe_s2_export_oHEX6_DP (coe_s2_export_oHEX6_DP)  //   .export
	);

endmodule
