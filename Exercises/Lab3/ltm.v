module ltm (

	// Define "s0" as "Clock Input"
	input csi_s0_clk,
	input csi_s0_reset_n,
	
	// Define "s1" as "Avalon Memory Mapped Slave"
	input avs_s1_write_n,
	input avs_s1_read_n,
	input [1:0] avs_s1_writedata,
	output reg [1:0] avs_s1_readdata,

	// Define "s2" as "Conduit"
	output coe_s2_export_NCLK,
	output coe_s2_export_GRST,
	output coe_s2_export_HD,
	output coe_s2_export_VD,
	output coe_s2_export_DEN,
	output [7:0] coe_s2_export_R,
	output [7:0] coe_s2_export_G,
	output [7:0] coe_s2_export_B
);

	// Implement only one interface register
	always @ (posedge csi_s0_clk or negedge csi_s0_reset_n) begin
		if (~csi_s0_reset_n) begin
			avs_s1_readdata <= 0;
		end else if (~avs_s1_write_n) begin
			avs_s1_readdata <= avs_s1_writedata;
		end else begin
			avs_s1_readdata <= avs_s1_readdata;
		end
	end

	// Get the current (x, y) point from timing controller
	wire [31:0] x;
	wire [31:0] y;
	timing_controller u0(
		.HD(coe_s2_export_HD),
		.VD(coe_s2_export_VD),
		.DEN(coe_s2_export_DEN),
		.NCLK(coe_s2_export_NCLK),
		.GRST(coe_s2_export_GRST),
		.x(x),
		.y(y),
		.clock(csi_s0_clk),
		.reset(csi_s0_reset_n)
	);
	
	// Use the current (x, y) point to generate (r, g, b) for LTM
	pattern_generator u1(
		.R(coe_s2_export_R),
		.G(coe_s2_export_G),
		.B(coe_s2_export_B),
		.x(x),
		.y(y),
		.symbol(avs_s1_readdata)
	);

endmodule

module timing_controller (

	// Define output signals to LTM
	output HD,
	output VD,
	output DEN,
	output NCLK,
	output reg GRST,

	// Define output signals to pattern generator
	output [31:0] x,
	output [31:0] y,

	// Define input signals from LTM controller
	input clock,
	input reset

);

	// Generate 25 MHz clock signal for LTM
	reg [2:0] counter1;
	assign NCLK = ~counter1[2];
	always @ (posedge clock or negedge reset) begin
		if (~reset) begin
			counter1 <= 0;
		end else begin
			counter1 <= counter1 + 1;
		end
	end

	// Generate delayed reset signal for LTM
	reg [23:0] counter2;
	always @ (posedge clock or negedge reset) begin
		if (~reset) begin
			GRST <= 0;
			counter2 <= 0;
		end else if (counter2 != 24'hFFFFFF) begin
			GRST <= 0;
			counter2 <= counter2 + 1;
		end else begin
			GRST <= 1;
			counter2 <= counter2;
		end
	end

	// Generate timing signal using LTM's clock and reset
	reg [31:0] i;
	reg [31:0] j;
	assign x = i - 216;
	assign y = j - 35;
	assign HD = i != 0;
	assign VD = j != 0;
	assign DEN = i >= 216 & i < 1016 & j >= 35 & j < 515;
	always @ (negedge NCLK or negedge GRST) begin
		if (~GRST) begin
			i <= 0;
			j <= 0;
		end else if (i < 1055) begin
			i <= i + 1;
			j <= j;
		end else if (j < 524) begin
			i <= 0;
			j <= j + 1;	
		end else begin
			i <= 0;
			j <= 0;
		end
	end

endmodule


module pattern_generator (

	// Define output signals to LTM
	output [7:0] R,
	output [7:0] G,
	output [7:0] B,

	// Define input signals from timing controller
	input [31:0] x,
	input [31:0] y,

	// Define input signals from LTM controller
	input [1:0] symbol

);

	// Define six rectangles regions
	wire horizontal0, horizontal1, horizontal2, vertical0, vertical1, vertical2;
	assign horizontal0 = x >= 200 & x < 600 & y >= 40 & y < 120;
	assign horizontal1 = x >= 200 & x < 600 & y >= 200 & y < 280; 
	assign horizontal2 = x >= 200 & x < 600 & y >= 360 & y < 440;
	assign vertical0 = x >= 200 & x < 280 & y >= 40 & y < 440;
	assign vertical1 = x >= 360 & x < 440 & y >= 40 & y < 440;
	assign vertical2 = x >= 520 & x < 600 & y >= 40 & y < 440;

	// Combine the appropriate regions into four symbols
	wire symbol0, symbol1, symbol2, symbol3;
	assign symbol0 = horizontal2 | vertical0 | vertical1 | vertical2;
	assign symbol1 = horizontal0 | vertical0 | vertical1 | vertical2;
	assign symbol2 = horizontal0 | horizontal1 | horizontal2 | vertical2;
	assign symbol3 = horizontal0 | horizontal1 | horizontal2 | vertical0;

	// Check if the (x, y) point is covered by the selected symbol
	wire covered;
	assign covered = symbol == 0 ? symbol0 : symbol == 1 ? symbol1 : symbol == 2 ? symbol2 : symbol3;

	// Output the appropriate (r, g, b) color
	assign R = covered ? 0 : 255;
	assign G = covered ? 0 : 255;
	assign B = covered ? 0 : 255;

endmodule
