/*Realize the conversion of frequency serial number to actual frequency.*/
module BuzzerDecoder (input iClk,   //clock
                      input iReset_n,   //reset signal, active low
                      input [7:0]iFreqType, //frequency type of the buzzer, 79 in total,1^-3 - 7^3, main 49keys , half 35keys
                      output [12:0]oFreq    //real frequency of the buzzer
                      );

    reg [12:0]frequency;
    always @(posedge iClk) begin  // choose the frequency
        
        if (!iReset_n) begin
            frequency <= 0;
        end
        else begin
            case (iFreqType)
            0:  // not defined
            frequency <= frequency;

            1:   // C1 33   1^-3
            frequency <= 1000000/33;
            2:   // D1 37
            frequency <= 1000000/37;
            3:   // E1 41
            frequency <= 1000000/41;
            4:   // F1 44
            frequency <= 1000000/44;
            5:   // G1 49
            frequency <= 1000000/49;
            6:   // A1 55   6^-3
            frequency <= 1000000/55;
            7:   // B1 62
            frequency <= 1000000/62;
            8:   // C2 65   1^-2
            frequency <= 1000000/65;
            9:   // C#2 69
            frequency <= 1000000/69;
            10:  // D2 73
            frequency <= 1000000/73;
            11:  // D#2 78
            frequency <= 1000000/78;
            12:  // E2 82
            frequency <= 1000000/82;
            13:  // F2 87
            frequency <= 1000000/87;
            14:  // F#2 92
            frequency <= 1000000/92;
            15:  // G2 98
            frequency <= 1000000/98;
            16:  // G#2 104
            frequency <= 1000000/104;
            17:  // A2 110  6^-2
            frequency <= 1000000/110;
            18:  // A#2 117
            frequency <= 1000000/117;
            19:  // B2 123
            frequency <= 1000000/123;
            20:  // C3 130  1^-1
            frequency <= 1000000/130;
            21:  // C#3 138
            frequency <= 1000000/138;
            22:  // D3 146
            frequency <= 1000000/146;
            23:  // D#3 155
            frequency <= 1000000/155;
            24:  // E3 164
            frequency <= 1000000/164;
            25:  // F3 174  4^-1
            frequency <= 1000000/174;
            26:  // F#3 185
            frequency <= 1000000/185;
            27:  // G3 196
            frequency <= 1000000/196;
            28:  // G#3 207
            frequency <= 1000000/207;
            29:  // A3 220   6^-1
            frequency <= 1000000/220;
            30: // A#3 233
            frequency <= 1000000/233;
            31: // B3 246
            frequency <= 1000000/246;
            32: // C4 261   1
            frequency <= 1000000/261;
            33: // C#4 277
            frequency <= 1000000/277;
            34: // D4 293
            frequency <= 1000000/293;
            35: // D#4 311
            frequency <= 1000000/311;
            36: // E4 329
            frequency <= 1000000/329;
            37: // F4 349
            frequency <= 1000000/349;
            38: // F#4 370
            frequency <= 1000000/370;
            39: // G4 392
            frequency <= 1000000/392;
            40: // G#4 415
            frequency <= 1000000/415;
            41: // A4 440   MAIN FREQUENCY 6
            frequency <= 1000000/440;
            42: // A#4 466
            frequency <= 1000000/466;
            43: // B4 494
            frequency <= 1000000/494;
            44: // C5 523   1^1
            frequency <= 1000000/523;
            45: // C#5 554
            frequency <= 1000000/554;
            46: // D5 587   2^1
            frequency <= 1000000/587;
            47: // D#5 622
            frequency <= 1000000/622;
            48: // E5 659   3^1
            frequency <= 1000000/659;
            49: // F5 698   4^1
            frequency <= 1000000/698;
            50: // F#5 740
            frequency <= 1000000/740;
            51: // G5 784   5^1
            frequency <= 1000000/784;
            52: // G#5 831
            frequency <= 1000000/831;
            53: // A5 880   6^1
            frequency <= 1000000/880;
            54: // A#5 932
            frequency <= 1000000/932;
            55: // B5 988   7^1
            frequency <= 1000000/988;
            56: // C6 1047  1^2
            frequency <= 1000000/1047;
            57: // C#6 1109
            frequency <= 1000000/1109;
            58: // D6 1175  2^2
            frequency <= 1000000/1175;
            59: // D#6 1245
            frequency <= 1000000/1245;
            60: // E6 1319  3^2
            frequency <= 1000000/1319;
            61: // F6 1397  4^2
            frequency <= 1000000/1397;
            62: // F#6 1480
            frequency <= 1000000/1480;
            63: // G6 1568
            frequency <= 1000000/1568;
            64: // G#6 1661
            frequency <= 1000000/1661;
            65: // A6 1760  6^2
            frequency <= 1000000/1760;
            66: // A#6 1865
            frequency <= 1000000/1865;
            67: // B6 1976
            frequency <= 1000000/1976;
            68: // C7 2093  1^3
            frequency <= 1000000/2093;
            69: // C#7 2217
            frequency <= 1000000/2217;
            70: // D7 2349
            frequency <= 1000000/2349;
            71: // D#7 2489
            frequency <= 1000000/2489;
            72: // E7 2637
            frequency <= 1000000/2637;
            73: // F7 2794
            frequency <= 1000000/2794;
            74: // F#7 2960
            frequency <= 1000000/2960;
            75: // G7 3136
            frequency <= 1000000/3136;
            76: // G#7 3322
            frequency <= 1000000/3322;
            77: // A7 3520  6^3
            frequency <= 1000000/3520;
            78: // A#7 3729
            frequency <= 1000000/3729;
            79: // B7 3951  7^3
            frequency <= 1000000/3951;
            
            99: // stop
            frequency <= frequency;
            default:
            frequency <= 0;
            endcase
        end
    end
    
    assign oFreq = frequency;
endmodule
    
    