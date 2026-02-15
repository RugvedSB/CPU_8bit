`timescale 1ns / 1ps

module Datapath(
    input clk,
    input rst,
    input [7:0]data_in_A, data_in_B,
    input en_A,
    input en_B,
    input en_result,
    input [1:0]S,
    output [15:0] result_out,
    output CF, ZF
    );

wire [7:0] data_out_A;
wire [7:0] data_out_B;
wire [15:0] alu_result;
wire CF_w, ZF_w;

//For Register A
registers#(8) RegA(
    .clk(clk),
    .rst(rst),
    .en(en_A),
    .d(data_in_A),
    .q(data_out_A)
);

//For Register B
registers#(8) RegB(
    .clk(clk),
    .rst(rst),
    .en(en_B),
    .d(data_in_B),
    .q(data_out_B)
);

//ALU Instantiation
ALU alu_inst(
    .A(data_out_A),
    .B(data_out_B),
    .S(S),
    .result(alu_result),
    .CF(CF_w),
    .ZF(ZF_w)
);

//Result Registers
registers #(16)ResultReg(
    .clk(clk),
    .rst(rst),
    .en(en_result),
    .d(alu_result),
    .q(result_out)
);

//Flags Output
assign CF = CF_w;
assign ZF = ZF_w;

endmodule
