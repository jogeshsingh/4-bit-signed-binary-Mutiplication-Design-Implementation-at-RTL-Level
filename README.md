# Algorithm Chart
 
 This Project is the Implementation of Booth's algorithm for 4 bit signed multiplicantion at Register Tranfer Logic Level.
 
![booths-algorithm](https://user-images.githubusercontent.com/98607828/183565360-f9a43600-16f3-4991-b5dc-6f00ab01c614.jpg)

# RTL View

![RTL_booths2's](https://user-images.githubusercontent.com/98607828/183563213-75c4768c-66a3-4baf-a156-3e5d30952dd6.jpg)
![RTL_sch_BOOTHs](https://user-images.githubusercontent.com/98607828/183563328-5489396c-2bed-4986-8554-c8acce8ef1db.jpg)


 # Simulation
    
  Below is the simulation result in which op_1 { Multiplicand_M (11000 --> -8) )} and op_2 {(Mutiplier_Q (1011 ---> -5)} ,
     here 1011(Q_reg {aka: multiplier} is      appended with 0 on lsb side which would be used to compare the required operation
     {along with Q[1]  as Q[1]Q[0]} . The Required result is obtained after approximately 6 clock cycles which is (-8) * (-5) = 40   
      This design works for all the other input test cases well when applied.
         
![sim_booth](https://user-images.githubusercontent.com/98607828/183564666-dc7025d2-268d-422a-8719-df8545812862.jpg)

