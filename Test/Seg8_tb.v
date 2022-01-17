`timescale 1ns/1ns
module Seg8_tb ();
    reg clk,rst_n;
    reg[2:0] sp,fr;
    wire [2:0] po;
    wire[7:0] os,oa;
    wire oc;
    
    
    Seg8 uut(clk,rst_n,sp,fr,os,po,oa,oc);
    
    initial begin
        rst_n=0;
        #100
        rst_n=1;
        sp=3;
        fr=2;
    end
    
    initial begin
        clk = 0;
        repeat(500) begin
            #2 clk = ~clk;
        end
    end
    
endmodule
