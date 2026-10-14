`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2026 01:04:27 PM
// Design Name: 
// Module Name: alu_display
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


module alu_display(
    input clk,
    input [3:0] op,
    input [5:0] a,
    input [5:0] b,
    output [6:0] seg,
    output v,
    output sign,
    output dp,
    output [3:0] an
);

    wire [11:0] alu_out;
    wire alu_overflow;
    wire [11:0] mag;
    reg [15:0] bcd;
    integer i;

    reg [17:0] refresh_counter = 18'd0;
    wire [1:0] digit_select;
    reg [3:0] current_digit;
    reg [3:0] an_reg;
    reg [6:0] seg_reg;

    alu6_verilog #(.w(6)) alu6_inst (
        .op(op),
        .a(a),
        .b(b),
        .c(alu_out),
        .v(alu_overflow)
    );

    assign v = alu_overflow;
    assign sign = alu_out[11];
    assign mag = alu_out[11] ? (-alu_out) : alu_out;

    always @(*) begin
        bcd = 16'd0;
        for (i = 11; i >= 0; i = i - 1) begin
            if (bcd[3:0] >= 5)
                bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] >= 5)
                bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] >= 5)
                bcd[11:8] = bcd[11:8] + 3;
            if (bcd[15:12] >= 5)
                bcd[15:12] = bcd[15:12] + 3;
            bcd = {bcd[14:0], mag[i]};
        end
    end

    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1'b1;
    end

    assign digit_select = refresh_counter[17:16];

    always @(*) begin
        case (digit_select)
            2'b00: begin
                an_reg = 4'b1110;
                current_digit = bcd[3:0];
            end
            2'b01: begin
                an_reg = 4'b1101;
                current_digit = bcd[7:4];
            end
            2'b10: begin
                an_reg = 4'b1011;
                current_digit = bcd[11:8];
            end
            2'b11: begin
                an_reg = 4'b0111;
                current_digit = bcd[15:12];
            end
            default: begin
                an_reg = 4'b1111;
                current_digit = 4'd0;
            end
        endcase
    end

    always @(*) begin
        case (current_digit)
            4'h0: seg_reg = 7'b1000000;
            4'h1: seg_reg = 7'b1111001;
            4'h2: seg_reg = 7'b0100100;
            4'h3: seg_reg = 7'b0110000;
            4'h4: seg_reg = 7'b0011001;
            4'h5: seg_reg = 7'b0010010;
            4'h6: seg_reg = 7'b0000010;
            4'h7: seg_reg = 7'b1111000;
            4'h8: seg_reg = 7'b0000000;
            4'h9: seg_reg = 7'b0010000;
            default: seg_reg = 7'b1111111;
        endcase
    end

    assign an = an_reg;
    assign seg = seg_reg;
    assign dp = 1'b1;

endmodule
