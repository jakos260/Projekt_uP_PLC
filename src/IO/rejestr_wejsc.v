module rejestr_wejsc(
input [7:0] in0,
input [7:0] in1,
input [7:0] in2,
input [7:0] in3,
input [7:0] in4,
input [7:0] in5,
input [7:0] in6,
input [7:0] in7,
input clk,
input ce,
output reg [7:0] out0,
output reg [7:0] out1,
output reg [7:0] out2,
output reg [7:0] out3,
output reg [7:0] out4,
output reg [7:0] out5,
output reg [7:0] out6,
output reg [7:0] out7
);

always @(negedge clk)
begin
	if(ce)
	begin
		out0 <= in0;
		out1 <= in1;
		out2 <= in2;
		out3 <= in3;
		out4 <= in4;
		out5 <= in5;
		out6 <= in6;
		out7 <= in7;
	end
	else
	begin
		out0 <= out0;
		out1 <= out1;
		out2 <= out2;
		out3 <= out3;
		out4 <= out4;
		out5 <= out5;
		out6 <= out6;
		out7 <= out7;
	end
end

endmodule