`timescale 1ns/1ps
`include "./src/control/instructions.v"
`include "./plc_prog/plc_prog_defines.v"

module rom(clk, addr, data);

parameter RAM_WORD_WIDTH = 24;
parameter RAM_ADDR_BITS = 8;

input clk;
input [RAM_ADDR_BITS-1 : 0] addr;
output reg [RAM_WORD_WIDTH-1 : 0] data;


reg [RAM_WORD_WIDTH-1:0] mem [(2**RAM_ADDR_BITS)-1:0];

// test
initial begin
	// test 1
	// mem [0]  = {`NOP,	16'h0};
	// mem [1]  = {`LDI,	16'h5};
	// mem [2]  = {`ST,	16'h1};
	// mem [3]  = {`LDI,	16'h3};
	// mem [4]  = {`ADD,	16'h1};
	// mem [5]  = {`ST,	16'h2};
	// mem [6]  = {`NOP,	16'h0};
	// mem [7]  = {`NOP, 	16'h0};
	// mem [8]  = {`LD, 	16'h2};
	// mem [9]  = {`INC,	16'h0};
	// mem [10] = {`JMP,	16'h9};
	// mem [11] = {`RST,	16'h0};

	//test 2 -> call return
	// mem [0]  	= {`NOP,	16'h0};
	// mem [1]		= {`CLL,	16'd20};
	// mem [2]  	= {`LD, 	16'h2};
	// mem [3]  	= {`RST, 	16'h0};
	// mem [20] 	= {`LDI,	16'h5};
	// mem [21]  	= {`ST,		16'h1};
	// mem [22]  	= {`LDI,	16'h3};
	// mem [23]  	= {`ADD,	16'h1};
	// mem [24]  	= {`ST,		16'h2};
	// mem [25]  	= {`RET,	16'h0};

	
	//test 3 -> call return + jump if acu != 0
	// mem [0]  	= {`NOP,	16'h0};
	// mem [1]		= {`CLL,	16'd4};
	// mem [2]  	= {`RST, 	16'h0};

	// mem [4] 	= {`LDI,	16'h1};
	// mem [5]  	= {`ST,		16'h3};
	// mem [6]  	= {`ST,		16'h2};
	// mem [7] 	= {`LDI,	16'h5};
	// mem [8]  	= {`ST,		16'h0};
	// mem [9]  	= {`LD,		16'h3};
	// mem [10]  	= {`ADD,	16'h2};
	// mem [11]  	= {`ST,		16'h2};
	// mem [12]  	= {`LD,		16'h0};
	// mem [13]  	= {`DEC,	16'h0};
	// mem [14]  	= {`JMA,	16'h8};
	// mem [15]  	= {`RET,	16'h0};

	
	// test 4 -> io rw
	// a0 d0 d1 d2 d3
	// mem [0]  	= {`NOP,	16'h0};
	// mem [1]		= {`IOR,	16'h0}; // io[0] (a0) 	-> acu
	// mem [2]  	= {`ST, 	16'h0}; // acu 			-> rf[0]
	// mem [3]		= {`IOR,	16'h2}; // io[2] (d1) 	-> acu
	// mem [4]  	= {`ST, 	16'h1}; // acu 			-> rf[1]
	// mem [5] 	= {`LDI,	16'h4}; // 4 			-> acu
	// mem [6]		= {`IOW,	16'h3}; // acu 			-> io[3] (d2)
	// mem [7]  	= {`DEC,	16'h0}; // acu --		-> acu
	// mem [8]  	= {`JMA,	16'h6}; // if(acu!=0) pc = 6
	// mem [9]  	= {`NOP,	16'h0};
	// mem [10]  	= {`RST,	16'h0};

	// pbl program
	// $readmemb("plc_prog.bin", mem);
	
	mem [0]  	= {`NOP,	16'h0};
	// setup
	mem [1]		= {`LDI,	16'D0};
	mem [2]  	= {`IOW, 	`O_MAX};
	mem [3]		= {`IOW,	`O_MOTOR};
	mem [4]  	= {`LDI, 	16'D3};
	mem [5] 	= {`ST,		`R_COUNTER};
	mem [6]		= {`LDI,	16'd5};
	mem [7]  	= {`ST,		`R_TIMER};
	mem [8]  	= {`CLL,	`C_ROUTINE};

	mem [14]	= {`RST, 	16'd0};

	// routine
	mem [15]  	= {`CLL,	`C_RESET};
	mem [16]  	= {`LD,		`R_SRQ};
	mem [17]  	= {`JMA,	`C_TIMER_DEC};
	// mem [17]	=

	// reset
	mem [20]  	= {`IOR,	`I_STOP};
	mem [21]  	= {`NOT,	16'd0};
	mem [22]  	= {`AND,	`R_COUNTER};
	mem [23]  	= {`JMA,	`C_SET};
	mem [24]  	= {`RET,	16'd0};

	// set
	mem [30]  	= {`IOR,	`I_START};
	mem [31]  	= {`ST,		`R_SRQ};
	mem [32]  	= {`RET,	16'd0};

	// timer decrementation
	mem [35]	= {`LDI,	16'd1000};


end

always @(*) begin
    data <= mem[addr];
end

endmodule

