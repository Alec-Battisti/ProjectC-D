`timescale 1ns / 1ps

module Clock_Divider(                   //Sends 381 Hz
    input Clk, Reset,
    output Slow_Clk
    );
  
  reg [17:0] count;
  
  always @(posedge Reset,posedge Clk )
  begin
  if(Reset)
  count <= 17'b0;
  else
  count <= count + 1'b1;
  end
   
   assign Slow_Clk = count[17]; 
endmodule

module Clock_Divider2(          //Sends 1Hz
    input Clk, Reset,
    output reg Slow_Clock
    );
    
    localparam const = 50000000;
    
    reg [31:0] counter;
    
    always@(posedge(Clk),posedge(Reset))
    begin
        if(Reset)
            counter <= 32'b0;
        else if(counter == const - 1)
            counter <= 32'b0;
        else
            counter <= counter + 1;
        end
        
    always@(posedge(Clk),posedge(Reset))
    begin
        if(Reset)
            Slow_Clock <= 1'b0;
        else if(counter == const - 1)
            Slow_Clock <= ~Slow_Clock;
        else
            Slow_Clock <= Slow_Clock;
        end
endmodule
