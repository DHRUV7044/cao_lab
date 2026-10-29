`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2026 04:49:10 PM
// Design Name: 
// Module Name: cache
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


module cache(
    input [7:0] addr,
    input clk,
    output [7:0] out
    );
    
    integer i;
    
    reg [7:0] data_mem [0:7];
    reg [2:0] block;
    reg [4:0] tag [0:7];
    reg hit;
    
    reg [7:0] op , ram_out_reg;
    wire [7:0] ram_out;
    
    ram ram1 (addr , clk , ram_out);
    
    always @(*) begin
        block = addr[2:0];
        ram_out_reg = ram_out;
    end    
    
    assign out = op;
    
    always @(posedge clk) begin
    
    
        if(tag[block] == addr[7:3]) begin
            hit = 1;
            op = data_mem[block];
        end
        else begin
            op = ram_out_reg;
            data_mem[block] = ram_out_reg;
            tag[block] = addr[7:3];
            hit = 0;
            
        end
    end
    
endmodule
