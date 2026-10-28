`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 04:51:46 PM
// Design Name: 
// Module Name: hard_wired_control_unit_1
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


module hard_wired_control_unit_1(
    
    input clk,rst,
    input MFC,
    input [3:0] ir,
    
    output IRin , PCout , PCinc , MARin , MDRine , MDRout , Aout , Bout , Yin , TEMPin , TEMPout , END,
    output [3:0] ALUop
    );
    
    parameter T0 = 0,
              T1 = 1,
              T2 = 2,
              T3 = 3;      
    
    reg [1:0] T;
    
    assign PCout = (T == T0);
    assign MARin = (T == T0);
    
    assign MDRine = (T == T1);
    
    
    assign PCinc = (T == T2);
    assign MDRout = (T == T2);
    assign IRin = (T == T2);
    
    assign Aout = (T == T3);
    assign Bout = (T == T3);
    assign Yin =  (T == T3);
    assign END = (T == T3);
    
    assign TEMPin = 0;
    assign TEMPout = 0;
    
    assign ALUop = (T == T3)?ir:4'b0000;
    
    always @ (posedge clk or posedge rst) begin
        
        if(rst) T <= 0;
        else begin
            if(T == T1) begin
                if(MFC) T <= T + 1;
           end
           else T <=  T + 1;        
        
        end  
    end
    
    
endmodule
