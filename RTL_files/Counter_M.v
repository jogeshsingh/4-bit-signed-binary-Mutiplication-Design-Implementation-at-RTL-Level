`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2022 04:43:12 PM
// Design Name: 
// Module Name: Counter_M
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

`define N_COUNT_WIDTH 3
module Counter_M(
input i_clk , 
input i_rst_n , 
output [`N_COUNT_WIDTH-1:0] o_cnt
    );
    reg [`N_COUNT_WIDTH-1:0] o_counter ;
    
    
    always @(posedge i_clk or negedge i_rst_n)
        begin
          if (~i_rst_n)
             begin
                o_counter <= 0;
                 end
              else
                   begin
           o_counter <= o_counter + 1'b1 ;
        end  
      end                   
                
   assign o_cnt = o_counter ;              
endmodule
