/*Vibrate the buzzer according to the input frequency.*/
module NotePlayer (input iClk,  //clock
                   input iReset_n,  //reset signal, active low
                   input iRing, //if able to ring
                   input[12:0] iFreq,   //real frequency of the note
                   output reg oNote //to audio output
                   );
    
    reg [20:0] cnt;
    always @ (posedge iClk)
    begin
        if (!iReset_n)
        begin
            cnt   <= 1;
            oNote <= 0;
        end
        else
        begin
            if (iRing == 0)    //unable to ring
            begin
                cnt   <= 1;
                oNote <= 0;
            end
            else if (cnt < iFreq)    //freq control
            begin
                cnt <= cnt + 1;
            end
            else
            begin
                cnt   <= 1;
                oNote <= ~oNote;
            end
        end
    end
endmodule
