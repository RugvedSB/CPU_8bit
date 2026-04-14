`timescale 1ns/1ps

module ALU(
    output reg [15:0]result,
    input [7:0]A, B,
    input [2:0]S,
    output reg CF, ZF
    );
always @(*)begin
CF = 1'b0;
ZF = 1'b0;
result = 16'd0;
case(S)
3'b000 : begin
result = A + B; // This will handle the 16-bit result (e.g., 256)
CF = (A + B > 8'hFF); // Manually calculate Carry if needed
ZF = (result == 16'b0);
end
3'b001 : begin
result = A - B;
ZF = (result == 16'b0);
end
3'b010 : begin
result = A * B;
ZF = (result == 16'b0);
end
3'b011 : begin
result = A | B;
ZF = (result == 16'b0);
end
3'b100 : begin
result = ~(A | B);
ZF = (result == 16'b0);
end
3'b101 : begin
result = A & B;
ZF = (result == 16'b0);
end
3'b110 : begin
result = ~(A & B);
ZF = (result == 16'b0);
end
3'b111 : begin
result = A ^ B;
ZF = (result == 16'b0);
end
default : result = 16'd0;
endcase
end
endmodule