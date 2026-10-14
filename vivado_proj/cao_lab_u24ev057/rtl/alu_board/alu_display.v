`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2026 01:04:27 PM
// Design Name: 
// Module Name: alu_display
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


module alu_display(
    input clk,
    input [3:0] opcode,
    input [5 : 0] in1, in2,
    
    output [6:0] seq,
    output overflow,
    output dp,
    output [3:0] an
    );
    
    wire [11 : 0] alu_out;
    
    alu6 #(.w(6)) alu6( .op(opcode) ,  .a(in1) , .b(in2) , .c(alu_out) , .v(overflow));
    
    
endmodule
