module wyjscie(
input [7:0] wej,
output reg [7:0] wyj
);

always @(*)
begin
	wyj <= wej;
end

endmodule