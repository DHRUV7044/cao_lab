`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 05:30:34 PM
// Design Name: 
// Module Name: hard_wired_control_unit_tb1
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


module hard_wired_control_unit_tb1(

    );
    
    parameter p = 10;
    
    reg clk,rst;
    reg MFC;
    reg [3:0] ir;
    
    wire IRin , PCout , PCinc , MARin , MDRine , MDRout , Aout , Bout , Yin , TEMPin , TEMPout , END;
    wire [3:0] ALUop;
    
    
    hard_wired_control_unit_1 cu_dut (
        clk , rst , MFC , ir , IRin , PCout , PCinc , MARin , MDRine , MDRout , Aout , Bout , Yin , TEMPin , TEMPout , END , ALUop
    );
    
    initial begin
    clk = 1;
    forever #(p/2) clk = ~clk;
    end
    
    initial begin
    
    rst = 1;
    #1;
    
    rst = 1;
    MFC = 0;
    ir = 0;
    #(p);
    
    rst = 0;
    
    ir = 4'h8;
    #p;
    MFC = 1;
    #p;
    MFC = 0;
    #p;
    #p;
    
    ir = 4'hf;
    #(2*p);
    MFC = 1;
    #p;
    MFC = 0;
    #p;
    #p;
    
    ir = 4'h1;
    #(p);
    MFC = 1;
    #p;
    MFC = 0;
    #p;
    #p;
    
    ir = 4'h4;
    #(3*p);
    MFC = 1;
    #p;
    MFC = 0;
    #p;
    #p;
    
    
    $finish;
    
    
    
    end
    
    
    
endmodule
