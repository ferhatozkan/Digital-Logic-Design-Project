module adder_20
(
	input [19:0] dataa,
	input [19:0] datab,
	output reg [19:0] result
);

	always @*
	begin
		result <= dataa + datab;
	end

endmodule
