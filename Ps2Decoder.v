/*The keyboard keycode is decoded into the corresponding frequency data of the keyboard keys.*/
module Ps2Decoder(
	input iClk,	//clock
	input iReset_n,	//reset signal, active low
	input iFlag,	//if a valid packet is received
	input [7:0] iData,	//ps2 data received

	output reg [7:0] oData	//freq type
	);

	reg [15:0] temp;
	
	always @ (posedge iClk or negedge iReset_n)
		if(!iReset_n)
			begin
				temp <= 16'd0;
			end
		else
			begin
				if(iFlag)
					begin
						temp = {temp[7:0],iData};   //move 8 bits to the left, adding the new data
					end
				else
					begin
						temp <= temp;
					end
			end
			
	always @ (posedge iClk or negedge iReset_n)
		if(!iReset_n)
			begin
				oData <= 8'b0;
			end
		else
			begin
				casex (temp)
					{8'hf0,8'hxx} : begin oData <=99; end    //when release, stop
					default :case(temp[7:0])
									//F
									8'h05:begin oData <= 33;end //F1
									8'h06:begin oData <= 35;end //F2
									8'h04:begin oData <= 38;end //F3
									8'h0c:begin oData <= 40;end //F4
									8'h03:begin oData <= 42;end //F5
									8'h0b:begin oData <= 45;end //F6
									8'h83:begin oData <= 47;end //F7
									8'h0a:begin oData <= 50;end //F8
									8'h01:begin oData <= 52;end //F9
									8'h09:begin oData <= 54;end //F10
									8'h78:begin oData <= 57;end //F11
									8'h07:begin oData <= 59;end //F12

									//first line
									8'h0e:begin oData <= 29;end //tap
									8'h16:begin oData <= 32;end	//1
									8'h1e:begin oData <= 34;end	//2
									8'h26:begin oData <= 36;end	//3
									8'h25:begin oData <= 37;end	//4
									8'h2e:begin oData <= 39;end	//5
									8'h36:begin oData <= 41;end	//6
									8'h3d:begin oData <= 43;end	//7
									8'h3e:begin oData <= 44;end	//8
									8'h46:begin oData <= 46;end	//9
									8'h45:begin oData <= 48;end	//0
									//8'h4e:begin oData <= 49;end	//-
									//8'h55:begin oData <= 51;end	//=
									8'h66:begin oData <= 54;end	//backspace

									//second line
									8'h0d:begin oData <= 40;end	//tab
									8'h15:begin oData <= 20;end	//q
									8'h1d:begin oData <= 22;end	//w
									8'h24:begin oData <= 24;end	//e
									8'h2d:begin oData <= 25;end	//r
									8'h2c:begin oData <= 27;end	//t
									8'h35:begin oData <= 29;end	//y
									8'h3c:begin oData <= 31;end	//u
									8'h43:begin oData <= 32;end	//i
									8'h44:begin oData <= 34;end	//o
									8'h4d:begin oData <= 36;end	//p
									8'h54:begin oData <= 37;end	//[
									8'h5b:begin oData <= 39;end	//]
									8'h5d:begin oData <= 41;end	//\

									//third line
									8'h58:begin oData <= 28;end	//capslock
									8'h1c:begin oData <= 8;end	//a
									8'h1b:begin oData <= 10;end	//s
									8'h23:begin oData <= 12;end	//d
									8'h2b:begin oData <= 13;end	//f
									8'h34:begin oData <= 15;end	//g
									8'h33:begin oData <= 17;end	//h
									8'h3b:begin oData <= 19;end	//j
									8'h42:begin oData <= 20;end	//k
									8'h4b:begin oData <= 22;end	//l
									8'h4c:begin oData <= 24;end	//;
									8'h52:begin oData <= 25;end	//'

									//fourth line
									8'h12:begin oData <= 23;end	//shift
									8'h1a:begin oData <= 1;end	//z
									8'h22:begin oData <= 2;end	//x
									8'h21:begin oData <= 3;end	//c
									8'h2a:begin oData <= 4;end	//v
									8'h32:begin oData <= 5;end	//b
									8'h31:begin oData <= 6;end	//n
									8'h3a:begin oData <= 7;end	//m
									8'h41:begin oData <= 8;end	//,
									8'h49:begin oData <= 10;end	//.
									//8'h4a:begin oData <= 12;end	///

									//fifth line
									8'h14:begin oData <= 30;end	//ctrl
									8'h1f:begin oData <= 18;end	//win
									8'h11:begin oData <= 16;end	//alt
									8'h29:begin oData <= 16;end	//space

									//6 Mid Control
									8'h71:begin oData <= 56;end //del
									8'h69:begin oData <= 58;end //end
									8'h7a:begin oData <= 60;end //pgdn
									8'h70:begin oData <= 61;end //ins
									8'h6c:begin oData <= 63;end //home
									//8'h7d:begin oData <= 65;end   //pgup

									//small
									8'h75:begin oData <= 44;end //8
									8'h7d:begin oData <= 46;end //9
									8'h79:begin oData <= 48;end //+
									8'h77:begin oData <= 49;end //num
									8'h4a:begin oData <= 51;end // /
									8'h7c:begin oData <= 53;end //*
									8'h7b:begin oData <= 55;end //-

									//3 right top
									//8'h7c:begin oData <= 56;end //printscreen
									8'h7e:begin oData <= 52;end //scrolllock
									//8'h7f:begin oData <= 60;end //pause

									8'he0:begin oData <= oData;end  //ignore E0
									default:begin oData <= 8'b0; end	//not defined
								endcase
				endcase
			end

endmodule 