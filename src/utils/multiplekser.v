module multiplekser(
input [7:0] in0,
input [7:0] in1,
input sel,
output reg [7:0] out
);

always @(*) 
begin
	case(sel)
		1'b0: out <= in0;
		1'b1: out <= in1;
	endcase
end

endmodule