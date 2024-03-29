`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.02.2024 17:10:03
// Design Name: 
// Module Name: fsm_test
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


module fsm_test;
reg clk,reset,input_bit;
wire output_detected;
fsm F1(clk,reset,input_bit,output_detected);
integer i;
initial
begin
reset=0;input_bit=0;clk=0;
#10 ;
reset=1'b0;
for(i=0;i<100;i=i+1)
begin @(posedge clk);#1;
input_bit=$random;
end
#10 $finish();
end
initial
begin
clk=0;
forever #10 clk=~clk;
end
initial
begin
$monitor("input sequence=%b sequence detected=%b",input_bit,output_detected);
end
endmodule
