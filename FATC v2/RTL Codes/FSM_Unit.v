`timescale 1ns / 1ps

module control_unit(
    input clk,
    input rst,
    input start,
    output reg [7:0]addr,
    output reg mem_valid,
    output reg mem_write,
    output reg en_A, en_B, en_result,
    output reg latch_result
    );
    
localparam  IDLE = 4'd0,
            REQ_RD_A = 4'd1,
            LOAD_A = 4'd2,
            REQ_RD_B = 4'd3,
            LOAD_B = 4'd4,
            EXECUTE = 4'd5,
            LATCH = 4'd6,
            WAIT_WRITE = 4'd7,
            WRITE = 4'd8,
            HOLD_WRITE = 4'd9,
            WAIT_IDLE = 4'd10,
            WAIT_A = 4'd11,
            WAIT_B = 4'd12,
            WAIT_EXEC = 4'd13,
            WAIT_RESULT = 4'd14;
                   
reg [3:0] state, nxt_state;

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
        IDLE : nxt_state = (start) ? REQ_RD_A : IDLE;
        REQ_RD_A : nxt_state = WAIT_A;
        WAIT_A : nxt_state = LOAD_A;
        LOAD_A : nxt_state = REQ_RD_B;
        REQ_RD_B : nxt_state = WAIT_B;
        WAIT_B : nxt_state = LOAD_B;
        LOAD_B : nxt_state = WAIT_EXEC;
        WAIT_EXEC : nxt_state = EXECUTE;
        EXECUTE : nxt_state = LATCH;
        LATCH : nxt_state = WAIT_WRITE;
        WAIT_WRITE : nxt_state = WRITE;
        WRITE : nxt_state = HOLD_WRITE;
        HOLD_WRITE : nxt_state = WAIT_IDLE;
        WAIT_IDLE : nxt_state = IDLE;
        default : nxt_state = IDLE;
    endcase    
end

//Output Logic
always @(*)begin
    mem_valid = 0;
    mem_write = 0;
    en_A = 0;
    en_B = 0;
    en_result = 0;
    latch_result = 0;
    addr = 0;
    
    case(state)
        REQ_RD_A : begin
            mem_valid = 1;
            mem_write = 0;
            addr = 8'd0;
        end
        
        WAIT_A : begin
            mem_valid = 1;
            mem_write = 0;
            addr = 8'd0;
        end
        
        REQ_RD_B : begin
            mem_valid = 1;
            mem_write = 0;
            addr = 8'd1;
        end
        
        WAIT_B : begin
            mem_valid = 1;
            mem_write = 0;
            addr = 8'd1;
        end
        
        LOAD_A : en_A = 1;
        LOAD_B : en_B = 1;
        EXECUTE : begin
        end
        
        LATCH : begin
        en_result = 1;
        latch_result = 1;
        mem_valid = 0;
        mem_write = 0;
        end
        
        WAIT_WRITE : begin
        latch_result = 0;
        mem_valid = 0;
        mem_write = 0;
        end
        
        WRITE : begin
        latch_result = 0;
        mem_valid = 1;
        mem_write = 1;
        addr = 8'd2;
        end
        
        HOLD_WRITE : begin
        mem_valid = 1;
        mem_write = 0;
        end
        
        WAIT_IDLE : begin
        latch_result = 0;
        mem_valid = 1;
        mem_write = 0;
        addr = 8'd2;
        end
    endcase
end
endmodule