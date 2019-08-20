// LTM_controller.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module LTM_controller (
		input  wire       csi_s0_clk,         //       s0.clk
		input  wire       csi_s0_reset_n,     // s0_reset.reset_n
		input  wire       avs_s1_write_n,     //       s1.write_n
		input  wire       avs_s1_read_n,      //         .read_n
		input  wire [1:0] avs_s1_writedata,   //         .writedata
		output wire [1:0] avs_s1_readdata,    //         .readdata
		output wire       coe_s2_export_NCLK, //       s2.export
		output wire       coe_s2_export_GRST, //         .export
		output wire       coe_s2_export_HD,   //         .export
		output wire       coe_s2_export_VD,   //         .export
		output wire       coe_s2_export_DEN,  //         .export
		output wire [7:0] coe_s2_export_R,    //         .export
		output wire [7:0] coe_s2_export_G,    //         .export
		output wire [7:0] coe_s2_export_B     //         .export
	);

	ltm ltm_controller (
		.csi_s0_clk         (csi_s0_clk),         //       s0.clk
		.csi_s0_reset_n     (csi_s0_reset_n),     // s0_reset.reset_n
		.avs_s1_write_n     (avs_s1_write_n),     //       s1.write_n
		.avs_s1_read_n      (avs_s1_read_n),      //         .read_n
		.avs_s1_writedata   (avs_s1_writedata),   //         .writedata
		.avs_s1_readdata    (avs_s1_readdata),    //         .readdata
		.coe_s2_export_NCLK (coe_s2_export_NCLK), //       s2.export
		.coe_s2_export_GRST (coe_s2_export_GRST), //         .export
		.coe_s2_export_HD   (coe_s2_export_HD),   //         .export
		.coe_s2_export_VD   (coe_s2_export_VD),   //         .export
		.coe_s2_export_DEN  (coe_s2_export_DEN),  //         .export
		.coe_s2_export_R    (coe_s2_export_R),    //         .export
		.coe_s2_export_G    (coe_s2_export_G),    //         .export
		.coe_s2_export_B    (coe_s2_export_B)     //         .export
	);

endmodule
