module Lights (input iClk,
               input iReset_n,
               input[7:0] iEnable,
               output reg oLights
               );
    
    always @(posedge iClk) begin
        if (!iReset_n)
        begin
            oLights <= 0;
        end
        else
        begin
            oLights <= (iEnable==0 || iEnable==99)? 0 : 1;
        end
    end
endmodule

/*Display power supply, buzzer, and song selection status.*/
module Lights2 (input iClk, //clock
               input iReset_n,  //reset signal, active low
               input iEnable,   //enable signal
               output reg oLights   //connected to lights
               );
    
    always @(posedge iClk) begin
        if (!iReset_n)
        begin
            oLights <= 0;
        end
        else
        begin
            oLights <= (iEnable==0)? 0 : 1;
        end
    end
endmodule

module Lights3 (input iClk,
               input iReset_n,
               input [12:0]iEnable,
               output reg oLights
               );
    
    always @(posedge iClk) begin
        if (!iReset_n)
        begin
            oLights <= 0;
        end
        else
        begin
            oLights <= (iEnable==0)? 0 : 1;
        end
    end
endmodule