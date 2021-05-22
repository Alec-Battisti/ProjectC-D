`timescale 1ns / 1ps


module Decoder(
    input D_in,
    output [1:0] D_out
    );
    assign D_out[0] = D_in;
    assign D_out[1] = ~D_in;
endmodule

