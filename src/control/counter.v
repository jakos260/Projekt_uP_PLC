`timescale 1ns/1ps

module counter(clk, rst, jmp_en, jmp_addr, pc);
    input clk;
    input rst;
	input jmp_en;
	input [7:0] jmp_addr;

    output reg [7:0] pc;

    
    initial pc = 8'd0;    
    
    always @(negedge clk)
    begin
        if(rst == 1)
            pc <= 8'd0;
        else
        begin
            if(jmp_en == 1)
                pc <= jmp_addr;
            else
                pc <= pc + 1;
        end
    end
endmodule