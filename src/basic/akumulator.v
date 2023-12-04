module akumulator(
input [7:0] aku_in,
input clk,
input ce,
output reg [7:0] aku_out
);

always @(negedge clk)
begin
	if(ce)
	begin
		aku_out <= aku_in;
	end
	else
	begin
		aku_out <= aku_out;
	end
end

endmodule