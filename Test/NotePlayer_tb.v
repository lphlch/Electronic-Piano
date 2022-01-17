`timescale 1ns/1ns
module NotePlayer_tb ();
    reg clk,rst_n,ring;
    reg [12:0] freq;
    wire o;
    
    
    NotePlayer uut(clk,rst_n,ring,freq,o);
    
    initial begin
        rst_n    = 0;
        ring = 0;
        freq=0;
    end
    
    initial begin
        #10
        rst_n    = 1;

        #10
        freq=10;
        #6
        ring = 1;
        #300
        ring = 0;
    end
    
    initial begin
        clk = 0;
        repeat(500) begin
            #2 clk = ~clk;
        end
    end
    
endmodule
