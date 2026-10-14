`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2026 04:43:19 PM
// Design Name: 
// Module Name: alu8_verilog_tb
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


module alu8_verilog_tb;

    reg  [3:0] op;
    reg  [7:0] a;
    reg  [7:0] b;
    wire [15:0] c;
    wire v;

    alu_8bit_verilog uut (
        .op(op),
        .a(a),
        .b(b),
        .c(c),
        .v(v)
    );

    initial begin
        op = 4'h0;
        a  = 8'h00;
        b  = 8'h00;
        #10;

        op = 4'h0; a = 8'd25;  b = 8'd15;  #10;
        op = 4'h0; a = 8'hCE;  b = 8'd20;  #10;
        op = 4'h0; a = 8'h7F;  b = 8'd1;   #10;
        op = 4'h0; a = 8'hFF;  b = 8'd1;   #10;

        op = 4'h1; a = 8'd50;  b = 8'd20;  #10;
        op = 4'h1; a = 8'd20;  b = 8'd50;  #10;
        op = 4'h1; a = 8'h80;  b = 8'h7F;  #10;

        op = 4'h2; a = 8'd12;  b = 8'd10;  #10;
        op = 4'h2; a = 8'hF4;  b = 8'd10;  #10;
        op = 4'h2; a = 8'h80;  b = 8'h80;  #10;
        op = 4'h2; a = 8'h7F;  b = 8'h7F;  #10;

        op = 4'h3; a = 8'd25;  b = 8'd5;   #10;
        op = 4'h3; a = 8'hE7;  b = 8'd4;   #10;
        op = 4'h3; a = 8'd25;  b = 8'd0;   #10;
        op = 4'h3; a = 8'd0;   b = 8'd7;   #10;

        op = 4'h4; a = 8'd17;  b = 8'd5;   #10;
        op = 4'h4; a = 8'hEF;  b = 8'd5;   #10;
        op = 4'h4; a = 8'd17;  b = 8'd0;   #10;

        op = 4'h5; a = 8'd17;  b = 8'd5;   #10;
        op = 4'h5; a = 8'hEF;  b = 8'd5;   #10;
        op = 4'h5; a = 8'd17;  b = 8'd0;   #10;

        op = 4'h6; a = 8'h00; b = 8'h00; #10;
        op = 4'h6; a = 8'hFF; b = 8'h00; #10;
        op = 4'h6; a = 8'h80; b = 8'h00; #10;

        op = 4'h7; a = 8'h55; b = 8'h0F; #10;
        op = 4'h7; a = 8'hFF; b = 8'h55; #10;
        op = 4'h7; a = 8'h00; b = 8'hFF; #10;

        op = 4'h8; a = 8'h55; b = 8'h0F; #10;
        op = 4'h8; a = 8'hFF; b = 8'h55; #10;
        op = 4'h8; a = 8'hAA; b = 8'hAA; #10;

        op = 4'h9; a = 8'h81; b = 8'd0;  #10;
        op = 4'h9; a = 8'h81; b = 8'd1;  #10;
        op = 4'h9; a = 8'h81; b = 8'd7;  #10;
        op = 4'h9; a = 8'hFF; b = 8'd8;  #10;

        op = 4'hA; a = 8'h81; b = 8'd0;  #10;
        op = 4'hA; a = 8'h01; b = 8'd7;  #10;
        op = 4'hA; a = 8'h01; b = 8'd8;  #10;

        op = 4'hB; a = 8'h81; b = 8'd0;  #10;
        op = 4'hB; a = 8'h01; b = 8'd0;  #10;
        op = 4'hB; a = 8'hFF; b = 8'd0;  #10;

        op = 4'hC; a = 8'h81; b = 8'd0;  #10;
        op = 4'hC; a = 8'h40; b = 8'd0;  #10;
        op = 4'hC; a = 8'hFF; b = 8'd0;  #10;

        op = 4'hD; a = 8'd0;   b = 8'd0; #10;
        op = 4'hD; a = 8'd3;   b = 8'd0; #10;
        op = 4'hD; a = 8'hFD;  b = 8'd0; #10;
        op = 4'hD; a = 8'd31;  b = 8'd0; #10;
        op = 4'hD; a = 8'd32;  b = 8'd0; #10;
        op = 4'hD; a = 8'hE0;  b = 8'd0; #10;
        op = 4'hD; a = 8'hDF;  b = 8'd0; #10;

        op = 4'hE; a = 8'd12;  b = 8'd5;   #10;
        op = 4'hE; a = 8'hF4;  b = 8'hFB;  #10;
        op = 4'hE; a = 8'h80;  b = 8'h7F;  #10;

        op = 4'hF; a = 8'd3;   b = 8'd5;   #10;
        op = 4'hF; a = 8'hFD;  b = 8'd5;   #10;
        op = 4'hF; a = 8'd0;   b = 8'd5;   #10;

        #10;
        $finish;
    end

endmodule
