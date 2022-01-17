`timescale 1ns/1ns
module Controler_tb ();
    reg clk,rst_n;
    reg [7:0] psData,sData;
    reg [1:0] ss;
    wire [7:0] oD;
    wire oC;
    wire [3:0] oS;
    wire signed [4:0] oSigned;
    
    
    Controler uut(clk,rst_n,psData,sData,ss,oD,oC,oSigned,oS);
    
    initial begin
        rst_n    = 0;
        psData=0;
        sData=0;
        ss=0;
    end
    
    initial begin
        #10
        rst_n    = 1;

        #10
        psData=10;
        sData=20;
        ss=0;
        #50
        ss=2'b01;
        #50
        ss=2'b00;
        #50
        ss=2'b10;
        #50
        ss=2'b00;
        #50
        ss=2'b10;
        #50
        ss=2'b00;
    end
    
    initial begin
        clk = 0;
        repeat(500) begin
            #2 clk = ~clk;
        end
    end
    
endmodule
