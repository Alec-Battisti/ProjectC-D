`timescale 1ns / 1ps


module Mux_Two_to_One(
    input [3:0] Ones_Counter, //Comes from First Counter
    input [3:0] Tens_Counter, //Comes from Second Counter
    input Select,             //Determined by Clock Divider that sends 381Hz
    output [3:0] Number_Display
);

//reg data_out;

assign Number_Display = (Select==0) ? Ones_Counter:Tens_Counter;  //If 'Select' = 0 then 'Ones_Counter' is selected
                                                                  // else 'Tens_Counter' is selected


endmodule