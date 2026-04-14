//This is a program for Static Random Access Memory(SRAM)
`timescale 1ns / 1ps
module memory#(parameter ADR = 8,
                parameter BIT_WIDTH = 8)
(
input clk,
input rst,
input mem_valid,
input mem_write,
input [BIT_WIDTH - 1:0]wdata,
input [ADR - 1:0]addr,
output reg [BIT_WIDTH - 1:0]rdata,
output reg [BIT_WIDTH - 1:0]mem_out
);

(* keep *)(* dont_touch = "yes" *)(* ram_style = "registers" *)
reg [BIT_WIDTH-1:0]mem[0:(1<<ADR)-1];
initial begin
    $readmemh("mem_init.hex", mem);
end

always @(posedge clk) begin
    if (rst) begin
        rdata <= 0;
        mem_out <= 0;
    end else if (mem_valid)begin
        if (mem_valid) begin
            if (mem_write)begin
                mem[addr] <= wdata;
                mem_out <= wdata;
                rdata <= wdata;
            end else begin
                rdata <= mem[addr];
                mem_out <= mem[addr];
            end
        end
    end
end
endmodule