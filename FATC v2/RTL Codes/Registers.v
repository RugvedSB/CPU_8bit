`timescale 1ns/1ps

module registers#(parameter BIT_WIDTH = 8)(
    input clk,
    input rst,
    input en,
    input [BIT_WIDTH-1:0] d,
    output reg [BIT_WIDTH-1:0] q
);
always @(posedge clk or posedge rst)
begin
if(rst)
    q <= {BIT_WIDTH{1'b0}};
else if (en)
    q <= d;
end
endmodule