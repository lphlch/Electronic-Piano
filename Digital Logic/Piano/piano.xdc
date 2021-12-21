set_property PACKAGE_PIN E3 [get_ports iClk]
set_property PACKAGE_PIN F4 [get_ports iPs2_Clk]
set_property PACKAGE_PIN B2 [get_ports iPs2_Data]
set_property PACKAGE_PIN V10 [get_ports iReset_n]
set_property PACKAGE_PIN A11 [get_ports oPWM]
set_property IOSTANDARD LVCMOS33 [get_ports iClk]
set_property IOSTANDARD LVCMOS33 [get_ports iPs2_Clk]
set_property IOSTANDARD LVCMOS33 [get_ports iPs2_Data]
set_property IOSTANDARD LVCMOS33 [get_ports oPWM]
set_property IOSTANDARD LVCMOS33 [get_ports iReset_n]

set_property PACKAGE_PIN V11 [get_ports oLightsFreq]
set_property PACKAGE_PIN V12 [get_ports oLightsRing]
set_property IOSTANDARD LVCMOS33 [get_ports oLightsFreq]
set_property IOSTANDARD LVCMOS33 [get_ports oLightsRing]

set_property PACKAGE_PIN V14 [get_ports oLightCounter]
set_property IOSTANDARD LVCMOS33 [get_ports oLightCounter]


set_property IOSTANDARD LVCMOS33 [get_ports oLightBuzzerFreq]
set_property IOSTANDARD LVCMOS33 [get_ports oLightPWM]
set_property PACKAGE_PIN V15 [get_ports oLightBuzzerFreq]
set_property PACKAGE_PIN T16 [get_ports oLightPWM]
set_property MARK_DEBUG true [get_nets {frequency[8]}]
set_property MARK_DEBUG true [get_nets {frequency[11]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[4]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[8]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[7]}]
set_property MARK_DEBUG true [get_nets {frequency[3]}]
set_property MARK_DEBUG true [get_nets {frequency[12]}]
set_property MARK_DEBUG true [get_nets {frequency[5]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[11]}]
set_property MARK_DEBUG true [get_nets {frequency[10]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[10]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[1]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[1]}]
set_property MARK_DEBUG true [get_nets {frequency[6]}]
set_property MARK_DEBUG true [get_nets {frequency[9]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[12]}]
set_property MARK_DEBUG true [get_nets {frequency[7]}]
set_property MARK_DEBUG true [get_nets {frequency[4]}]
set_property MARK_DEBUG true [get_nets {frequency[2]}]
set_property MARK_DEBUG true [get_nets {frequency[1]}]
set_property MARK_DEBUG true [get_nets {frequency[0]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[0]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[2]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[3]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[5]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[6]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[11]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[9]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[10]}]
set_property MARK_DEBUG true [get_nets {buzzerDecoder/Q[12]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[5]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[9]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[6]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[2]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[7]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[3]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[8]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[4]}]
set_property MARK_DEBUG true [get_nets {notePlayer/Q[0]}]
set_property MARK_DEBUG true [get_nets buzzer_Counter_Enable]
set_property MARK_DEBUG true [get_nets buzzer_Ring_Enable]
connect_debug_port u_ila_0/probe0 [get_nets [list {frequency[0]} {frequency[1]} {frequency[2]} {frequency[3]} {frequency[4]} {frequency[5]} {frequency[6]} {frequency[7]} {frequency[8]} {frequency[9]} {frequency[10]} {frequency[11]} {frequency[12]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list oCountEnable]]


set_property MARK_DEBUG true [get_nets {buzzer_Freq[11]}]
set_property MARK_DEBUG true [get_nets {buzzer_Freq[12]}]
connect_debug_port u_ila_0/probe0 [get_nets [list {buzzerDecoder/Q[0]} {buzzerDecoder/Q[1]} {buzzerDecoder/Q[2]} {buzzerDecoder/Q[3]} {buzzerDecoder/Q[4]} {buzzerDecoder/Q[5]} {buzzerDecoder/Q[6]} {buzzerDecoder/Q[7]} {buzzerDecoder/Q[8]} {buzzerDecoder/Q[9]} {buzzerDecoder/Q[10]} {buzzerDecoder/Q[11]} {buzzerDecoder/Q[12]}]]


connect_debug_port u_ila_0/probe1 [get_nets [list buzzer_Counter_Enable]]
connect_debug_port u_ila_0/probe2 [get_nets [list buzzer_Ring_Enable]]

set_property MARK_DEBUG false [get_nets {buzzer_Freq[10]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[9]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[2]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[4]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[0]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[1]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[3]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[5]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[6]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[7]}]
set_property MARK_DEBUG false [get_nets {buzzer_Freq[8]}]
set_property MARK_DEBUG false [get_nets oPWM_OBUF]

set_property IOSTANDARD LVCMOS33 [get_ports oVGA_Hsync]
set_property IOSTANDARD LVCMOS33 [get_ports oVGA_Vsync]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {oVGA_Blue[0]}]
set_property PACKAGE_PIN D8 [get_ports {oVGA_Blue[3]}]
set_property PACKAGE_PIN D7 [get_ports {oVGA_Blue[2]}]
set_property PACKAGE_PIN C7 [get_ports {oVGA_Blue[1]}]
set_property PACKAGE_PIN B7 [get_ports {oVGA_Blue[0]}]
set_property PACKAGE_PIN A6 [get_ports {oVGA_Green[3]}]
set_property PACKAGE_PIN B6 [get_ports {oVGA_Green[2]}]
set_property PACKAGE_PIN A5 [get_ports {oVGA_Green[1]}]
set_property PACKAGE_PIN C6 [get_ports {oVGA_Green[0]}]
set_property PACKAGE_PIN A4 [get_ports {oVGA_Red[3]}]
set_property PACKAGE_PIN C5 [get_ports {oVGA_Red[2]}]
set_property PACKAGE_PIN B4 [get_ports {oVGA_Red[1]}]
set_property PACKAGE_PIN A3 [get_ports {oVGA_Red[0]}]
set_property PACKAGE_PIN B11 [get_ports oVGA_Hsync]
set_property PACKAGE_PIN B12 [get_ports oVGA_Vsync]

set_property IOSTANDARD LVCMOS33 [get_ports iSongSelect]
set_property PACKAGE_PIN J15 [get_ports iSongSelect]

set_property IOSTANDARD LVCMOS33 [get_ports {iControl_Freq[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {iControl_Freq[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {iControl_Freq[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {iControl_Speed[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {iControl_Speed[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {iControl_Speed[0]}]
set_property PACKAGE_PIN L16 [get_ports {iControl_Freq[0]}]
set_property PACKAGE_PIN M13 [get_ports {iControl_Freq[1]}]
set_property PACKAGE_PIN R15 [get_ports {iControl_Freq[2]}]
set_property PACKAGE_PIN R17 [get_ports {iControl_Speed[0]}]
set_property PACKAGE_PIN T18 [get_ports {iControl_Speed[1]}]
set_property PACKAGE_PIN U18 [get_ports {iControl_Speed[2]}]

set_property PACKAGE_PIN M17 [get_ports {iControl_Progress[0]}]
set_property PACKAGE_PIN P17 [get_ports {iControl_Progress[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {iControl_Progress[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {iControl_Progress[0]}]