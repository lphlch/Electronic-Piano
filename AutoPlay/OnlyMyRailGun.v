/*Coded song module. Can control the warp speed, tune, playback progress. Will automatically play and output the corresponding notes.*/
module OnlyMyRailGun (input iClk,   //clock
                      input iReset_n,   //reset signal, active low
                      input iEnable,    //enable signal, active high
                      input [1:0] iControl_Progress,    //control signal of fast forward and fast rewind
                      input [2:0] iControl_Speed,   //control signal of speed
                      input [2:0] iControl_Freq,    //control signal of frequency
                      output reg [7:0] oProgress,   //playing progress  (0-100)
                      output reg [7:0] oFreq    //playing note frequency
                      );
    
    parameter default_notes_speed = 135*4*4;    //notes every minutes = meter speed * notes per meter
    parameter notes_total         = 600;
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
                    0: freq   <= 100;
                    1: freq   <= 100;
                    2: freq   <= 100;
                    3: freq   <= 100;
                    4: freq   <= 41;
                    5: freq   <= 41;
                    6: freq   <= 41;
                    7: freq   <= 100;
                    8: freq   <= 41;
                    9: freq   <= 41;
                    10: freq  <= 41;
                    11: freq  <= 100;
                    12: freq  <= 39;
                    13: freq  <= 100;
                    14: freq  <= 41;
                    15: freq  <= 100;
                    16: freq  <= 100;
                    17: freq  <= 100;
                    18: freq  <= 100;
                    19: freq  <= 100;
                    20: freq  <= 41;
                    21: freq  <= 41;
                    22: freq  <= 41;
                    23: freq  <= 100;
                    24: freq  <= 39;
                    25: freq  <= 39;
                    26: freq  <= 39;
                    27: freq  <= 100;
                    28: freq  <= 39;
                    29: freq  <= 100;
                    30: freq  <= 41;
                    31: freq  <= 100;
                    32: freq  <= 100;
                    33: freq  <= 100;
                    34: freq  <= 100;
                    35: freq  <= 100;
                    36: freq  <= 41;
                    37: freq  <= 41;
                    38: freq  <= 41;
                    39: freq  <= 100;
                    40: freq  <= 41;
                    41: freq  <= 41;
                    42: freq  <= 41;
                    43: freq  <= 100;
                    44: freq  <= 39;
                    45: freq  <= 100;
                    46: freq  <= 41;
                    47: freq  <= 100;
                    48: freq  <= 100;
                    49: freq  <= 100;
                    50: freq  <= 100;
                    51: freq  <= 100;
                    52: freq  <= 41;
                    53: freq  <= 41;
                    54: freq  <= 41;
                    55: freq  <= 100;
                    56: freq  <= 39;
                    57: freq  <= 39;
                    58: freq  <= 39;
                    59: freq  <= 100;
                    60: freq  <= 39;
                    61: freq  <= 100;
                    62: freq  <= 41;
                    63: freq  <= 100;
                    64: freq  <= 100;
                    65: freq  <= 100;
                    66: freq  <= 100;
                    67: freq  <= 100;
                    68: freq  <= 41;
                    69: freq  <= 41;
                    70: freq  <= 41;
                    71: freq  <= 100;
                    72: freq  <= 41;
                    73: freq  <= 41;
                    74: freq  <= 41;
                    75: freq  <= 100;
                    76: freq  <= 39;
                    77: freq  <= 100;
                    78: freq  <= 41;
                    79: freq  <= 100;
                    80: freq  <= 100;
                    81: freq  <= 100;
                    82: freq  <= 100;
                    83: freq  <= 100;
                    84: freq  <= 41;
                    85: freq  <= 41;
                    86: freq  <= 41;
                    87: freq  <= 100;
                    88: freq  <= 39;
                    89: freq  <= 39;
                    90: freq  <= 39;
                    91: freq  <= 100;
                    92: freq  <= 39;
                    93: freq  <= 100;
                    94: freq  <= 41;
                    95: freq  <= 100;
                    96: freq  <= 100;
                    97: freq  <= 100;
                    98: freq  <= 100;
                    99: freq  <= 100;
                    100: freq <= 41;
                    101: freq <= 41;
                    102: freq <= 41;
                    103: freq <= 100;
                    104: freq <= 41;
                    105: freq <= 41;
                    106: freq <= 41;
                    107: freq <= 100;
                    108: freq <= 39;
                    109: freq <= 100;
                    110: freq <= 41;
                    111: freq <= 100;
                    112: freq <= 100;
                    113: freq <= 100;
                    114: freq <= 100;
                    115: freq <= 100;
                    116: freq <= 41;
                    117: freq <= 41;
                    118: freq <= 41;
                    119: freq <= 100;
                    120: freq <= 39;
                    121: freq <= 39;
                    122: freq <= 39;
                    123: freq <= 100;
                    124: freq <= 39;
                    125: freq <= 100;
                    126: freq <= 41;
                    127: freq <= 100;
                    128: freq <= 100;
                    129: freq <= 100;
                    130: freq <= 100;
                    131: freq <= 100;
                    132: freq <= 41;
                    133: freq <= 41;
                    134: freq <= 41;
                    135: freq <= 100;
                    136: freq <= 41;
                    137: freq <= 41;
                    138: freq <= 41;
                    139: freq <= 100;
                    140: freq <= 39;
                    141: freq <= 100;
                    142: freq <= 41;
                    143: freq <= 100;
                    144: freq <= 100;
                    145: freq <= 100;
                    146: freq <= 100;
                    147: freq <= 100;
                    148: freq <= 41;
                    149: freq <= 41;
                    150: freq <= 41;
                    151: freq <= 100;
                    152: freq <= 39;
                    153: freq <= 39;
                    154: freq <= 39;
                    155: freq <= 100;
                    156: freq <= 39;
                    157: freq <= 100;
                    158: freq <= 41;
                    159: freq <= 100;
                    160: freq <= 100;
                    161: freq <= 100;
                    162: freq <= 100;
                    163: freq <= 100;
                    164: freq <= 41;
                    165: freq <= 41;
                    166: freq <= 41;
                    167: freq <= 100;
                    168: freq <= 41;
                    169: freq <= 41;
                    170: freq <= 41;
                    171: freq <= 100;
                    172: freq <= 39;
                    173: freq <= 100;
                    174: freq <= 41;
                    175: freq <= 100;
                    176: freq <= 100;
                    177: freq <= 100;
                    178: freq <= 100;
                    179: freq <= 100;
                    180: freq <= 41;
                    181: freq <= 41;
                    182: freq <= 41;
                    183: freq <= 100;
                    184: freq <= 39;
                    185: freq <= 39;
                    186: freq <= 39;
                    187: freq <= 100;
                    188: freq <= 39;
                    189: freq <= 100;
                    190: freq <= 41;
                    191: freq <= 100;
                    192: freq <= 100;
                    193: freq <= 100;
                    194: freq <= 100;
                    195: freq <= 100;
                    196: freq <= 41;
                    197: freq <= 41;
                    198: freq <= 41;
                    199: freq <= 100;
                    200: freq <= 41;
                    201: freq <= 41;
                    202: freq <= 41;
                    203: freq <= 100;
                    204: freq <= 39;
                    205: freq <= 100;
                    206: freq <= 41;
                    207: freq <= 100;
                    208: freq <= 100;
                    209: freq <= 100;
                    210: freq <= 100;
                    211: freq <= 100;
                    212: freq <= 41;
                    213: freq <= 41;
                    214: freq <= 41;
                    215: freq <= 100;
                    216: freq <= 39;
                    217: freq <= 39;
                    218: freq <= 39;
                    219: freq <= 100;
                    220: freq <= 39;
                    221: freq <= 100;
                    222: freq <= 41;
                    223: freq <= 100;
                    
                    //main
                    225: freq <= 100;
                    226: freq <= 100;
                    227: freq <= 100;
                    228: freq <= 41;
                    229: freq <= 41;
                    230: freq <= 41;
                    231: freq <= 100;
                    232: freq <= 41;
                    233: freq <= 41;
                    234: freq <= 41;
                    235: freq <= 100;
                    236: freq <= 39;
                    237: freq <= 100;
                    238: freq <= 41;
                    239: freq <= 100;
                    240: freq <= 100;
                    241: freq <= 100;
                    242: freq <= 100;
                    243: freq <= 100;
                    244: freq <= 56;
                    245: freq <= 56;
                    246: freq <= 56;
                    247: freq <= 100;
                    248: freq <= 55;
                    249: freq <= 55;
                    250: freq <= 55;
                    251: freq <= 100;
                    252: freq <= 51;
                    253: freq <= 51;
                    254: freq <= 51;
                    255: freq <= 100;
                    
                    //9
                    256: freq <= 51;
                    257: freq <= 51;
                    258: freq <= 51;
                    259: freq <= 100;
                    260: freq <= 53;
                    261: freq <= 100;
                    262: freq <= 53;
                    263: freq <= 53;
                    264: freq <= 53;
                    265: freq <= 53;
                    266: freq <= 53;
                    267: freq <= 100;
                    268: freq <= 51;
                    269: freq <= 51;
                    270: freq <= 51;
                    271: freq <= 100;
                    272: freq <= 51;
                    273: freq <= 51;
                    274: freq <= 51;
                    275: freq <= 100;
                    276: freq <= 53;
                    277: freq <= 100;
                    278: freq <= 53;
                    279: freq <= 53;
                    280: freq <= 53;
                    281: freq <= 100;
                    282: freq <= 100;
                    283: freq <= 100;
                    284: freq <= 51;
                    285: freq <= 51;
                    286: freq <= 51;
                    287: freq <= 100;
                    
                    //10
                    288: freq <= 51;
                    289: freq <= 51;
                    290: freq <= 51;
                    291: freq <= 100;
                    292: freq <= 53;
                    293: freq <= 100;
                    294: freq <= 53;
                    295: freq <= 53;
                    296: freq <= 53;
                    297: freq <= 53;
                    298: freq <= 53;
                    299: freq <= 100;
                    300: freq <= 53;
                    301: freq <= 53;
                    302: freq <= 53;
                    303: freq <= 100;
                    304: freq <= 53;
                    305: freq <= 53;
                    306: freq <= 53;
                    307: freq <= 100;
                    308: freq <= 55;
                    309: freq <= 55;
                    310: freq <= 55;
                    311: freq <= 100;
                    312: freq <= 56;
                    313: freq <= 56;
                    314: freq <= 56;
                    315: freq <= 100;
                    316: freq <= 58;
                    317: freq <= 58;
                    318: freq <= 58;
                    319: freq <= 100;
                    
                    //11
                    320: freq <= 55;
                    321: freq <= 55;
                    322: freq <= 55;
                    323: freq <= 55;
                    324: freq <= 55;
                    325: freq <= 55;
                    326: freq <= 55;
                    327: freq <= 100;
                    328: freq <= 51;
                    329: freq <= 51;
                    330: freq <= 51;
                    331: freq <= 51;
                    332: freq <= 51;
                    333: freq <= 51;
                    334: freq <= 51;
                    335: freq <= 100;
                    336: freq <= 61;
                    337: freq <= 61;
                    338: freq <= 61;
                    339: freq <= 61;
                    340: freq <= 61;
                    341: freq <= 61;
                    342: freq <= 61;
                    343: freq <= 100;
                    344: freq <= 58;
                    345: freq <= 58;
                    346: freq <= 58;
                    347: freq <= 58;
                    348: freq <= 58;
                    349: freq <= 58;
                    350: freq <= 58;
                    351: freq <= 100;
                    
                    //12
                    352: freq <= 58;
                    353: freq <= 58;
                    354: freq <= 58;
                    355: freq <= 58;
                    356: freq <= 58;
                    357: freq <= 100;
                    358: freq <= 58;
                    359: freq <= 58;
                    360: freq <= 58;
                    361: freq <= 58;
                    362: freq <= 58;
                    363: freq <= 100;
                    364: freq <= 60;
                    365: freq <= 60;
                    366: freq <= 60;
                    367: freq <= 100;
                    368: freq <= 100;
                    369: freq <= 100;
                    370: freq <= 100;
                    371: freq <= 100;
                    372: freq <= 56;
                    373: freq <= 56;
                    374: freq <= 56;
                    375: freq <= 100;
                    376: freq <= 55;
                    377: freq <= 55;
                    378: freq <= 55;
                    379: freq <= 100;
                    380: freq <= 51;
                    381: freq <= 51;
                    382: freq <= 51;
                    383: freq <= 100;
                    
                    //13
                    384: freq <= 51;
                    385: freq <= 51;
                    386: freq <= 51;
                    387: freq <= 100;
                    388: freq <= 53;
                    389: freq <= 100;
                    390: freq <= 53;
                    391: freq <= 53;
                    392: freq <= 53;
                    393: freq <= 53;
                    394: freq <= 53;
                    395: freq <= 100;
                    396: freq <= 51;
                    397: freq <= 51;
                    398: freq <= 51;
                    399: freq <= 100;
                    400: freq <= 51;
                    401: freq <= 51;
                    402: freq <= 51;
                    403: freq <= 100;
                    404: freq <= 53;
                    405: freq <= 100;
                    406: freq <= 53;
                    407: freq <= 53;
                    408: freq <= 53;
                    409: freq <= 53;
                    410: freq <= 53;
                    411: freq <= 100;
                    412: freq <= 51;
                    413: freq <= 51;
                    414: freq <= 51;
                    415: freq <= 100;
                    
                    //14
                    416: freq <= 51;
                    417: freq <= 51;
                    418: freq <= 51;
                    419: freq <= 100;
                    420: freq <= 53;
                    421: freq <= 100;
                    422: freq <= 53;
                    423: freq <= 53;
                    424: freq <= 53;
                    425: freq <= 53;
                    426: freq <= 53;
                    427: freq <= 100;
                    428: freq <= 53;
                    429: freq <= 53;
                    430: freq <= 53;
                    431: freq <= 100;
                    432: freq <= 53;
                    433: freq <= 53;
                    434: freq <= 53;
                    435: freq <= 100;
                    436: freq <= 55;
                    437: freq <= 55;
                    438: freq <= 55;
                    439: freq <= 100;
                    440: freq <= 56;
                    441: freq <= 56;
                    442: freq <= 56;
                    443: freq <= 100;
                    444: freq <= 58;
                    445: freq <= 58;
                    446: freq <= 58;
                    447: freq <= 100;
                    
                    //15
                    448: freq <= 53;
                    449: freq <= 53;
                    450: freq <= 53;
                    451: freq <= 53;
                    452: freq <= 53;
                    453: freq <= 53;
                    454: freq <= 53;
                    455: freq <= 100;
                    456: freq <= 100;
                    457: freq <= 100;
                    458: freq <= 100;
                    459: freq <= 100;
                    460: freq <= 100;
                    461: freq <= 100;
                    462: freq <= 100;
                    463: freq <= 100;
                    464: freq <= 53;
                    465: freq <= 53;
                    466: freq <= 53;
                    467: freq <= 100;
                    468: freq <= 55;
                    469: freq <= 55;
                    470: freq <= 55;
                    471: freq <= 100;
                    472: freq <= 56;
                    473: freq <= 56;
                    474: freq <= 56;
                    475: freq <= 100;
                    476: freq <= 58;
                    477: freq <= 58;
                    478: freq <= 58;
                    479: freq <= 100;
                    
                    //16
                    480: freq <= 55;
                    481: freq <= 55;
                    482: freq <= 55;
                    483: freq <= 55;
                    484: freq <= 55;
                    485: freq <= 55;
                    486: freq <= 55;
                    487: freq <= 100;
                    488: freq <= 51;
                    489: freq <= 51;
                    490: freq <= 51;
                    491: freq <= 51;
                    492: freq <= 51;
                    493: freq <= 51;
                    494: freq <= 51;
                    495: freq <= 100;
                    496: freq <= 48;
                    497: freq <= 48;
                    498: freq <= 48;
                    499: freq <= 48;
                    500: freq <= 48;
                    501: freq <= 48;
                    502: freq <= 48;
                    503: freq <= 100;
                    504: freq <= 51;
                    505: freq <= 51;
                    506: freq <= 51;
                    507: freq <= 51;
                    508: freq <= 51;
                    509: freq <= 51;
                    510: freq <= 51;
                    511: freq <= 100;
                    
                    //17
                    512: freq <= 51;
                    513: freq <= 51;
                    514: freq <= 51;
                    515: freq <= 100;
                    516: freq <= 53;
                    517: freq <= 100;
                    518: freq <= 53;
                    519: freq <= 53;
                    520: freq <= 53;
                    521: freq <= 53;
                    522: freq <= 53;
                    523: freq <= 100;
                    524: freq <= 56;
                    525: freq <= 56;
                    526: freq <= 56;
                    527: freq <= 100;
                    528: freq <= 55;
                    529: freq <= 55;
                    530: freq <= 55;
                    531: freq <= 100;
                    532: freq <= 51;
                    533: freq <= 100;
                    534: freq <= 48;
                    535: freq <= 48;
                    536: freq <= 48;
                    537: freq <= 48;
                    538: freq <= 48;
                    539: freq <= 100;
                    540: freq <= 51;
                    541: freq <= 51;
                    542: freq <= 51;
                    543: freq <= 100;
                    
                    //18
                    544: freq <= 51;
                    545: freq <= 51;
                    546: freq <= 51;
                    547: freq <= 100;
                    548: freq <= 53;
                    549: freq <= 100;
                    550: freq <= 53;
                    551: freq <= 53;
                    552: freq <= 53;
                    553: freq <= 53;
                    554: freq <= 53;
                    555: freq <= 53;
                    556: freq <= 53;
                    557: freq <= 53;
                    558: freq <= 53;
                    559: freq <= 53;
                    560: freq <= 100;
                    561: freq <= 100;
                    562: freq <= 100;
                    563: freq <= 100;
                    564: freq <= 100;
                    565: freq <= 100;
                    566: freq <= 100;
                    567: freq <= 100;
                    568: freq <= 100;
                    569: freq <= 100;
                    570: freq <= 100;
                    571: freq <= 100;
                    572: freq <= 100;
                    573: freq <= 100;
                    574: freq <= 100;
                    575: freq <= 100;

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
