`timescale 1ns/1ps

module ALU(
    output reg [15:0]result,
    input [7:0]A, B,
    input [1:0]S,
    output reg CF, ZF
    );
always @(*)begin
CF = 1'b0;
ZF = 1'b0;
result = 16'd0;
case(S)
2'b00 : begin
{CF, result[7:0]} = A + B;
ZF = ({CF, result[7:0]} == 9'b0);
end
2'b01 : begin
result = A - B;
ZF = (result == 16'b0);
end
2'b10 : begin
result = A * B;
ZF = (result == 16'b0);
end
default : result = 16'd0;
endcase
end
endmodule