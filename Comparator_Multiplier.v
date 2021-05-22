`timescale 1ns / 1ps



module comparator(
    input [5:0] Comp_A,Comp_B,
    output CompO
    );
    assign CompO = (Comp_A == Comp_B) ? 1'b1 : 1'b0;
endmodule

module mult_ten(
    input [3:0] in,
    output [5:0] out
    );
    wire [5:0] xIn;
    assign xIn = {2'b00,in};
    assign out = (xIn <<< 3) + (xIn <<< 1);
endmodule
