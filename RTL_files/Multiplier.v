`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2022 06:41:39 PM
// Design Name: 
// Module Name: Multiplier
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

`define WIDTH_Q 5
`define WIDTH_DATA_Q 4
module Multiplier(
input i_clk , 
input [`WIDTH_DATA_Q-1:0] i_data_q, 
input i_AQ , 
input ld_Q , 
output [`WIDTH_Q-1:0] o_data_Q );

reg [`WIDTH_Q-1:0] o_Qout ;
always @(posedge i_clk )
          begin
           if (ld_Q==1'b1)
                  begin
                     o_Qout <= {i_data_q, 1'b0};  //load the multiplier in Q reg ///
                        end
                       else 
                  begin
            o_Qout <= {i_AQ, o_Qout[4:1]}; //shift right //
       end
   end
 
 assign o_data_Q = o_Qout ;  
   
endmodule
