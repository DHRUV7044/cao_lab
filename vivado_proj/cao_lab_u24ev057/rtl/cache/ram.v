`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2026 04:49:10 PM
// Design Name: 
// Module Name: ram
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


module ram(
    input [7:0] addr,
    input clk,
    output [7:0] out
    );
    
    reg [7:0] mem [0:255];
    assign out = mem[addr];
    
    integer i;
    
    initial begin
    
        for(i = 0 ; i < 256 ; i = i + 1)
            mem[i] <= i+127;
    end
    
    
endmodule
