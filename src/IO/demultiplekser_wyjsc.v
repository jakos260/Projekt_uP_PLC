module demultiplekser_wyjsc(
input [7:0] in,
input [2:0] sel,
input zapis,
output reg [7:0] out0,
output reg [7:0] out1,
output reg [7:0] out2,
output reg [7:0] out3,
output reg [7:0] out4,
output reg [7:0] out5,
output reg [7:0] out6,
output reg [7:0] out7
);

always @(zapis)
begin
	case(sel)
		1'h0:
		begin
			out0 <= in;
		end
		1'h1:
		begin
			out1 <= in;
		end
		1'h2:
		begin
			out2 <= in;
		end
		1'h3:
		begin
			out3 <= in;
		end
		1'h4:
		begin
			out4 <= in;
		end
		1'h5:
		begin
			out5 <= in;
		end
		1'h6:
		begin
			out6 <= in;
		end
		1'h7:
		begin
			out7 <= in;
		end
		default:
		begin
			out0 <= in;
		end
	endcase
end

endmodule