module Selector (input iClk,    //clock
                 input iReset_n,    //reset signal, active low
                 input [7:0]iData1, //data1
                 input [7:0]iData2, //data2
                 input [7:0]iData3, //data3
                 
                 input [3:0] iAddress,  //address
                 output reg [7:0]oData  //output data
                 );

    always @(posedge iClk or negedge iReset_n) begin
        if (!iReset_n) begin
            oData <= 0;
        end
        else begin
            case(iAddress)
                1: oData       <= iData1;
                2: oData       <= iData2;
                4: oData       <= iData3;
                default: oData <= 0;
            endcase
        end
    end
    
endmodule
