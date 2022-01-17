`timescale 1ns/1ns
module OnlyMyRailGun_tb ();
    reg clk,rst_n,counterE;
    reg[1:0] pro;
    reg[2:0] speed,freq;
    wire[7:0] op,of;
    
    
    OnlyMyRailGun uut(clk,rst_n,counterE,pro,speed,freq,op,of);
    
    initial begin
        rst_n = 0;
        pro   = 0;
        speed = 4;
        freq  = 4;
        counterE=0;
    end
    
    initial begin
        #5
        rst_n = 1;
        #5
        counterE=1;
        
    end
    
    initial begin
        clk = 0;
        repeat(300) begin
            #2 clk = ~clk;
        end
    end
    
endmodule
