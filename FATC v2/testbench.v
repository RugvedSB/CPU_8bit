`timescale 1ns / 1ps

module testbench();

reg clk;
reg rst;
reg start;
reg [2:0] S;
integer i;

wire [15:0] result_out;
wire CF;
wire ZF;

//DUT Instantiation
CPU_TOP DUT(
    .clk(clk),
    .rst(rst),
    .start(start),
    .S(S),
    .result_out(result_out),
    .CF(CF),
    .ZF(ZF)
);

//Clock Generation
always #5 clk = ~clk;

function [15:0] ref_model;
input [7:0]A,B;
input [2:0] OP;

begin
    case(OP)
        3'b000 : ref_model = A + B;
        3'b001 : ref_model = A - B;
        3'b010 : ref_model = A * B;
        3'b011 : ref_model = A | B;
        3'b100 : ref_model = ~(A | B);
        3'b101 : ref_model = A & B;
        3'b110 : ref_model = ~(A & B);
        3'b111 : ref_model = A ^ B;
        default : ref_model = 16'd0;
    endcase
end
endfunction


//Driver + Scoreboard Tasks
task execute_op;
input [2:0] OP;

reg [7:0]A, B;
reg [7:0]mem_result;
reg [15:0] expected;

begin

A = DUT.DP.memory_inst.mem[0];
B = DUT.DP.memory_inst.mem[1];

 @(posedge clk)
    S = OP;
    start = 1;
 @(posedge clk)
    start = 0;
wait (DUT.CU.state != 4'd0);
wait (DUT.CU.state == 4'd0);
@(posedge clk)
mem_result = DUT.DP.memory_inst.mem[2];
 
 expected = ref_model(A, B, OP);
    
    if(mem_result !== expected[7:0])
        $display ("Memory Error t=%0t EXP = %0d GOT = %0d", $time, expected[7:0], mem_result[7:0]);
    else
        $display("MEM PASS t=%0t Result=%0d", $time, mem_result);
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
    S = 0;
    
    #20 rst = 0;         //Reset Release
    
    //Preload Memory
    DUT.DP.memory_inst.mem[0] = 8'd20;
    DUT.DP.memory_inst.mem[1] = 8'd15;
    DUT.DP.memory_inst.mem[2] = 8'd0;
    
    execute_op(3'b000); //Addition Operation
    execute_op(3'b001); //Subtraction Operation
    execute_op(3'b010);  //Multiplication Operation
    execute_op(3'b011); //OR Operation
    execute_op(3'b100); //NOR Operation
    execute_op(3'b101); //AND Operation
    execute_op(3'b110); //NAND Operation
    execute_op(3'b111); //XOR Operation
    
    //Edge Case Testing(Zero Case and Memory Overflow)
    DUT.DP.memory_inst.mem[0] = 8'd50;
    DUT.DP.memory_inst.mem[1] = 8'd50;
    execute_op(3'b001);
    
    DUT.DP.memory_inst.mem[0] = 8'hFF;
    DUT.DP.memory_inst.mem[1] = 8'h01;
    execute_op(3'b000);
    
    //Random Testing
    for (i=0; i<5; i = i+1) begin
    DUT.DP.memory_inst.mem[0] = $random;
    DUT.DP.memory_inst.mem[1] = $random;
    execute_op($random & 3'b111);
    end
    $finish;
end

initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, testbench);
end
endmodule