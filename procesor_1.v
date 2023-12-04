module procesor_1(
input [7:0] I0,
input [7:0] I1,
input [7:0] I2,
input [7:0] I3,
input [7:0] I4,
input [7:0] I5,
input [7:0] I6,
input [7:0] I7,
input zegar,
output [7:0] Q0,
output [7:0] Q1,
output [7:0] Q2,
output [7:0] Q3,
output [7:0] Q4,
output [7:0] Q5,
output [7:0] Q6,
output [7:0] Q7
);

wire rst_w;
wire [7:0] licznik_dane_w;
wire [7:0] rom_dane_w;
wire [7:0] rom_wartosc_w;
wire [7:0] alu_out_w;
wire [7:0] aku_out_w;
wire [7:0] rf_out_w;
wire [7:0] rf_out_0w;
wire [7:0] rf_out_1w;
wire [7:0] rf_out_2w;
wire [7:0] rf_out_3w;
wire [7:0] rf_out_4w;
wire [7:0] rf_out_5w;
wire [7:0] rf_out_6w;
wire [7:0] rf_out_7w;
wire [7:0] wejscie_w;
wire [7:0] wejscie_0w;
wire [7:0] wejscie_1w;
wire [7:0] wejscie_2w;
wire [7:0] wejscie_3w;
wire [7:0] wejscie_4w;
wire [7:0] wejscie_5w;
wire [7:0] wejscie_6w;
wire [7:0] wejscie_7w;
wire [7:0] wyjscie_0w;
wire [7:0] wyjscie_1w;
wire [7:0] wyjscie_2w;
wire [7:0] wyjscie_3w;
wire [7:0] wyjscie_4w;
wire [7:0] wyjscie_5w;
wire [7:0] wyjscie_6w;
wire [7:0] wyjscie_7w;
wire [7:0] mux_ldi_out_w;
wire rf_ce_w;
wire ce_wejsc_w;
wire ce_wyjsc_w;
wire aku_ce_w;
wire pamiec_rw_w;
wire jmp_en_w;
wire [7:0] pamiec_out_w;
wire [4:0] instrukcje_w;
wire [7:0] ce_nr_rejestru;
wire rw_rf_w;
wire [1:0] sel3na1_w;

licznik licznik_wire(
	.clk(zegar),
	.rst(rst_w),
	.adres_skoku(rom_wartosc_w),
	.jmp_en(jmp_en_w),
	.dane(licznik_dane_w)
);
	
rom rom_wire(
	.addr(licznik_dane_w),
	.dane(rom_dane_w),
	.wartosc(rom_wartosc_w)
);

dekoder dekoder_wire(
	.dane_rom(rom_dane_w),
	.instrukcja(instrukcje_w),
	.rw_pamiec(pamiec_rw_w),
	.pamiec_ce(sel3na1_w[0]),
	.rst(rst_w),
	.rf_ce(rf_ce_w),
	.rw_rf(rw_rf_w),
	.aku_ce(aku_ce_w),
	.jmp_en(jmp_en_w),
	.ce_wejsc(ce_wejsc_w),
	.ce_wyjsc(ce_wyjsc_w),
	.ldi(sel3na1_w[1])
);

akumulator akumulator_wire(
	.aku_in(alu_out_w),
	.clk(zegar),
	.ce(aku_ce_w),
	.aku_out(aku_out_w)
);

alu alu_wire(
	.in0(aku_out_w),
	.in1(mux_ldi_out_w),
	.out(alu_out_w),
	.op(instrukcje_w)
);

demux_rejestr demux_rejestr_wire(
	.in(rf_ce_w),
	.sel(rom_wartosc_w),
	.write_enable(rw_rf_w),
	.out(ce_nr_rejestru)
);

mux_rejestr mux_rejestr_wire(
	.in0(rf_out_0w),
	.in1(rf_out_1w),
	.in2(rf_out_2w),
	.in3(rf_out_3w),
	.in4(rf_out_4w),
	.in5(rf_out_5w),
	.in6(rf_out_6w),
	.in7(rf_out_7w),
	.sel(rom_wartosc_w),
	.read_enable(rw_rf_w),
	.out(rf_out_w)
);

rf rf_wire_0(
	.rf_in(aku_out_w),
	.clk(zegar),
	.ce(ce_nr_rejestru[0]),
	.rf_out(rf_out_0w)
);

rf rf_wire_1(
	.rf_in(aku_out_w),
	.clk(zegar),
	.ce(ce_nr_rejestru[1]),
	.rf_out(rf_out_1w)
);

rf rf_wire_2(
	.rf_in(aku_out_w),
	.clk(zegar),
	.ce(ce_nr_rejestru[2]),
	.rf_out(rf_out_2w)
);

rf rf_wire_3(
	.rf_in(aku_out_w),
	.clk(zegar),
	.ce(ce_nr_rejestru[3]),
	.rf_out(rf_out_3w)
);

rf rf_wire_4(
	.rf_in(aku_out_w),
	.clk(zegar),
	.ce(ce_nr_rejestru[4]),
	.rf_out(rf_out_4w)
);

rf rf_wire_5(
	.rf_in(aku_out_w),
	.clk(zegar),
	.ce(ce_nr_rejestru[5]),
	.rf_out(rf_out_5w)
);

rf rf_wire_6(
	.rf_in(aku_out_w),
	.clk(zegar),
	.ce(ce_nr_rejestru[6]),
	.rf_out(rf_out_6w)
);

rf rf_wire_7(
	.rf_in(aku_out_w),
	.clk(zegar),
	.ce(ce_nr_rejestru[7]),
	.rf_out(rf_out_7w)
);

pamiec pamiec_wire(
	.dane(aku_out_w),
	.rw(pamiec_rw_w),
	.adres(rom_wartosc_w),
	.wyjscie(pamiec_out_w)
);

multiplekser4na1 multiplekser4na1_wire(
	.in0(rf_out_w),
	.in1(pamiec_out_w),
	.in2(wejscie_w),
	.in3(rom_wartosc_w),
	.sel(sel3na1_w),
	.out(mux_ldi_out_w)
);

rejestr_wejsc_wyjsc rejestr_wejsc_wire(
	.in0(I0),
	.in1(I1),
	.in2(I2),
	.in3(I3),
	.in4(I4),
	.in5(I5),
	.in6(I6),
	.in7(I7),
	.clk(zegar),
	.ce(ce_wejsc_w),
	.out0(wejscie_0w),
	.out1(wejscie_1w),
	.out2(wejscie_2w),
	.out3(wejscie_3w),
	.out4(wejscie_4w),
	.out5(wejscie_5w),
	.out6(wejscie_6w),
	.out7(wejscie_7w)
);

multiplekser_wejsc multiplekser_wejsc_wire(
	.sel(rom_wartosc_w),
	.in0(wejscie_0w),
	.in1(wejscie_1w),
	.in2(wejscie_2w),
	.in3(wejscie_3w),
	.in4(wejscie_4w),
	.in5(wejscie_5w),
	.in6(wejscie_6w),
	.in7(wejscie_7w),
	.out(wejscie_w)
);

demultiplekser_wyjsc demultiplekser_wyjsc_wire(
	.in(aku_out_w),
	.sel(rom_wartosc_w),
	.zapis(ce_wyjsc_w),
	.out0(wyjscie_0w),
	.out1(wyjscie_1w),
	.out2(wyjscie_2w),
	.out3(wyjscie_3w),
	.out4(wyjscie_4w),
	.out5(wyjscie_5w),
	.out6(wyjscie_6w),
	.out7(wyjscie_7w)
);

rejestr_wejsc_wyjsc rejestr_wyjsc_wire(
	.in0(wyjscie_0w),
	.in1(wyjscie_1w),
	.in2(wyjscie_2w),
	.in3(wyjscie_3w),
	.in4(wyjscie_4w),
	.in5(wyjscie_5w),
	.in6(wyjscie_6w),
	.in7(wyjscie_7w),
	.clk(zegar),
	.ce(ce_wyjsc_w),
	.out0(Q0),
	.out1(Q1),
	.out2(Q2),
	.out3(Q3),
	.out4(Q4),
	.out5(Q5),
	.out6(Q6),
	.out7(Q7)
);

endmodule