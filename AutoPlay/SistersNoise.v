module SistersNoise (input iClk,
                      input iReset_n,
                      input iEnable,
                      input [1:0] iControl_Progress,
                      input [2:0] iControl_Speed,
                      input [2:0] iControl_Freq,
                      output reg [7:0] oProgress,
                      output reg [7:0] oFreq);

parameter default_notes_speed = 144*4*4;    //notes every minutes = meter speed * notes per meter
parameter notes_total         = 550;
reg signed [20:0] note,count,notes_speed;
reg [7:0] freq;
reg signed [4:0] notes_offset;

always @(iControl_Speed) begin  //0.25 ~ 3 X speed
    if (!iReset_n || !iEnable) begin
        notes_speed <= default_notes_speed;
    end
    else begin
        case (iControl_Speed)
            1: notes_speed       <= default_notes_speed*0.25;
            2: notes_speed       <= default_notes_speed*0.5;
            3: notes_speed       <= default_notes_speed*0.75;
            4: notes_speed       <= default_notes_speed;
            5: notes_speed       <= default_notes_speed*1.5;
            6: notes_speed       <= default_notes_speed*2;
            7: notes_speed       <= default_notes_speed*3;
            default: notes_speed <= default_notes_speed;
        endcase
    end
end

always @(iControl_Freq) begin   //-3 ~ +3 Freq
    if (!iReset_n || !iEnable) begin
        oFreq <= 0;
    end
    else begin
        case (iControl_Freq)
            1: oFreq       <= freq-3;
            2: oFreq       <= freq-2;
            3: oFreq       <= freq-1;
            4: oFreq       <= freq;
            5: oFreq       <= freq+1;
            6: oFreq       <= freq+2;
            7: oFreq       <= freq+3;
            default: oFreq <= freq;
        endcase
    end
    
end

always @(iControl_Progress) begin   // +5 -5 notes
    if (!iReset_n || !iEnable) begin
        notes_offset <= 0;
    end
    else begin
        case (iControl_Progress)
            2'b00: notes_offset   <= 0;
            2'b01: notes_offset   <= 5;
            2'b10: notes_offset   <= -5;
            default: notes_offset <= 0;
        endcase
    end
end

always @(posedge iClk or negedge iReset_n) begin
    
    if (!iReset_n) begin
        freq      <= 0;
        note      <= 0;
        count     <= 0;
        oProgress <= 0;
    end
    else begin
        if (iEnable) begin
            if (count == 60*3810000/notes_speed) begin   //count to 0.15s
                count <= 0;
                note  <= note+1+notes_offset;
            end
            else begin
                count <= count+1;
            end
            
            if (note >= notes_total || note<0) begin
                note <= 0;
            end
            
            case (note)
                0: freq  <= 44;
                1: freq  <= 44;
                2: freq  <= 44;
                3: freq  <= 44;
                4: freq  <= 44;
                5: freq  <= 100;
                6: freq  <= 44;
                7: freq  <= 44;
                8: freq  <= 44;
                9: freq  <= 44;
                10: freq <= 44;
                11: freq <= 100;
                12: freq <= 44;
                13: freq <= 44;
                14: freq <= 44;
                15: freq <= 44;
                16: freq <= 44;
                17: freq <= 100;
                18: freq <= 44;
                19: freq <= 44;
                20: freq <= 44;
                21: freq <= 100;
                22: freq <= 32;
                23: freq <= 100;
                24: freq <= 44;
                25: freq <= 44;
                26: freq <= 44;
                27: freq <= 100;
                28: freq <= 43;
                29: freq <= 43;
                30: freq <= 43;
                31: freq <= 100;
                //
                32: freq <= 44;
                33: freq <= 44;
                34: freq <= 44;
                35: freq <= 44;
                36: freq <= 44;
                37: freq <= 100;
                38: freq <= 44;
                39: freq <= 44;
                40: freq <= 44;
                41: freq <= 44;
                42: freq <= 44;
                43: freq <= 100;
                44: freq <= 44;
                45: freq <= 44;
                46: freq <= 44;
                47: freq <= 44;
                48: freq <= 44;
                49: freq <= 100;
                50: freq <= 44;
                51: freq <= 44;
                52: freq <= 44;
                53: freq <= 44;
                54: freq <= 44;
                55: freq <= 100;
                56: freq <= 43;
                57: freq <= 43;
                58: freq <= 43;
                59: freq <= 100;
                60: freq <= 42;
                61: freq <= 42;
                62: freq <= 42;
                63: freq <= 100;
                //
                64: freq <= 41;
                65: freq <= 41;
                66: freq <= 41;
                67: freq <= 41;
                68: freq <= 41;
                69: freq <= 100;
                70: freq <= 41;
                71: freq <= 41;
                72: freq <= 41;
                73: freq <= 41;
                74: freq <= 41;
                75: freq <= 100;
                76: freq <= 41;
                77: freq <= 41;
                78: freq <= 41;
                79: freq <= 41;
                80: freq <= 41;
                81: freq <= 100;
                82: freq <= 41;
                83: freq <= 41;
                84: freq <= 41;
                85: freq <= 100;
                86: freq <= 41;
                87: freq <= 100;
                88: freq <= 41;
                89: freq <= 41;
                90: freq <= 41;
                91: freq <= 100;
                92: freq <= 39;
                93: freq <= 39;
                94: freq <= 39;
                95: freq <= 100;
                //
                96: freq  <= 41;
                97: freq  <= 41;
                98: freq  <= 41;
                99: freq  <= 41;
                100: freq <= 41;
                101: freq <= 100;
                102: freq <= 41;
                103: freq <= 41;
                104: freq <= 41;
                105: freq <= 41;
                106: freq <= 41;
                107: freq <= 100;
                108: freq <= 41;
                109: freq <= 41;
                110: freq <= 41;
                111: freq <= 41;
                112: freq <= 41;
                113: freq <= 100;
                114: freq <= 41;
                115: freq <= 41;
                116: freq <= 41;
                117: freq <= 41;
                118: freq <= 41;
                119: freq <= 100;
                120: freq <= 43;
                121: freq <= 43;
                122: freq <= 43;
                123: freq <= 100;
                124: freq <= 43;
                125: freq <= 43;
                126: freq <= 43;
                127: freq <= 100;
                //
                128: freq <= 56;
                129: freq <= 56;
                130: freq <= 56;
                131: freq <= 56;
                132: freq <= 56;
                133: freq <= 100;
                134: freq <= 56;
                135: freq <= 56;
                136: freq <= 56;
                137: freq <= 56;
                138: freq <= 56;
                139: freq <= 100;
                140: freq <= 56;
                141: freq <= 56;
                142: freq <= 56;
                143: freq <= 56;
                144: freq <= 56;
                145: freq <= 100;
                146: freq <= 56;
                147: freq <= 56;
                148: freq <= 56;
                149: freq <= 56;
                150: freq <= 56;
                151: freq <= 100;
                152: freq <= 56;
                153: freq <= 56;
                154: freq <= 56;
                155: freq <= 100;
                156: freq <= 55;
                157: freq <= 55;
                158: freq <= 55;
                159: freq <= 100;
                //
                160: freq <= 56;
                161: freq <= 56;
                162: freq <= 56;
                163: freq <= 56;
                164: freq <= 56;
                165: freq <= 100;
                166: freq <= 56;
                167: freq <= 56;
                168: freq <= 56;
                169: freq <= 56;
                170: freq <= 56;
                171: freq <= 100;
                172: freq <= 56;
                173: freq <= 56;
                174: freq <= 56;
                175: freq <= 56;
                176: freq <= 56;
                177: freq <= 100;
                178: freq <= 60;
                179: freq <= 60;
                180: freq <= 60;
                181: freq <= 60;
                182: freq <= 60;
                183: freq <= 100;
                184: freq <= 60;
                185: freq <= 60;
                186: freq <= 60;
                187: freq <= 100;
                188: freq <= 60;
                189: freq <= 60;
                190: freq <= 60;
                191: freq <= 100;
                //
                192: freq <= 61;
                193: freq <= 61;
                194: freq <= 61;
                195: freq <= 61;
                196: freq <= 61;
                197: freq <= 100;
                198: freq <= 53;
                199: freq <= 53;
                200: freq <= 53;
                201: freq <= 53;
                202: freq <= 53;
                203: freq <= 100;
                204: freq <= 53;
                205: freq <= 53;
                206: freq <= 53;
                207: freq <= 53;
                208: freq <= 53;
                209: freq <= 100;
                210: freq <= 53;
                211: freq <= 53;
                212: freq <= 53;
                213: freq <= 53;
                214: freq <= 53;
                215: freq <= 100;
                216: freq <= 61;
                217: freq <= 100;
                218: freq <= 53;
                219: freq <= 100;
                220: freq <= 56;
                221: freq <= 100;
                222: freq <= 61;
                223: freq <= 100;
                //
                224: freq <= 51;
                225: freq <= 51;
                226: freq <= 51;
                227: freq <= 51;
                228: freq <= 51;
                229: freq <= 100;
                230: freq <= 39;
                231: freq <= 39;
                232: freq <= 39;
                233: freq <= 39;
                234: freq <= 39;
                235: freq <= 100;
                236: freq <= 100;
                237: freq <= 100;
                238: freq <= 100;
                239: freq <= 100;
                240: freq <= 100;
                241: freq <= 100;
                242: freq <= 44;
                243: freq <= 100;
                244: freq <= 46;
                245: freq <= 100;
                246: freq <= 48;
                247: freq <= 100;
                248: freq <= 49;
                249: freq <= 100;
                250: freq <= 51;
                251: freq <= 100;
                252: freq <= 53;
                253: freq <= 100;
                254: freq <= 55;
                255: freq <= 100;
                //
                256: freq <= 56;
                257: freq <= 56;
                258: freq <= 56;
                259: freq <= 56;
                260: freq <= 56;
                261: freq <= 56;
                262: freq <= 56;
                263: freq <= 100;
                264: freq <= 56;
                265: freq <= 56;
                266: freq <= 56;
                267: freq <= 100;
                268: freq <= 55;
                269: freq <= 100;
                270: freq <= 56;
                271: freq <= 56;
                272: freq <= 56;
                273: freq <= 56;
                274: freq <= 56;
                275: freq <= 100;
                276: freq <= 58;
                277: freq <= 58;
                278: freq <= 58;
                279: freq <= 100;
                280: freq <= 60;
                281: freq <= 60;
                282: freq <= 60;
                283: freq <= 100;
                284: freq <= 61;
                285: freq <= 61;
                286: freq <= 61;
                287: freq <= 100;
                //
                288: freq <= 60;
                289: freq <= 60;
                290: freq <= 60;
                291: freq <= 60;
                292: freq <= 60;
                293: freq <= 100;
                294: freq <= 60;
                295: freq <= 60;
                296: freq <= 60;
                297: freq <= 60;
                298: freq <= 60;
                299: freq <= 100;
                300: freq <= 55;
                301: freq <= 55;
                302: freq <= 55;
                303: freq <= 100;
                304: freq <= 55;
                305: freq <= 55;
                306: freq <= 55;
                307: freq <= 100;
                308: freq <= 67;
                309: freq <= 100;
                310: freq <= 63;
                311: freq <= 100;
                312: freq <= 60;
                313: freq <= 100;
                314: freq <= 55;
                315: freq <= 100;
                316: freq <= 51;
                317: freq <= 100;
                318: freq <= 48;
                319: freq <= 100;
                //
                320: freq <= 41;
                321: freq <= 41;
                322: freq <= 41;
                323: freq <= 41;
                324: freq <= 41;
                325: freq <= 41;
                326: freq <= 41;
                327: freq <= 100;
                328: freq <= 41;
                329: freq <= 41;
                330: freq <= 41;
                331: freq <= 100;
                332: freq <= 39;
                333: freq <= 100;
                334: freq <= 41;
                335: freq <= 41;
                336: freq <= 41;
                337: freq <= 41;
                338: freq <= 41;
                339: freq <= 100;
                340: freq <= 61;
                341: freq <= 61;
                342: freq <= 61;
                343: freq <= 100;
                344: freq <= 60;
                345: freq <= 60;
                346: freq <= 60;
                347: freq <= 100;
                348: freq <= 58;
                349: freq <= 58;
                350: freq <= 58;
                351: freq <= 100;
                //
                352: freq <= 58;
                353: freq <= 58;
                354: freq <= 58;
                355: freq <= 58;
                356: freq <= 58;
                357: freq <= 100;
                358: freq <= 56;
                359: freq <= 56;
                360: freq <= 56;
                361: freq <= 56;
                362: freq <= 56;
                363: freq <= 100;
                364: freq <= 58;
                365: freq <= 58;
                366: freq <= 58;
                367: freq <= 100;
                368: freq <= 60;
                369: freq <= 60;
                370: freq <= 60;
                371: freq <= 60;
                372: freq <= 60;
                373: freq <= 100;
                374: freq <= 44;
                375: freq <= 100;
                376: freq <= 48;
                377: freq <= 100;
                378: freq <= 51;
                379: freq <= 100;
                380: freq <= 53;
                381: freq <= 100;
                382: freq <= 55;
                383: freq <= 100;
                //
                384: freq <= 56;
                385: freq <= 56;
                386: freq <= 56;
                387: freq <= 56;
                388: freq <= 56;
                389: freq <= 56;
                390: freq <= 56;
                391: freq <= 100;
                392: freq <= 53;
                393: freq <= 53;
                394: freq <= 53;
                395: freq <= 53;
                396: freq <= 53;
                397: freq <= 100;
                398: freq <= 55;
                399: freq <= 55;
                400: freq <= 55;
                401: freq <= 55;
                402: freq <= 55;
                403: freq <= 100;
                404: freq <= 56;
                405: freq <= 56;
                406: freq <= 56;
                407: freq <= 100;
                408: freq <= 55;
                409: freq <= 55;
                410: freq <= 55;
                411: freq <= 100;
                412: freq <= 56;
                413: freq <= 56;
                414: freq <= 56;
                415: freq <= 100;
                //
                416: freq <= 51;
                417: freq <= 51;
                418: freq <= 51;
                419: freq <= 51;
                420: freq <= 51;
                421: freq <= 100;
                422: freq <= 55;
                423: freq <= 55;
                424: freq <= 55;
                425: freq <= 55;
                426: freq <= 55;
                427: freq <= 100;
                428: freq <= 56;
                429: freq <= 56;
                430: freq <= 56;
                431: freq <= 56;
                432: freq <= 56;
                433: freq <= 56;
                434: freq <= 56;
                435: freq <= 100;
                436: freq <= 53;
                437: freq <= 53;
                438: freq <= 53;
                439: freq <= 100;
                440: freq <= 55;
                441: freq <= 55;
                442: freq <= 55;
                443: freq <= 100;
                444: freq <= 56;
                445: freq <= 56;
                446: freq <= 56;
                447: freq <= 100;
                //
                448: freq <= 53;
                449: freq <= 53;
                450: freq <= 53;
                451: freq <= 53;
                452: freq <= 53;
                453: freq <= 100;
                454: freq <= 25;
                455: freq <= 100;
                456: freq <= 100;
                457: freq <= 100;
                458: freq <= 100;
                459: freq <= 100;
                460: freq <= 53;
                461: freq <= 100;
                462: freq <= 55;
                463: freq <= 100;
                464: freq <= 56;
                465: freq <= 56;
                466: freq <= 56;
                467: freq <= 100;
                468: freq <= 53;
                469: freq <= 53;
                470: freq <= 53;
                471: freq <= 100;
                472: freq <= 55;
                473: freq <= 55;
                474: freq <= 55;
                475: freq <= 100;
                476: freq <= 56;
                477: freq <= 56;
                478: freq <= 56;
                479: freq <= 100;
                //
                480: freq <= 60;
                481: freq <= 60;
                482: freq <= 60;
                483: freq <= 60;
                484: freq <= 60;
                485: freq <= 100;
                486: freq <= 60;
                487: freq <= 60;
                488: freq <= 60;
                489: freq <= 60;
                490: freq <= 60;
                491: freq <= 100;
                492: freq <= 61;
                493: freq <= 100;
                494: freq <= 60;
                495: freq <= 100;
                496: freq <= 58;
                497: freq <= 58;
                498: freq <= 58;
                499: freq <= 100;
                500: freq <= 46;
                501: freq <= 100;
                502: freq <= 48;
                503: freq <= 100;
                504: freq <= 49;
                505: freq <= 100;
                506: freq <= 51;
                507: freq <= 100;
                508: freq <= 53;
                509: freq <= 100;
                510: freq <= 55;
                511: freq <= 100;
                default: freq <= 100;
            endcase
            
            
            oProgress <= note*100/notes_total;
        end
        else begin
            count     <= 0;
            note      <= 0;
            oProgress <= 0;
        end
        
        
    end
end

endmodule
