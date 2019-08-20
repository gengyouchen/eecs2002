module seg7 (

	// Define "s0" as "Clock Input"
	input csi_s0_clk,
	input csi_s0_reset_n,

	// Define "s1" as "Avalon Memory Mapped Slave"
	input avs_s1_write_n,
	input avs_s1_read_n,
	input [2:0] avs_s1_address,
	input [3:0] avs_s1_writedata,
	output reg [3:0] avs_s1_readdata,

	// Define "s2" as "Conduit"
	output [6:0] coe_s2_export_oHEX0_D,
	output [6:0] coe_s2_export_oHEX1_D,
	output [6:0] coe_s2_export_oHEX2_D,
	output [6:0] coe_s2_export_oHEX3_D,
	output [6:0] coe_s2_export_oHEX4_D,
	output [6:0] coe_s2_export_oHEX5_D,
	output [6:0] coe_s2_export_oHEX6_D,
	output [6:0] coe_s2_export_oHEX7_D,
	output coe_s2_export_oHEX7_DP,
	output coe_s2_export_oHEX0_DP,
	output coe_s2_export_oHEX1_DP,
	output coe_s2_export_oHEX2_DP,
	output coe_s2_export_oHEX3_DP,
	output coe_s2_export_oHEX4_DP,
	output coe_s2_export_oHEX5_DP,
	output coe_s2_export_oHEX6_DP
);

	// Create interface registers
	reg [3:0] num0;
	reg [3:0] num1;
	reg [3:0] num2;
	reg [3:0] num3;
	reg [3:0] num4;
	reg [3:0] num5;
	reg [3:0] num6;
	reg [3:0] num7;

	// Read or write interface registers according to Avalon-MM interface
	always @ (posedge csi_s0_clk or negedge csi_s0_reset_n) begin
		if (csi_s0_reset_n == 1'b0) begin
			num0 <= 4'b0000;
			num1 <= 4'b0000;
			num2 <= 4'b0000;
			num3 <= 4'b0000;
			num4 <= 4'b0000;
			num5 <= 4'b0000;
			num6 <= 4'b0000;
			num7 <= 4'b0000;
		end else if (avs_s1_read_n == 1'b0) begin
			case (avs_s1_address)
				3'b000: avs_s1_readdata <= num0;
				3'b001: avs_s1_readdata <= num1;
				3'b010: avs_s1_readdata <= num2;
				3'b011: avs_s1_readdata <= num3;
				3'b100: avs_s1_readdata <= num4;
				3'b101: avs_s1_readdata <= num5;
				3'b110: avs_s1_readdata <= num6;
				3'b111: avs_s1_readdata <= num7;
			endcase
		end else if (avs_s1_write_n == 1'b0) begin
			case (avs_s1_address)
				3'b000: num0 <= avs_s1_writedata;
				3'b001: num1 <= avs_s1_writedata;
				3'b010: num2 <= avs_s1_writedata;
				3'b011: num3 <= avs_s1_writedata;
				3'b100: num4 <= avs_s1_writedata;
				3'b101: num5 <= avs_s1_writedata;
				3'b110: num6 <= avs_s1_writedata;
				3'b111: num7 <= avs_s1_writedata;
			endcase
		end
	end

	// Convert binary codes to seven segment codes
	binary_to_seven_segment_converter u0(.seven_segment(coe_s2_export_oHEX0_D), .binary(num0));
	binary_to_seven_segment_converter u1(.seven_segment(coe_s2_export_oHEX1_D), .binary(num1));
	binary_to_seven_segment_converter u2(.seven_segment(coe_s2_export_oHEX2_D), .binary(num2));
	binary_to_seven_segment_converter u3(.seven_segment(coe_s2_export_oHEX3_D), .binary(num3));
	binary_to_seven_segment_converter u4(.seven_segment(coe_s2_export_oHEX4_D), .binary(num4));
	binary_to_seven_segment_converter u5(.seven_segment(coe_s2_export_oHEX5_D), .binary(num5));
	binary_to_seven_segment_converter u6(.seven_segment(coe_s2_export_oHEX6_D), .binary(num6));
	binary_to_seven_segment_converter u7(.seven_segment(coe_s2_export_oHEX7_D), .binary(num7));

	// Turn off all decimal point
	assign coe_s2_export_oHEX0_DP = 1'b1;
	assign coe_s2_export_oHEX1_DP = 1'b1;
	assign coe_s2_export_oHEX2_DP = 1'b1;
	assign coe_s2_export_oHEX3_DP = 1'b1;
	assign coe_s2_export_oHEX4_DP = 1'b1;
	assign coe_s2_export_oHEX5_DP = 1'b1;
	assign coe_s2_export_oHEX6_DP = 1'b1;
	assign coe_s2_export_oHEX7_DP = 1'b1;
endmodule

module binary_to_seven_segment_converter (
	output reg [6:0] seven_segment,
	input [3:0] binary
);
	always @ (binary) begin
		case (binary)
			4'b0000: seven_segment <= 7'b1000000;
			4'b0001: seven_segment <= 7'b1111001;
			4'b0010: seven_segment <= 7'b0100100;
			4'b0011: seven_segment <= 7'b0110000;
			4'b0100: seven_segment <= 7'b0011001;
			4'b0101: seven_segment <= 7'b0010010;
			4'b0110: seven_segment <= 7'b0000010;
			4'b0111: seven_segment <= 7'b1111000;
			4'b1000: seven_segment <= 7'b0000000;
			4'b1001: seven_segment <= 7'b0010000;
			4'b1010: seven_segment <= 7'b0001000;
			4'b1011: seven_segment <= 7'b0000011;
			4'b1100: seven_segment <= 7'b1000110;
			4'b1101: seven_segment <= 7'b0100001;
			4'b1110: seven_segment <= 7'b0000110;
			default: seven_segment <= 7'b0001110;
		endcase
	end
endmodule
