/*Receive input signals from the keyboard and convert them into key codes.*/
module Ps2Input(input iClk, //clock
                input iReset_n, //reset signal, active low
                input iPs2_Clk, //ps2 clock
                input iPs2_Data,    //data from ps2
                output reg oFlag,   //if a packet is ready
                output [7:0] oData  //key code data
                );
    
    wire  isNegative;
    
    reg	[1:0] sign;
    always @ (posedge iClk or negedge iReset_n) begin
        if (!iReset_n)
        begin
            sign <= 2'b11;
        end
        else
        begin
            sign[0] <= iPs2_Clk;
            sign[1] <= sign[0];
        end
    end
    assign isNegative = ~sign[0] && sign[1];
    
    reg [3:0] count;
    reg [10:0] temp;
    
    assign oData = temp[8:1];
    
    always @ (posedge iClk or negedge iReset_n) begin
        if (!iReset_n)
        begin
            count <= 4'd0;
            oFlag <= 1'b0;
            temp  <= 11'd0;
        end
        else
        begin
            if (isNegative && count < 11)
            begin
                count       <= count + 1'd1;
                temp[count] <= iPs2_Data;
            end
            else
            begin
                if (count == 11)
                begin
                    count <= 4'd0;
                    oFlag <= 1'b1;
                end
                else
                begin
                    oFlag <= 1'b0;
                end
            end
        end
        
    end
    
endmodule
