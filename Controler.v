/*Controller, which controls the data actually sent to the buzzer system, controls the selected song, and controls whether to enable the counter.*/
module Controler (input iClk,   //clock
                  input iReset_n,   //reset signal, active low
                  input [7:0] iPs2_Data,    //keyboard data after decoded, if 99, stop playing note after a cycle
                  input [7:0] iSong_Data,   //built-in song data, output to oFreq_Data if songs >0
                  input [2:0] iSongSelect,  //song select signal
                  output [7:0] oFreq_Data,  //frequency data to BuzzerDecoder
                  output reg oCountEnable,  //enable counter when ps2_data output
                  output reg signed [4:0] songs,    //song select signal to built-in song selector
                  output [3:0] oSongSelectSeq   //song select sequence
                  );

    always @(posedge iClk or negedge iReset_n)
    begin
        if (!iReset_n)
        begin
            oCountEnable <= 0;
        end
        else
        begin
            if (iPs2_Data == 99 ||iPs2_Data == 0)   //stop after a cycle
            begin
                oCountEnable <= 0;
            end
            else
            begin
                oCountEnable <= 1;
            end
            
            if (songs != 0)begin
                oCountEnable <= 1;
            end
            
        end
    end
    
    always @(posedge iClk or negedge iReset_n) begin
        if (!iReset_n) begin
            songs <= 0;
        end
        else begin
            if(iSongSelect[0]==1) begin
                songs<=1;
            end
            else if(iSongSelect[1]==1) begin
                songs<=2;
            end
/*             else if(iSongSelect[2]==1) begin
                songs<=4;
            end */
            else begin
                songs<=0;
            end
        end
    end
    
    assign oSongSelectSeq = songs;
    assign oFreq_Data = (songs>0)?iSong_Data:iPs2_Data;
endmodule
