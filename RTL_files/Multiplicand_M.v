`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2022 02:33:33 PM
// Design Name: 
// Module Name: Multiplicand_M
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
//data is 5 bit input the MSB bit shows the sign bit whether number is positive incase of (0) or negative in case of (1) 
`define WIDTH_M 5
module Multiplicand_M(
input i_clk , 
input i_rst_n , 
input ld_M , 
input [`WIDTH_M-1:0] data_M  , 
output [`WIDTH_M-1:0] o_data_M
    );
 reg [`WIDTH_M-1:0] o_Mout ;
 
 
 always @(posedge i_clk)
       begin
           if (~i_rst_n)
               o_Mout <= 0;
                 else 
                   begin
                        if (ld_M==1'b1)
                          o_Mout <= data_M ;
                            else
                         o_Mout <= o_Mout ;
                    end
        end 
    assign o_data_M = o_Mout ;                                     
endmodule
