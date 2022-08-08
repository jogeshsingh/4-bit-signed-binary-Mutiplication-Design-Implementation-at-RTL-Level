`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2022 05:11:39 PM
// Design Name: 
// Module Name: Top_design
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

`define N_WIDTH_DATA 5
`define N_WIDTH_Q 4 
`define N_RESULT 8
module Top_design(
input i_clk , 
input start , 
input i_rst_n , 
input [`N_WIDTH_DATA-1:0] op_1 , 
input [`N_WIDTH_Q-1:0] op_2 , 
output wire [`N_WIDTH_DATA-1:0] o_Q_out , 
output wire [`N_WIDTH_DATA-1:0] o_ACC_out , 
output o_assert_done ,
output C_o 
   );
   

   wire load_Acc , load_Q, load_M, add_sub_en  , sel_Mux , c_enable ; 
   wire Q_n , Q ;
   
 Datapath_unit DU(
i_clk , 
i_rst_n ,
load_Acc , 
load_Q , 
load_M , 
load_Qn ,
add_sub_en ,
sel_Mux ,
c_enable ,   
op_1, 
op_2, 
o_Q_out, 
o_ACC_out , 
Q_n, 
Q ,  
C_o , 
o_assert_done  
 );
  
  Controller CU(
i_clk , 
start  , 
i_rst_n ,
Q  , 
Q_n, 
load_Acc , 
load_Q , 
load_M , 
add_sub_en ,
sel_Mux  , 
c_enable 
);  
    
    
endmodule
