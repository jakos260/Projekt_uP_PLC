module registers(clk, en, r_or_w, reg_addr, in, out);

    parameter WIDTH = 16;
    parameter REG_NUM = 16;

    input clk, en, r_or_w; // r_or_w => 1 = write, 0 = read
    input [REG_NUM-1:0] reg_addr;
    input [WIDTH-1:0] in;
    output reg [WIDTH-1:0] out;

    reg [WIDTH-1:0] mem [REG_NUM-1:0];

    initial out <= 16'dz;

    always @(*) begin
        if(en) begin        
            if(r_or_w) begin // write
                mem[reg_addr] <= in;
                out <= 16'dz;
            end
            else begin //read
                out <= mem[reg_addr];
            end
        end
        else out <= 16'dz;
    end

endmodule
