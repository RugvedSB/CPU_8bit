`timescale 1ns / 1ps

module Datapath#(parameter  ADR = 8,
                            BIT_WIDTH = 8)
(
    input clk,
    input rst,
    input en_A,
    input en_B,
    input en_result,
    input latch_result,
    input [2:0]S,
    input [ADR-1:0] addr,
    output [BIT_WIDTH-1:0]rdata,
    input mem_valid,
    input mem_write,
    output [15:0] result_out,
    output CF, ZF,
    output [BIT_WIDTH-1:0]mem_out
    );

//Wires for internal storage of values
wire [7:0] data_out_A;
wire [7:0] data_out_B;
wire [15:0] alu_result;
wire [BIT_WIDTH-1:0]mem_rdata;
wire [BIT_WIDTH-1:0]mem_out_w;
wire CF_w, ZF_w;
reg [BIT_WIDTH-1:0]mem_rdata_reg;

always@(posedge clk)begin
mem_rdata_reg <= mem_rdata;
end

//For Register A
registers#(8) RegA(
    .clk(clk),
    .rst(rst),
    .en(en_A),
    .d(mem_rdata_reg),
    .q(data_out_A)
);

//For Register B
registers#(8) RegB(
    .clk(clk),
    .rst(rst),
    .en(en_B),
    .d(mem_rdata_reg),
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

//Memory Instantiation
memory memory_inst(
    .clk(clk),
    .rst(rst),
    .mem_valid(mem_valid),
    .mem_write(mem_write),
    .wdata(result_out[7:0]),
    .addr(addr),
    .rdata(mem_rdata),
    .mem_out(mem_out)
);


//Flags Output
assign CF = CF_w;
assign ZF = ZF_w;
assign rdata = mem_rdata;

endmodule