`timescale 1ns / 1ps

module testbench();

reg clk;
reg rst;
reg start;
reg [7:0] data_in_A;
reg [7:0] data_in_B;
reg [1:0] S;

wire [15:0] result_out;
wire CF;
wire ZF;

//DUT Instantiation
CPU_TOP DUT(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in_A(data_in_A),
    .data_in_B(data_in_B),
    .S(S),
    .result_out(result_out),
    .CF(CF),
    .ZF(ZF)
);

//Clock Generation
always #5 clk = ~clk;

function [15:0] ref_model;
input [7:0] A, B;
input [1:0] OP;

begin
    case(OP)
        2'b00 : ref_model = A + B;
        2'b01 : ref_model = A - B;
        2'b10 : ref_model = A * B;
        default : ref_model = 16'd0;
    endcase
end
endfunction

//Driver + Scoreboard Tasks
task execute_op;
input [7:0] A, B;
input [1:0] OP;

reg [15:0] expected;

begin
 @(posedge clk)
    data_in_A = A;
    data_in_B = B;
    S = OP;
    start = 1;
    
 @(posedge clk)
    start = 0;
    
 repeat (5) @(posedge clk);
    expected = ref_model(A, B, OP);
    
    if (result_out !== expected)
        $display ("Error t=%0t A = %0d B = %0d OP = %0b EXP = %0d GOT = %0d", $time,A,B,OP,expected,result_out);
    else
        $display ("PASS t=%0t Result=%0d CF=%0b ZF=%0b", $time,result_out,CF,ZF);
end
endtask

//Test Sequence
initial begin
    clk = 0;
    rst = 1;
    start = 0;
    data_in_A = 0;
    data_in_B = 0;
    S = 0;
    
    #20 rst = 0;         //Reset Release
    
    execute_op(8'd200, 8'd15, 2'b00); //Addition Operation
    execute_op(8'd100, 8'd45, 2'b01); //Subtraction Operation
    execute_op(8'd13, 8'd13, 2'b10);  //Multiplication Operation
end
endmodule