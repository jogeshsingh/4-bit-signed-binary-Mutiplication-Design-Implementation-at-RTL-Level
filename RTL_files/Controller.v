`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2022 03:27:56 PM
// Design Name: 
// Module Name: Controller
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
`define IDLE 4'b0000
`define S1  4'b0001 
`define S2  4'b0010 
`define S3  4'b0011
`define S4  4'b0100
`define S5  4'b0101
`define S6  4'b0110

module Controller(
input i_clk , 
input start  , 
input i_rst_n ,
input Q  , 
input Q_n, 
input o_assert_done  , 
output  load_Acc , 
output load_Q , 
output load_M , 
output add_sub_en ,
output sel_Mux  , 
output c_enable  , 
output i_clr_q 
);

reg [3:0] p_STATE ;
reg [3:0] n_STATE ;
reg [6:0] CV ;
assign load_Acc    = CV[0];  
assign load_Q      = CV[1]; 
assign load_M      = CV[2];
assign add_sub_en  = CV[3];
assign sel_Mux     = CV[4];
assign c_enable    = CV[5] ;
assign i_clr_q     = CV[6];

always @(posedge i_clk)
   begin
    if (~i_rst_n)
       p_STATE <= `IDLE;
         else
         p_STATE <= n_STATE ;
    end
  ///next state logic ///
    always @(*)
       begin
          case (p_STATE)
           `IDLE : begin 
                     if (start==1'b1)
                         n_STATE = `S1 ;
                         else
                         n_STATE = `IDLE;
                  end  
         `S1 , `S2, `S3, `S4, `S5, `S6  : begin
                        if (o_assert_done == 1'b1)
                             n_STATE = `IDLE ;
                              else
                            n_STATE = n_STATE + 1'b1 ;
                              end
            default : begin
                            n_STATE = `IDLE  ;
                        end
        endcase      
    end                                
                                                           
                                          
                      
always @(*)
   begin
      case (p_STATE )
      `IDLE : begin 
                  if (start==1'b1)
                      begin
                       CV = 7'b000_0111; // SEL_MUX =0 , ADD_EN = 1 , LAOD_M = 1 , load_Q = 1 , load_ACC = 0
                       end 
                   else
                       begin
                        CV = 7'b0000_000; ////
                        end 
             end    
       `S1 , `S2, `S3, `S4, `S5, `S6 :  begin
                   if (o_assert_done==1'b1)
                          CV = 7'b1001001 ;
             else              
                   if (({Q, Q_n} == 2'b01) ) ///A <-- A + M , Arithmetic shift right //
                        begin
                         CV = 7'b0010_001; ///ACC arithmetic shift left , A<-- A+M , sel_MUX = 1, Load_ACC = 1 
                          end
                       else if (({Q, Q_n} == 2'b10)) ///A <-- A-M , Arithmetuc shift RIght//
                         begin
                         CV = 7'b0111_001 ; //ACC arithmetic shift_left (ACC, Q_reg } , A<= A-M , SEL_MUX = 1 , ADD_EN = 1,LOAD_ACC =1 , c_enable = 1 //
                           end 
                        else if  (({Q, Q_n} == 2'b00 || 2'b11) )
                           begin
                            CV = 7'b000_0000 ;///Arithmetic shift left //
                          end 
                            else
                               begin
                                  CV = 7'bxxxx_xxx ;
                             end 
                  end 
            default : begin
                           CV = 7'b0000_111;
                            end
                    endcase
        end                                                                                                                                           
endmodule
