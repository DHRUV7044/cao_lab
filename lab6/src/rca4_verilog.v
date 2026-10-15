`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 04:42:48 PM
// Design Name: 
// Module Name: rca4_verilog
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


module rca4_verilog(
        input [3:0] a,b,
        input cin,
        output [3:0] s,
        output cout        
    );
    
    wire [4:0] c;
    
    assign c[0] = cin;
    assign cout = c[4];
    
    genvar i;
    
    generate 
    
        for(i = 0 ; i < 4 ; i = i + 1) begin : fa
            
            fa_verilog fa (a[i] , b[i] , c[i] , s[i] , c[i+1]);
        
        end
    
    
    endgenerate
        
endmodule
