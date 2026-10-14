`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 05:18:34 PM
// Design Name: 
// Module Name: alu6_tb
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


module alu6_tb(
    );
    
    parameter w = 6;
    
    reg  [3:0] op;
    reg  [w-1:0] a;
    reg  [w-1:0] b;
    wire [2*w - 1:0] c;
    wire v;

    alu6_verilog uut (
        .op(op),
        .a(a),
        .b(b),
        .c(c),
        .v(v)
    );

    initial begin
        op = 4'h0;
        a  = 6'h00;
        b  = 6'h00;
        #10;

        // ADD (op = 0)
        op = 4'h0; a = 6'd25;  b = 6'd15;  #10;
        op = 4'h0; a = 6'hCE;  b = 6'd20;  #10; // negative-like 8-bit pattern
        op = 4'h0; a = 6'h7F;  b = 6'd1;   #10;
        op = 4'h0; a = 6'hFF;  b = 6'd1;   #10;

        // SUBTRACT (op = 1)
        op = 4'h1; a = 6'd50;  b = 6'd20;  #10;
        op = 4'h1; a = 6'd20;  b = 6'd50;  #10;
        op = 4'h1; a = 6'h80;  b = 6'h7F;  #10;

        // MULTIPLY (op = 2)
        op = 4'h2; a = 6'd12;  b = 6'd10;  #10;
        op = 4'h2; a = 6'hF4;  b = 6'd10;  #10;
        op = 4'h2; a = 6'h80;  b = 6'h80;  #10;
        op = 4'h2; a = 6'h7F;  b = 6'h7F;  #10;

        // DIVIDE (op = 3), including zero divisor
        op = 4'h3; a = 6'd25;  b = 6'd5;   #10;
        op = 4'h3; a = 6'hE7;  b = 6'd4;   #10;
        op = 4'h3; a = 6'd25;  b = 6'd0;   #10;
        op = 4'h3; a = 6'd0;   b = 6'd7;   #10;

        // MOD (op = 4), including zero divisor
        op = 4'h4; a = 6'd17;  b = 6'd5;   #10;
        op = 4'h4; a = 6'hEF;  b = 6'd5;   #10;
        op = 4'h4; a = 6'd17;  b = 6'd0;   #10;

        // REM (op = 5), including zero divisor
        op = 4'h5; a = 6'd17;  b = 6'd5;   #10;
        op = 4'h5; a = 6'hEF;  b = 6'd5;   #10;
        op = 4'h5; a = 6'd17;  b = 6'd0;   #10;

        // NOT (op = 6)
        op = 4'h6; a = 6'h00; b = 6'h00; #10;
        op = 4'h6; a = 6'hFF; b = 6'h00; #10;
        op = 4'h6; a = 6'h80; b = 6'h00; #10;

        // AND (op = 7)
        op = 4'h7; a = 8'h55; b = 8'h0F; #10;
        op = 4'h7; a = 8'hFF; b = 8'h55; #10;
        op = 4'h7; a = 8'h00; b = 8'hFF; #10;

        // XOR (op = 8)
        op = 4'h8; a = 8'h55; b = 8'h0F; #10;
        op = 4'h8; a = 8'hFF; b = 8'h55; #10;
        op = 4'h8; a = 8'hAA; b = 8'hAA; #10;

        // Logical right shift (op = 9)
        op = 4'h9; a = 6'h61; b = 6'd0;  #10;
        op = 4'h9; a = 6'h61; b = 6'd1;  #10;
        op = 4'h9; a = 6'h61; b = 6'd7;  #10;
        op = 4'h9; a = 6'hFF; b = 6'd6;  #10;

        // Logical left shift (op = 10)
        op = 4'hA; a = 6'h61; b = 6'd0;  #10;
        op = 4'hA; a = 6'h01; b = 6'd7;  #10;
        op = 4'hA; a = 6'h01; b = 6'd6;  #10;

        // Rotate right (op = 11)
        op = 4'hB; a = 6'h61; b = 6'd0;  #10;
        op = 4'hB; a = 6'h01; b = 6'd0;  #10;
        op = 4'hB; a = 6'hFF; b = 6'd0;  #10;

        // Rotate left (op = 12)
        op = 4'hC; a = 6'h61; b = 6'd0;  #10;
        op = 4'hC; a = 6'h40; b = 6'd0;  #10;
        op = 4'hC; a = 6'hFF; b = 6'd0;  #10;

        // Cube with range checking (op = 13)
        op = 4'hD; a = 6'd0;   b = 6'd0; #10;
        op = 4'hD; a = 6'd3;   b = 6'd0; #10;
        op = 4'hD; a = 6'hFD;  b = 6'd0; #10; // -3 in 8-bit two's complement
        op = 4'hD; a = 6'd31;  b = 6'd0; #10;
        op = 4'hD; a = 6'd32;  b = 6'd0; #10; // overflow boundary
        op = 4'hD; a = 6'hE0;  b = 6'd0; #10; // -32 bit pattern
        op = 4'hD; a = 6'hDF;  b = 6'd0; #10; // -33 bit pattern

        // a*a - (b/2) (op = 14)
        op = 4'hE; a = 6'd12;  b = 6'd5;   #10;
        op = 4'hE; a = 6'hF4;  b = 6'hFB;  #10;
        op = 4'hE; a = 6'h60;  b = 6'h7F;  #10;

        // b*b - (b%a) (op = 15); includes zero divisor a=0
        op = 4'hF; a = 6'd3;   b = 6'd5;   #10;
        op = 4'hF; a = 6'hFD;  b = 6'd5;   #10;
        op = 4'hF; a = 6'd0;   b = 6'd5;   #10;

        #10;
        $finish;
    end

endmodule