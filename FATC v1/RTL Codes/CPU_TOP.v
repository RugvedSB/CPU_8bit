`timescale 1ns / 1ps

module CPU_TOP(
    input clk,
    input rst,
    input start,
    input [7:0] data_in_A,
    input [7:0] data_in_B,
    input [1:0] S,
    output [15:0] result_out,
    output CF, ZF
    );
    
//Control Signal Wires
wire en_A;
wire en_B;
wire en_result;

//Control Unit Connection
control_unit CU(
    .clk(clk),
    .rst(rst),
    .start(start),
    .en_A(en_A),
    .en_B(en_B),
    .en_result(en_result)
);

//Datapath Connection
Datapath D(
    .clk(clk),
    .rst(rst),
    .en_A(en_A),
    .en_B(en_B),
    .data_in_A(data_in_A),
    .data_in_B(data_in_B),
    .en_result(en_result),
    .S(S),
    .result_out(result_out),
    .CF(CF),
    .ZF(ZF)
);
endmodule
