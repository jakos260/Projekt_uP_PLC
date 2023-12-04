module dekoder(
input [7:0] dane_rom,
output reg [4:0] instrukcja,
output reg rst,
output reg ldi,
output reg rf_ce,
output reg aku_ce,
output reg pamiec_ce,
output reg rw_rf,
output reg jmp_en,
output reg ce_wejsc,
output reg ce_wyjsc,
output reg rw_pamiec
);

always @(dane_rom)
begin
	case(dane_rom) //rw_rf - 0 - odczyt, 1 - zapis; pamiec - 0 - odczyt, 1 - zapis
		8'd0:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000000000; //ld_reg_bit
		8'd1:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000000001; //ldn_reg_bit
		8'd2:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000000010; //st_reg_bit
		8'd3:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000000011; //stn_reg_bit
		8'd4:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000000100; //and_bit
		8'd5:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000000101; //andn_bit
		8'd6:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b001001100000110; //or_bit
		8'd7:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100100000111; //orn_bit
		8'd8:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000001000; //xor_bit
		8'd9:  {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000001001; //xorn_bit
		8'd10: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000100000001010; //not_bit
		8'd11: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b001010000001011; //s_bit
		8'd12: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000000000001100; //r_bit
		8'd13: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b010100000001101; //ld_pam
		8'd14: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b000000010001110; //st_pam
		8'd15: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000001111; //ldi_const
		8'd16: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000010000; //add
		8'd17: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000010001; //sub
		8'd18: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000010010; //mul
		8'd19: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000010011; //div
		8'd20: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000010100; //mod
		8'd21: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000010101; //gt
		8'd22: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000010110; //ge
		8'd23: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000010111; //eq
		8'd24: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000011000; //ne
		8'd25: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000011001; //le
		8'd26: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000011010; //lt
		8'd27: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000011011; //jmp
		8'd28: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000011100; //ld_input
		8'd29: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000011101; //st_output
		8'd30: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000011101; //rst
		8'd31: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja}   <=  15'b100000000011101; //nop
		default: {rst, ldi, rf_ce, aku_ce, rw_rf, rw_pamiec, pamiec_ce, jmp_en, ce_wejsc, ce_wyjsc, instrukcja} <=  15'b000000000011101; //nop
		endcase
end

endmodule