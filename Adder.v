`timescale 1ns/1ps

module Adder(
    input [3:0] Ones_Counter,
    input [5:0] X10,
    output [5:0] Adder_Out
    );

assign Adder_Out = Ones_Counter + X10;
  
endmodule