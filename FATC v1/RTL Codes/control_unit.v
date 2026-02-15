`timescale 1ns / 1ps

module control_unit(
    input clk,
    input rst,
    input start,
    output reg en_A, en_B, en_result
    );
    
parameter   IDLE = 3'd0,
            LOAD_A = 3'd1,
            LOAD_B = 3'd2,
            EXECUTE = 3'd3,
            WRITE = 3'd4;
            
reg [2:0] state, nxt_state;

always @(posedge clk or posedge rst)begin
if (rst) begin
    state <= IDLE;
end
else begin
    state <= nxt_state;
end
end

//Next State Logic
always @(*)
begin
    case(state)
        IDLE : nxt_state = (start) ? LOAD_A : IDLE;
        LOAD_A : nxt_state = LOAD_B;
        LOAD_B : nxt_state = EXECUTE;
        EXECUTE : nxt_state = WRITE;
        WRITE : nxt_state = IDLE;
        default : nxt_state = IDLE;
    endcase    
end

//Output Logic
always @(*)begin
    en_A = 0;
    en_B = 0;
    en_result = 0;
    
    case(state)
        LOAD_A : en_A = 1;
        LOAD_B : en_B = 1;
        WRITE : en_result = 1;
    endcase
end
endmodule