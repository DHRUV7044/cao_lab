`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 04:43:21 PM
// Design Name: 
// Module Name: fa_verilog
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


module fa_verilog(

    input a,
    input b,
    input cin,
    output s,
    output cout

    );
    
        assign s = a^b^cin;
        
        assign cout = (a&b)|(b&cin)|(cin&a);
    
endmodule
