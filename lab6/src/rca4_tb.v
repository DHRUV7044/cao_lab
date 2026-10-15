`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 05:04:36 PM
// Design Name: 
// Module Name: rca4_tb
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


module rca4_tb();

    reg [3:0] a , b;
    reg cin;
    wire [3:0] s;
    wire cout;
    integer i , j ,k;
    
    rca4_verilog rca4_test (a , b , cin , s , cout);
    
    initial begin
    
            for (i = 0 ; i < 16 ; i = i + 1) begin
                for (j = 0 ; j < 16 ; j = j + 1) begin
                    for (k = 0 ; k < 2 ; k = k + 1) begin
                        
                        a <= i;
                        b <= j;
                        cin <= k;
                        
                        #10;
                                              
                    end
                end        
            end
 end

endmodule
