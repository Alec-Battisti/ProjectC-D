`timescale 1ns / 1ps

module Bin_7Segment(
    input [3:0] Bin,
    output reg [7:0] Seven_Segment
    );
    always@ *
        case(Bin)
        4'b0000: Seven_Segment = 8'hC0; //0
        4'b0001: Seven_Segment = 8'hF9; //1
        4'b0010: Seven_Segment = 8'hA4; //2
        4'b0011: Seven_Segment = 8'hB0; //3
        4'b0100: Seven_Segment = 8'h99; //4
        4'b0101: Seven_Segment = 8'h92; //5
        4'b0110: Seven_Segment = 8'h82; //6
        4'b0111: Seven_Segment = 8'hF8; //7
        4'b1000: Seven_Segment = 8'h80; //8
        4'b1001: Seven_Segment = 8'h98; //9
        4'b1010: Seven_Segment = 8'h88; //10
        4'b1011: Seven_Segment = 8'h83; //11
        4'b1100: Seven_Segment = 8'hC6; //12
        4'b1101: Seven_Segment = 8'hA1; //13
        4'b1110: Seven_Segment = 8'h86; //14
        4'b1111: Seven_Segment = 8'h8E; //15
        default: Seven_Segment = 8'hC0;
        endcase
endmodule