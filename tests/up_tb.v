`timescale 1ns/1ps

module up_tb;
integer i;

// Clock and reset signals
reg clk = 1'b1;
reg rst = 1'b0;

// plc signals
reg [15:0] pressure = 5;
reg start   = 0;
reg stop    = 0;
wire motor;
wire max;

// io wires
wire [15:0] a0;
wire d0, d1, d2, d3;
// assign to io
assign a0 = pressure;
assign d0 = start;
assign d1 = stop;
assign d2 = motor;
assign d3 = max;


// DUT instantiation
up uProcessor(
    .clk_in(clk),
    .rst_in(rst),
    .a0_io(a0),
    .d0_io(d0),
    .d1_io(d1),
    .d2_io(d2),
    .d3_io(d3)
);


initial begin

    // Use the monitor task to display the FPGA IO
    // $monitor("time=%3d, q=%2b \n", $time, out);
    // Generate each input with a 20 ns delay between them
    for (i = 0; i<60; i++) begin
        #1 clk = ~clk;
    end
    $finish;
end

initial begin
    $dumpfile("tests/up_tb.vcd");
    $dumpvars(0, up_tb);
    $dumpon;
end

endmodule
