module Divider(input iClk,  //orignal clock
             input iReset_n,    //reset signal, active low
             output reg oClk    //divided clock
             );
    
    reg [4:0] count;
    
    always @(posedge iClk or negedge iReset_n)
        if (!iReset_n)
        begin
            count  <= 0;
            oClk <= 1;
        end
        else
        begin
            if (count == 25 - 1)
            begin
                count  <= 0;
                oClk <= ~oClk;
            end
            else
            begin
                count <= count + 1;
            end
        end
    
endmodule
