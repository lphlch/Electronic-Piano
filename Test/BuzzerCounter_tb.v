`timescale 1ns/1ns
module BuzzerCounter_tb ();
    reg clk,rst_n,counterE;
    wire o;
    
    
    BuzzerCounter uut(clk,rst_n,counterE,o);
    
    initial begin
        rst_n    = 0;
        counterE = 0;
    end
    
    initial begin
        #5
        rst_n    = 1;

        #15
        counterE = 1;
        #100
        counterE = 0;
    end
    
    initial begin
        clk = 0;
        repeat(300) begin
            #2 clk = ~clk;
        end
    end
    
endmodule
