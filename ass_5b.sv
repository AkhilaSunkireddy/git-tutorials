`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2024 19:45:52
// Design Name: 
// Module Name: ass_5b
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


module ass_5b(input wire in,
                input wire clk,
                input wire rst,
                output reg y);
                
  enum bit[1:0] {s0,s1,s2} p_state,n_state;
  
  
 always@(posedge clk)
 begin
 if(rst)
 begin
 y<=0;
 p_state<=s0;
 end
 else
 p_state<=n_state;
 end
 
 
 
 always@(*)
  begin
  case(p_state)
  s0:begin if(in) begin n_state=s1;
                y=0;
            end else begin n_state=s0;
                y=0;
             end
        end
  s1: begin
             if(!in) begin n_state=s2;y=0; end
        else begin n_state=s1; y=0;end
        end
  s2: begin
        if(in) begin
        {n_state,y}={s0,1'b1};
        end
        else begin n_state=s0;
        y=0;
      end
      end
default:n_state=s0;
  endcase
  end
endmodule
