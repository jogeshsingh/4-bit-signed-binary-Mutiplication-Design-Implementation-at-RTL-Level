`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2022 03:13:36 PM
// Design Name: 
// Module Name: Mux_2_1
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

`define WIDTH_OP 5
module Mux_2_1(
input [`WIDTH_OP-1:0]i_op_1, 
input [`WIDTH_OP-1:0]i_op_2 ,
input i_sel , 
output [`WIDTH_OP-1:0] o_out_Mux  
    );
    
  assign o_out_Mux = i_sel ? i_op_2 : i_op_1 ;
endmodule
