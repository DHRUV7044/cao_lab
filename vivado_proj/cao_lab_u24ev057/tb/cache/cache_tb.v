`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2026 05:04:44 PM
// Design Name: 
// Module Name: cache_tb
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


module cache_tb(

    );
    
    parameter p = 10 ;
    
    reg clk;
    reg [7:0] addr;
    wire [7:0] out;
    
    
    cache cache (addr , clk , out);
    
    initial begin
    clk = 1;
    forever #(p/2) clk = ~clk;
    end
    
    initial begin
    
        #49;
        addr = 8'h02;
        #20;
        addr = 8'h03;
        #20;
        addr = 8'h04;
        #20;
        addr = 8'h0A;
        #20;
        addr = 8'h1A;
        #20;
        addr = 8'h02;
        #20;
        addr = 8'h04;
        #20;
        addr = 8'h05;
        #20;
        addr = 8'h03;
        #20;
        $finish;
           
    
    end
    

    
endmodule
