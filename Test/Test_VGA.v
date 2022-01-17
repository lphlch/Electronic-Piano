module VGA_color_line (CLK,
                       RST_N,
                       RGB,
                       VGA_HSYNC,
                       VGA_VSYNC,
                       VGA_RED,
                       VGA_GREEN,
                       VGA_BLUE);
    
    input CLK, RST_N;
    input [11:0]RGB;
    output VGA_HSYNC, VGA_VSYNC;
    output [3:0] VGA_RED;
    output [3:0] VGA_GREEN;
    output [3:0] VGA_BLUE;
    reg [11:0] rgb_vga;
    wire clk_vga;  //65MHZ
    
    // Horizontal Parameter(Pixel)
    parameter
    H_DISP = 11'd1024,
    H_FRONT = 11'd24,
    H_SYNC = 11'd136,
    H_BACK = 11'd160,
    H_TOTAL = 11'd1344,
    // Virtical Parameter(Line)
    V_DISP = 11'd768,
    V_FRONT = 11'd3,
    V_SYNC = 11'd6,
    V_BACK = 11'd29,
    V_TOTAL = 11'd806,
    // Picture Parameter
    P_WIDTH = 11'd200,
    P_HEIGHT = 11'd200;
    
    //IP core 65MHZ
    clk_vga_1024_768 clk_vga_inst(
    .clk_in1(CLK),
    .resetn(RST_N),
    .clk_out1(clk_vga)
    );
    
    //?????
    reg [10:0] hcnt;
    reg VGA_HSYNC;
    always @ (posedge clk_vga or negedge RST_N)
    begin
        if (!RST_N)
            hcnt <= 0;  //??
        else
        begin
            if (hcnt < H_TOTAL - 1'b1)  //???????,?????[0, H_TOTAL - 1'b1]
                hcnt <= hcnt + 1'b1;
            else
                hcnt <= 0;
        end
    end
    //???
    always @ (posedge clk_vga or negedge RST_N)
    begin
        if (!RST_N)
            VGA_HSYNC <= 0; //??
        else
        begin
            //??(H_DISP + H_FRONT - 1, H_DISP + H_FRONT + H_SYNC - 1]????
            if (hcnt >= (H_DISP + H_FRONT - 1'b1) && hcnt < (H_DISP + H_FRONT + H_SYNC - 1'b1))
                VGA_HSYNC <= 1;  //????????
            else
                VGA_HSYNC <= 0;
        end
    end
    
    //?????
    reg [10:0] vcnt;
    reg VGA_VSYNC;
    always @ (posedge clk_vga or negedge RST_N)  //????
    begin
        if (!RST_N)
            vcnt <= 0;  //??
        else
        begin
            if (hcnt == H_DISP - 1'b1)  //??????????
            begin
                if (vcnt < V_TOTAL - 1'b1)  //???????
                    vcnt <= vcnt + 1'b1;
                else
                    vcnt <= 0;
            end
            else
                vcnt <= vcnt;
        end
        $display("rst_n=%d,hcnt=%d ,vcnt = %d", RST_N,hcnt,vcnt);
    end
    //???
    always @ (posedge clk_vga or negedge RST_N)
    begin
        if (!RST_N)
            VGA_VSYNC <= 0;
        else
        begin
            if (vcnt >= (V_DISP + V_FRONT - 1'b1) && vcnt < (V_DISP + V_FRONT + V_SYNC - 1'b1))
                VGA_VSYNC <= 1;
            else
                VGA_VSYNC <= 0;
        end
    end
    
    //????????????
    wire [10:0] xpos_vga, ypos_vga;
    assign xpos_vga = (hcnt < H_DISP) ? (hcnt + 1'b1) : 11'd0;  //??? + 1??1~H_DISP?
    assign ypos_vga = (vcnt < V_DISP) ? (vcnt + 1'b1) : 11'd0;  //??? + 1??1~V_DISP?

    reg [15:0] addr;
    wire [11:0] dataO;
    blk_mem_gen_0 logo (
    .clka(clk_vga),    // input wire clka
    .wea(0),      // input wire [0 : 0] wea
    .addra(addr),  // input wire [15 : 0] addra
    .dina(0),    // input wire [11 : 0] dina
    .douta(dataO)  // output wire [11 : 0] douta
    );

    //??
    always @ (posedge clk_vga or negedge RST_N)
    begin
        if (!RST_N) begin
            rgb_vga <= 0;
            addr <= 0;
        end
        else begin
             /*    //????
             if (xpos_vga > 0 && xpos_vga        <= 80) rgb_vga        <= 12'b111111111111;//white
             else if (xpos_vga > 80 && xpos_vga  <= 160) rgb_vga  <= 12'b111100000000;//red
             else if (xpos_vga > 160 && xpos_vga <= 240) rgb_vga <= 12'b111100001111;//mangenta
             else if (xpos_vga > 240 && xpos_vga <= 320) rgb_vga <= 12'b111111110000;//yellow
             else if (xpos_vga > 320 && xpos_vga <= 400) rgb_vga <= 12'b000011110000;//green
             else if (xpos_vga > 400 && xpos_vga <= 480) rgb_vga <= 12'b000000001111;//blue
             else if (xpos_vga > 480 && xpos_vga <= 560) rgb_vga <= 12'b000011111111;//cyan
             else if (xpos_vga > 560 && xpos_vga <= 640) rgb_vga <= 12'b000000000000;
             
             else if (xpos_vga > 640 && xpos_vga  <= 720) rgb_vga  <= 12'b111111111111;//white
             else if (xpos_vga > 720 && xpos_vga  <= 800) rgb_vga  <= 12'b111100000000;//red
             else if (xpos_vga > 800 && xpos_vga  <= 880) rgb_vga  <= 12'b111100001111;//mangenta
             else if (xpos_vga > 880 && xpos_vga  <= 960) rgb_vga  <= 12'b111111110000;//yellow
             else if (xpos_vga > 960 && xpos_vga  <= 1024) rgb_vga  <= 12'b000011110000;//green
             else rgb_vga                         <= 0;//black????????????????
             */

             /*    //????
             if (ypos_vga > 0 && ypos_vga        <= 100) rgb_vga        <= 12'b111111111111;//white
             else if (ypos_vga > 100 && ypos_vga <= 200) rgb_vga  <= 12'b111100000000;
             else if (ypos_vga > 200 && ypos_vga <= 300) rgb_vga <= 12'b000000001111;//blue
             else if (ypos_vga > 300 && ypos_vga <= 400) rgb_vga <= 12'b000011110000;
             else if (ypos_vga > 400 && ypos_vga <= 500) rgb_vga <= 12'b111111110000;//yellow
             else if (ypos_vga > 500 && ypos_vga <= 600) rgb_vga <= 12'b000011111111;
             else if (ypos_vga > 600 && ypos_vga <= 700) rgb_vga <= 12'b111100001111;
             else if (ypos_vga > 700 && ypos_vga <= 800) rgb_vga <= 12'b000000000000;
             else rgb_vga                         <= 0;
            */

            /*
             if (ypos_vga > 0 && ypos_vga        <= 380) rgb_vga        <= 12'b000000001111;//white
             else rgb_vga <= 0;
            */

            $display("xpos_vga=%d, ypos_vga=%d", xpos_vga, ypos_vga);
              //????
            if(addr>16'hFFFF) begin
                rgb_vga <= 0;
                addr<=0;
            end
            else begin
                if(ypos_vga==0) begin   //??????
                    rgb_vga <= 0;
                    addr<=0;
                end
                else begin
                    if (ypos_vga <= P_HEIGHT && xpos_vga>0 && xpos_vga<=P_WIDTH ) begin //??????????
                        rgb_vga <= dataO;
                        addr<=addr+1; 
                    end
                    else begin
                        rgb_vga <= 0;   //??????????
                    end
                end
                
            end




        end
    end



    //????
    assign VGA_RED   = rgb_vga[11:8];
    assign VGA_GREEN = rgb_vga[7:4];
    assign VGA_BLUE  = rgb_vga[3:0];
endmodule
