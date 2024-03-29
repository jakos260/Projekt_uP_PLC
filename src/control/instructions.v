`define NOT 8'h00
`define XOR 8'h01
`define OR  8'h02
`define AND 8'h03
`define SUB 8'h04
`define ADD 8'h05
`define RR  8'h06
`define RL  8'h07
`define DEC 8'h08
`define INC 8'h09
`define JMP 8'h0A // jump
`define JMA 8'h0B // jump if acu != 0
`define CLL 8'h0C // Call   - skok z adresem powrotu
`define RET 8'h0D // Return - adres powrotu
`define LD  8'h0E // load  register     -> accumulator
`define ST  8'h0F // store accumulator  -> register
`define IOR 8'h10 // read  io           -> accumulator
`define IOW 8'h11 // write accumulator  -> io
`define LDI 8'h12 // load  rom          -> accumulator
`define NOP 8'h13
`define RST 8'h14
