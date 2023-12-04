module rom(
input [7:0] addr,
output reg [7:0] dane,
output reg [7:0] wartosc
);

always @(addr)
begin
	case(addr)
		8'd0: {dane, wartosc} <= 16'h0C00;   //NOP     C0
		8'd1: {dane, wartosc} <= 16'h0D07;   //LDI 7   D7
		8'd2: {dane, wartosc} <= 16'h0601;   //ST P1   61
		8'd3: {dane, wartosc} <= 16'h0D05;   //LDI 5   D5
		8'd4: {dane, wartosc} <= 16'h0602;   //ST P2   62
		8'd5: {dane, wartosc} <= 16'h0701;   //LD P1   71
		8'd6: {dane, wartosc} <= 16'h0B04;   //ST R4   B4
		8'd7: {dane, wartosc} <= 16'h0702;   //LD P2   72
		8'd8: {dane, wartosc} <= 16'h0504;   //ADD R4  54
		8'd9: {dane, wartosc} <= 16'h0C00;   //NOP     C0
		8'd10: {dane, wartosc} <= 16'h0E03;  //JMP 3   E3
		8'd11: {dane, wartosc} <= 16'h0500;  //ADD R   50
		8'd12: {dane, wartosc} <= 16'h0800;  //DEC A   80
		8'd13: {dane, wartosc} <= 16'h0900;  //INC A   90
		8'd14: {dane, wartosc} <= 16'h0F00;  //RST     F0
		8'd15: {dane, wartosc} <= 16'h0F00;
		default: {dane, wartosc} <= 16'h0F00;
		endcase
end
endmodule