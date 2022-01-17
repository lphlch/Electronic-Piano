/*Provides buzzer duration count and buzzer control.*/
module BuzzerCounter (input iClk,   //clock
                      input iReset_n,   //reset signal, active low
                      input iCountEnable,   //if 0, start counting after a cycle
                      output reg oRing//if 1, note is able to play. Default to play 0.15s. 0 to stop playing
                      );
    
    parameter i = 150000;   //0.15s
    reg[20:0] count;
    always @(posedge iClk) //counter, sound lasting 0.15s in default
    begin
        if (!iReset_n)
        begin   //reset
            count <= 0;
            oRing <= 0;
        end
        else
        begin
             if (iCountEnable) //always 1
            begin
                count <= 1;
                oRing <= 1;
            end
            else    //stop after a cycle
            begin 
                if (count == i) begin   //count to 0.15s
                    count <= 0;
                    oRing <= 0;
                end
                else begin
                    if (count != 0) begin   //continue counting
                        count <= count + 1;
                        oRing <= 1;
                    end
                end
            end
            
        end
        
    end
    
endmodule
