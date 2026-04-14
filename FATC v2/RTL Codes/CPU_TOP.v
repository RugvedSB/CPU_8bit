`timescale 1ns / 1ps

module CPU_TOP(
    input clk,
    input rst,
    input start,
    input [2:0] S,
    output [15:0] result_out,
    output CF,
    output ZF,
    output [7:0]mem_out
    );
    
//Control Signal Wires
wire mem_valid, mem_write;
wire en_A, en_B, en_result;
wire [7:0]addr;
wire [7:0]rdata;
wire latch_result;

//Control Unit Connection
control_unit CU(
    .clk(clk),
    .rst(rst),
    .start(start),
    .mem_valid(mem_valid),
    .mem_write(mem_write),
    .addr(addr),
    .en_A(en_A),
    .en_B(en_B),
    .en_result(en_result),
    .latch_result(latch_result)
);

//Datapath Connection
Datapath DP(
    .clk(clk),
    .rst(rst),
    .en_A(en_A),
    .en_B(en_B),
    .en_result(en_result),
    .S(S),
    .addr(addr),
    .rdata(rdata),
    .mem_valid(mem_valid),
    .mem_write(mem_write),
    .result_out(result_out),
    .CF(CF),
    .ZF(ZF),
    .mem_out(mem_out),
    .latch_result(latch_result)
);
endmodule