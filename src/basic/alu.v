module alu(
input [7:0] in0,
input [7:0] in1,
input [4:0] op,
output reg [7:0] out
);

always @(*)
begin
	case(op)
		5'd0:
		begin //ld
			out <= in1;
		end
		5'd1:
		begin //ldn
			//out <= ~in1;
			out <= in0 & in1;
		end
		5'd2:
		begin //st
			//
			out <= in0 | in1;
		end
		5'd3:
		begin //stn
			//
			out <= in0 ^ in1;
		end
		5'd4:
		begin //and
			//out <= in0 & in1;
			out <= in0 - in1;
		end
		5'd5:
		begin //andn
			//out <= in0 & ~in1;
			out <= in0 + in1;
		end
		5'd6:
		begin //or
			//out <= in0 | in1;
			
		end
		5'd7:
		begin //orn
			//out <= in0 | ~in1;
			out <= in1;
		end
		5'd8:
		begin //xor
			//out <= in0 ^ in1;
			out <= in0 - 1'b1;
		end
		5'd9:
		begin //xorn
			//out <= in0 ^ ~in1;
			out <= in0 + 1'b1;
		end
		5'd10:
		begin //not
			//out <= ~in0;
			out <= in1;
		end
		5'd11:
		begin //s
			//out <= 4'b1111;
			
		end
		5'd12:
		begin //r
			//out <= 4'b0000;
			
		end
		5'd13:
		begin //ld
			//
			out <= in1;
		end
		5'd14:
		begin //st
			//
			
		end
		5'd15:
		begin //add
			//out <= in0 + in1;
			
		end
		5'd16:
		begin //
			//
			
		end
		5'd17:
		begin //
			//
			
		end
		5'd18:
		begin //
			//
			
		end
		5'd19:
		begin //
			//
			
		end
		5'd20:
		begin //
			//
			
		end
		5'd21:
		begin //
			//
			
		end
		5'd22:
		begin //
			//
			
		end
		5'd23:
		begin //
			//
			
		end
		5'd24:
		begin //
			//
			
		end
		5'd25:
		begin //
			//
			
		end
		5'd26:
		begin //
			//
			
		end
		5'd27:
		begin //
			//
			
		end
		5'd28:
		begin //
			//
			
		end
		5'd29:
		begin //
			//
			
		end
		5'd30:
		begin //
			//
			
		end
		5'd31:
		begin //
			//
			
		end
		default:
		begin
			//puste
		end
	endcase
end

endmodule