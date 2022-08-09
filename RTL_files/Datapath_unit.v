`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2022 02:44:22 PM
// Design Name: 
// Module Name: Datapath_unit
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

`define DATA_WIDTH 4
`define DATA_WIDTH_M 5
`define DATA_OUT_Q 5
`define DATA_OUT_ACC 5
`define DATA_OUT_M 5
`define CNT_WIDTH 3
module Datapath_unit(
input i_clk , 
input i_rst_n ,
input load_Acc , 
input load_Q , 
input load_M , 
input load_Qn ,
input add_sub_en ,
input sel_Mux ,  
input c_enable ,
input i_clr_q ,  
input [`DATA_WIDTH_M-1:0] i_Op_multiplicand , 
input [`DATA_WIDTH-1:0] i_Op_multiplier , 
output [`DATA_OUT_Q-1:0] o_Q_out, 
output[`DATA_OUT_ACC-1:0] o_ACC_out , 
output Q_n, 
output Q ,  
output C_o , 
output o_assert_done  );
    
   
    //wire declarations//
  
      wire  [`CNT_WIDTH-1:0] cnt_out ;  

    wire [`DATA_OUT_ACC-1:0] o_Data_Acc ;
    wire  [`DATA_OUT_M-1:0] o_M_out ;
    wire [`DATA_OUT_M-1:0] S_out ; 
    //wire [`DATA_WIDTH-1:0] Q_in ;
    wire AQ = o_ACC_out[0] ;
    assign  Q =  o_Q_out[1] ;
    assign  Q_n = o_Q_out[0]; 
    Accumulator     ACC( .i_clk(i_clk) ,   .ld_Acc(load_Acc) ,   .i_data(o_Data_Acc) , .o_Acc(o_ACC_out ));
   
    Multiplier      Q_OP( .i_clk(i_clk)  ,.clr_q(i_clr_q)  ,  .i_data_q(i_Op_multiplier),  .i_AQ(AQ) , .ld_Q(load_Q) , .o_data_Q(o_Q_out) );
   // MUX_Q           M_Q( .i_p_1(4'b0000),  .i_p_2(i_Op_multiplier) , .sel_in(sel_Q) ,  .o_out_Q(Q_in)  );
    Multiplicand_M  M_OP(.i_clk(i_clk) , .i_rst_n(i_rst_n) ,   .ld_M(load_M) ,  .data_M(i_Op_multiplicand)  , .o_data_M(o_M_out));
    
   // Q_reg           Q_N(.i_clk(i_clk) , .i_rst_n(i_rst_n) , .d_in(Q) , .ld_Q_n(load_Qn) , .o_Qn(Q_n) );  
    
   ADD_SUB   ADDER_SUBTRACTOR(.i_a(o_ACC_out), .i_b(o_M_out), .i_cin(c_enable), .i_add_sub(add_sub_en) ,.sum_out(S_out), .c_out(C_o));

    Mux_2_1         MUX(.i_op_1(5'b00000), .i_op_2(S_out) , .i_sel(sel_Mux) ,  .o_out_Mux(o_Data_Acc)  );
    
    Counter_M COUNT( .i_clk(i_clk),  .i_rst_n(i_rst_n) ,  .o_cnt(cnt_out));
   
    assign o_assert_done = (cnt_out == 3'b110)? 1'b1 : 1'b0;
    
     
endmodule
