`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2022 05:36:05 PM
// Design Name: 
// Module Name: Test_Top_design
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


module Test_Top_design();
reg i_clk ;
reg start ;
reg i_rst_n ;
reg [4:0] op_1 ;
reg [3:0] op_2 ;
wire [4:0] o_Q_out , o_ACC_out ;
reg [7:0] o_result=0  ;
wire C_o ;


///instantiation of Top design module //
 Top_design DUT(
i_clk , 
start , 
i_rst_n , 
op_1 , 
op_2 , 
o_Q_out , 
o_ACC_out ,
o_assert_done  
,C_o );
   
 initial
   begin
    i_clk = 1'b0; 
     i_rst_n = 1'b0;
      start = 1'b0; 
      op_1 = 5'b11000; ///-8
      op_2 = 4'b1011;   ///-7
    
        end
        
        
       always #5 i_clk = ~i_clk ; 
        
        
        initial
           begin
            #3 i_rst_n = 1'b1;
            #2 start = 1'b1 ;

           // #3 op_1 = 4'b0011;
            //#2 op_2 = 4'b0111;
            #100 $stop ;
            end 
      integer i ;      
    initial
       begin
         for (i = 0; i<40; i= i+1)
           begin
           @(posedge i_clk)
          #5 o_result = { o_ACC_out[3:0] , o_Q_out[4:1]} ;
         end 
       end 
endmodule
