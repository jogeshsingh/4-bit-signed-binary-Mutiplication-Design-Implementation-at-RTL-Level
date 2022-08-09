2's-Complement-4-bit-Multiplier-Design-at-RTL-Level


#RTL View

![RTL_booths2's](https://user-images.githubusercontent.com/98607828/183563213-75c4768c-66a3-4baf-a156-3e5d30952dd6.jpg)
![RTL_sch_BOOTHs](https://user-images.githubusercontent.com/98607828/183563328-5489396c-2bed-4986-8554-c8acce8ef1db.jpg)

#Simulation
Below is the simulation result in which op_1 { Multiplicand_M (11000 --> -8) )} and op_2 {(Mutiplier_Q (1011 ---> -5)} , here 1011(Q_reg {aka: multiplier} is appended with 0 on lsb side which would be used to compare the required operation {along with Q[1]  as Q[1]Q[0]} . The Required result is obtained after approximately 6 clock cycles which is (-8) * (-5) = 40   
![Sim_booths_2's](https://user-images.githubusercontent.com/98607828/183563357-12ae7c5d-72dd-45cc-89cb-98437f696362.jpg)
