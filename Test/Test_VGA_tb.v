`timescale 1 ns/ 100 ps
module VGA_color_line_vlg_tst();
    reg CLK, RST_N;  //系统时钟和低电平复位
    reg [11:0] RGB;  //RGB颜色值
    wire VGA_HSYNC, VGA_VSYNC;  //行同步VGA_HSYNC，场同步VGA_VSYNC
    wire [3:0] VGA_RED;
    wire [3:0] VGA_GREEN;
    wire [3:0] VGA_BLUE;  //像素三基色输出R、G、B

    VGA_color_line i1 (
        .CLK(CLK),
        .RST_N(RST_N),
        .RGB(RGB),
        .VGA_HSYNC(VGA_HSYNC),
        .VGA_VSYNC(VGA_VSYNC),
        .VGA_RED(VGA_RED),
        .VGA_GREEN(VGA_GREEN),
        .VGA_BLUE(VGA_BLUE)
    );
    initial
        begin
            CLK = 0;
            RST_N = 0;
            #5
            RST_N = 1;
        end
    always
        begin
            #1 CLK = ~CLK;
        end

    initial begin
        RGB=0;
        #100;
        RGB=12'h0F0;
        #100;
        RGB=12'h00F;
        #100;
        RGB=12'hF00;
    end
endmodule