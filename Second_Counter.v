`timescale 1ns / 1ps

module Second_Counter(
    input Clk, Reset,
    output Q,      //'Q' connects to the GND
    output [3:0] Display_Ten
    );
    
  // Make sure your Counter is driven by  slow clock generated by clock divider
reg[3:0] Present_State, Next_State;

parameter S0 = 4'b0000;  //Decimal Value = 0
parameter S1 = 4'b0001;  //Decimal Value = 1
parameter S2 = 4'b0010;  //Decimal Value = 2
parameter S3 = 4'b0011;  //Decimal Value = 3
parameter S4 = 4'b0100;  //Decimal Value = 4
parameter S5 = 4'b0101;  //Decimal Value = 5  
parameter S6 = 4'b0110;  //Decimal Value = 6
parameter S7 = 4'b0111;  //Decimal Value = 7
parameter S8 = 4'b1000;  //Decimal Value = 8
parameter S9 = 4'b1001;  //Decimal Value = 9
 
always @(posedge Clk, posedge Reset)
    if(Reset)
        Present_State = S0;           //If 'Reset' = Positive Edge, then
                                    // 'Present_State' = 0000 start from the beginning
    else 
        Present_State = Next_State; //Else, continue to increment (count)    
    
always@(*)              //Takes all inputs and watches if they change
    case(Present_State) //This is where the pattern begins
    S0: Next_State = S1;    // Transitions from 0 -> 1
    S1: Next_State = S2;    // Transitions from 1 -> 2
    S2: Next_State = S3;    // Transitions from 2 -> 3
    S3: Next_State = S4;    // Transitions from 3 -> 4
    S4: Next_State = S5;    // Transitions from 4 -> 5
    S5: Next_State = S6;    // Transitions from 5 -> 6
    S6: Next_State = S7;    // Transitions from 6 -> 7
    S7: Next_State = S8;    // Transitions from 7 -> 8
    S8: Next_State = S9;    // Transitions from 8 -> 9
    S9: Next_State = S0;    // Transitions from 9 -> 0
    
    default: Next_State = S0;   //Stops errors from occuring 
endcase

//assign Q = ;   // Connects to ground
                                              // (Number of bits)'b(Define Value)
                                              // (b) stands for binary
assign Display_Ten = Present_State[3:0]; //Displays number on 7-Segment    
    
endmodule
