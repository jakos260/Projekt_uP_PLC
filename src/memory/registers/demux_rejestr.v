module demux_rejestr(
input in,
input [2:0] sel,
input write_enable,
output reg [7:0] out
);

always @(*)
begin
	case(sel)
		1'h0:
		begin
			out[0] <= in;
			out[1] <= 1'b0;
			out[2] <= 1'b0;
			out[3] <= 1'b0;
			out[4] <= 1'b0;
			out[5] <= 1'b0;
			out[6] <= 1'b0;
			out[7] <= 1'b0;
		end
		1'h1:
		begin
			out[0] <= 1'b0;
			out[1] <= in;
			out[2] <= 1'b0;
			out[3] <= 1'b0;
			out[4] <= 1'b0;
			out[5] <= 1'b0;
			out[6] <= 1'b0;
			out[7] <= 1'b0;
		end
		1'h2:
		begin
			out[0] <= 1'b0;
			out[1] <= 1'b0;
			out[2] <= in;
			out[3] <= 1'b0;
			out[4] <= 1'b0;
			out[5] <= 1'b0;
			out[6] <= 1'b0;
			out[7] <= 1'b0;
		end
		1'h3:
		begin
			out[0] <= 1'b0;
			out[1] <= 1'b0;
			out[2] <= 1'b0;
			out[3] <= in;
			out[4] <= 1'b0;
			out[5] <= 1'b0;
			out[6] <= 1'b0;
			out[7] <= 1'b0;
		end
		1'h4:
		begin
			out[0] <= 1'b0;
			out[1] <= 1'b0;
			out[2] <= 1'b0;
			out[3] <= 1'b0;
			out[4] <= in;
			out[5] <= 1'b0;
			out[6] <= 1'b0;
			out[7] <= 1'b0;
		end
		1'h5:
		begin
			out[0] <= 1'b0;
			out[1] <= 1'b0;
			out[2] <= 1'b0;
			out[3] <= 1'b0;
			out[4] <= 1'b0;
			out[5] <= in;
			out[6] <= 1'b0;
			out[7] <= 1'b0;
		end
		1'h6:
		begin
			out[0] <= 1'b0;
			out[1] <= 1'b0;
			out[2] <= 1'b0;
			out[3] <= 1'b0;
			out[4] <= 1'b0;
			out[5] <= 1'b0;
			out[6] <= in;
			out[7] <= 1'b0;
		end
		1'h7:
		begin
			out[0] <= 1'b0;
			out[1] <= 1'b0;
			out[2] <= 1'b0;
			out[3] <= 1'b0;
			out[4] <= 1'b0;
			out[5] <= 1'b0;
			out[6] <= 1'b0;
			out[7] <= in;
		end
		default:
		begin
			out[0] <= in;
			out[1] <= 1'b0;
			out[2] <= 1'b0;
			out[3] <= 1'b0;
			out[4] <= 1'b0;
			out[5] <= 1'b0;
			out[6] <= 1'b0;
			out[7] <= 1'b0;
		end
	endcase
end

endmodule