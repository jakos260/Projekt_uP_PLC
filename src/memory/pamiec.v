module pamiec(
input [7:0] dane,
input rw,
input [7:0] adres,
output reg [7:0] wyjscie
);

reg [7:0] pamiec [0:7];

always @(*)
begin
	if(rw)
	begin
		pamiec[adres] <= dane;
	end
	else
	begin
		wyjscie <= pamiec[adres];
	end
end

endmodule