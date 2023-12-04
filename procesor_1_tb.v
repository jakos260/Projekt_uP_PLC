`timescale 1ns/1ps

module procesor_1_tb;
integer i;

reg clk = 1'b1;

// in
reg [7:0] I0;
reg [7:0] I1;
reg [7:0] I2;
reg [7:0] I3;
reg [7:0] I4;
reg [7:0] I5;
reg [7:0] I6;
reg [7:0] I7;
// out
wire [7:0] Q0;
wire [7:0] Q1;
wire [7:0] Q2;
wire [7:0] Q3;
wire [7:0] Q4;
wire [7:0] Q5;
wire [7:0] Q6;
wire [7:0] Q7;

procesor_1 P(
	.zegar(clk),
	.I0(I0),
	.I1(I1),
	.I2(I2),
	.I3(I3),
	.I4(I4),
	.I5(I5),
	.I6(I6),
	.I7(I7),
	.Q0(Q0),
	.Q1(Q1),
	.Q2(Q2),
	.Q3(Q3),
	.Q4(Q4),
	.Q5(Q5),
	.Q6(Q6),
	.Q7(Q7)
);

initial begin

for (i = 0; i<50; i++)
begin
	#1 clk = ~clk;
end
#10
$finish;
end

initial begin
$dumpfile("tests/up_tb.vcd");
$dumpvars(0, procesor_1_tb);
$dumpon;
end

endmodule