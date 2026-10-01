`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2026 04:43:19 PM
// Design Name: 
// Module Name: alu_8bit_verilog
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


module alu_8bit_verilog(
    input [3:0] op,
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] c,
    output reg v
    );


	
	always @(*) begin
		v <= 1'b0;
	case(op)
		
		4'h0 : c <= {8'h00 , a + b};
		4'h1 : c <= {8'h00 , a - b};
		4'h2 : c <= a*b;
		4'h3 : begin
		      if ( b == 0) begin
		          c <= 16'hffff;
		          v <= 1'b1;
		          end
		      else begin
		          c <= a/b;
		          v <= 1'b0;
		      end
		end
		4'h4 : c <= ((a%b) + b ) %b;
		4'h5 : c <= a%b;
		4'h6 : c <= ~a;
		4'h7 : c <= a & b;
		4'h8 : c <= a ^ b; 
		4'h9 : c <= a >> b;
		4'ha : c <= a << b;
		4'hb : c <= (a >> 1) | (a << 7);
		4'hc : c <= (a << 1) | (a >> 7);
		4'hd : begin
		      if ( (a < -32) || ( a >= 32)) begin
		          c <= 16'hffff;
		          v <= 1'b1;
		      end
		      else begin
		          c <= a*a*a;
		          v <= 1'b0;
		      end 
		end
		4'he : c <= a*a - b/2;
		4'hf : c <= b*b - b%a;
		default : c <= 16'h0000;
	endcase
	
	
	end


endmodule
