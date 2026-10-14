`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 04:51:00 PM
// Design Name: 
// Module Name: alu6_verilog
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


module alu6_verilog #( parameter w = 6)
(
    input [3:0] op,
    input [w-1:0] a,
    input [w-1:0] b,
    output reg [2*w - 1:0] c,
    output reg v
    );

    localparam lim = 1 << (2*w-1)/3;
    
    wire [2*w -1 : 0] ae , be;
    
    assign ae = $signed(a);
    assign be = $signed(b);
    	
	always @(*) begin
		v <= 1'b0;
	case(op)
		
		4'h0 : c <=  ae + be;
		4'h1 : c <=  ae - be;
		4'h2 : c <= a*b;
		4'h3 : begin
		      if ( b == 0) begin
		          c <= {{w{1'b1}} , {w{1'b1}}};
		          v <= 1'b1;
		          end
		      else begin
		          c <= a/b;
		          v <= 1'b0;
		      end
		end
		4'h4 : begin
		      if ( b == 0) begin
		          c <= {{w{1'b1}} , {w{1'b1}}};
		          v <= 1'b1;
		          end
		      else begin
		          c <= ((a%b) + b)%b;
		          v <= 1'b0;
		      end
		end
		4'h5 : begin
		      if ( b == 0) begin
		          c <= {{w{1'b1}} , {w{1'b1}}};
		          v <= 1'b1;
		          end
		      else begin
		          c <= a%b;
		          v <= 1'b0;
		      end
		end
		4'h6 : c <= ~a;
		4'h7 : c <= a & b;
		4'h8 : c <= a ^ b; 
		4'h9 : c <= a >> b;
		4'ha : c <= a << b;
		4'hb : c <= (a >> 1) | (a << w-1);
		4'hc : c <= (a << 1) | (a >> w-1);
		4'hd : begin
		      if ( ($signed(a) < $signed(-1*lim)) || ( $signed(a) >= lim)) begin
		          c <= {{w{1'b1}} , {w{1'b1}}};
		          v <= 1'b1;
		      end
		      else begin
		          c <= a*a*a;
		          v <= 1'b0;
		      end 
		end
		4'he : c <= a*a - b/2;
		4'hf : c <= b*b - b%17;
		default : c <= {{w{1'b0}} , {w{1'b0}}};
	endcase
	
	
	end


endmodule