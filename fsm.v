`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 20:03:30
// Design Name: 
// Module Name: fsm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module fsm (clk,reset,input_bit,output_detected);
input clk;
input reset;
input input_bit;
output reg output_detected;

parameter S0=0,S1=1,S2=2,S3=3,S4=4;
reg[1:0]state;

 reg [1:0] current_state, next_state;

always @(posedge clk or posedge reset)
begin
if (reset)
begin
current_state <= S0;
end
else begin
current_state <= next_state;
end
end
always @(current_state, input_bit)
begin
        case (current_state)
            S0: begin
                if (input_bit) begin
                    next_state = S1;
                    output_detected = 0;
                end else begin
                    next_state = S0;
                end
            end

            S1: begin
                if (!input_bit) begin
                 next_state = S2;
                    output_detected = 0;
                end else begin
                    next_state = S0;
                end
            end

            S2: begin
                if (input_bit) begin
                output_detected = 0;
                    next_state = S3;
                end else begin
                    next_state = S0;
                end
            end

            S3: begin
                if (!input_bit) begin
                    next_state = S0;
                    output_detected = 1;
                end else begin
                    next_state = S0;
                end
            end

            default: begin
                next_state = S0;
            end
        endcase
    end

endmodule

