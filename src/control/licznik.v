module licznik(
input clk,
input rst,
input jmp_en,
input [7:0] adres_skoku,
output reg [7:0] dane
);

always @(negedge clk) //posedge
begin
	if(rst == 1'b0)
		begin
		if(jmp_en)
			begin
				dane <= adres_skoku;
			end
		else
			begin
				if(dane >= 8'b11111111)
				begin
					dane <= 8'b00000000;
				end
				else
				begin
					dane <= dane + 1'b1;
				end
			end
		end
	else
		begin
			dane <= 8'b00000000;
		end
end

endmodule