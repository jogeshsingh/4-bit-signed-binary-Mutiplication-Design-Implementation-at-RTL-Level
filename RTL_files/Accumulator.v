`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2022 06:26:12 PM
// Design Name: 
// Module Name: Accumulator
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

`define WIDTH_ACC 5
module Accumulator(
input i_clk ,   
input ld_Acc ,  
input [`WIDTH_ACC-1:0] i_data , 
output [`WIDTH_ACC-1:0] o_Acc );

reg [`WIDTH_ACC-1:0] o_Aout ;


always @(posedge i_clk )
        begin
           if (ld_Acc  ==1'b1)
                 begin
                         //  o_Aout <= i_data; ///load data from mux {either 0 or from alu(adder/sub)} and shift right aritmetic///
                           o_Aout <=  {i_data[4] , i_data[4:1]} ;
                           end
                                     else  
                                           begin
                                   o_Aout <=  {o_Aout[4] , o_Aout[4:1]}; // Arithmetic right shift ///
                               end
       
    end          
                            
  assign o_Acc = o_Aout ;                           
           
endmodule
