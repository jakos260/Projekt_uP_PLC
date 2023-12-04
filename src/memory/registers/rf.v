module rf(
input [7:0] rf_in,
input clk,
input ce,
output reg [7:0] rf_out
);

always @(negedge clk)
begin
	if(ce)
	begin
		rf_out <= rf_in;
	end
	else
	begin
		rf_out <= rf_out;
	end
end

endmodule