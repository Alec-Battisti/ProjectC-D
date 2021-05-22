`timescale 1ns / 1ps

module Top(
    input Clk, Reset,
    output [7:0] Anode,
    output [7:0] Display
);
    wire [1:0] An_t;
    wire First_Counter_Output;                       //Connects the Ones counter to Tens_Counter
    wire [3:0] Ones_Counter_Out, Tens_Counter_Out;   //Connects the output of the counters to
                                                     // the input of 2-to-1 Mux
    wire [3:0] Mux_Output;
    wire Clock_381Hz;                                //Output from Clock_Divider
    wire Clock_1Hz;                                  //Output from Clock_Divider2 
    wire [7:0]Display_7Segment;                      //Will connect Bin_7Segment to 7 segment device

    wire Sum_Output;
    wire Mult10_Out;
    wire Comparator_Out;
    wire N_Clk2;

    assign N_Clk2 = ~(Clock_1Hz|Comparator_Out); 

    Clock_Divider  (.Clk(Clk), .Reset(Reset), .Slow_Clk(Clock_381Hz));
    Clock_Divider2  (.Clk(Clk), .Reset(Reset), .Slow_Clock(Clock_1Hz));
    
    First_Counter (.Clk(N_Clk2),.Reset(Reset),
                  .Q(First_Counter_Output),.Display_One(Ones_Counter_Out));
    Second_Counter (.Clk(First_Counter_Output),.Reset(Reset),
                   .Display_Ten(Tens_Counter_Out));

    Mux_Two_to_One(.Number_Display(Mux_Output), .Ones_Counter(Ones_Counter_Out),
                   .Tens_Counter(Tens_Counter_Out), .Select(Clock_381Hz));
    
    Adder (.Adder_Out(Sum_Output), .Ones_Counter(Ones_Counter_Out), .X10(Mult10_Out));

    comparator(.Comp_A(Sum_Output),.Comp_B(), .CompO(Comparator_Out));

    mult_ten(.in(Tens_Counter_Out), .out(Mult10_Out));

    Bin_7Segment (.Bin(Mux_Output), .Seven_Segment(Display_7Segment));      //Connects to the Anodes 

    Decoder (.D_in(Clock_381Hz), .D_out(An_t));                           // Will connect to the Anodes

     assign Anode = {6'b111111,An_t};       //Activates only the 2 farthest right 7-segment, 1=Turns off , 0= Turns on
     assign Display = Display_7Segment;
endmodule