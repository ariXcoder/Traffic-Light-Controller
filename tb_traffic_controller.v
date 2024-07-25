`timescale 1ns / 1ps


module tb_traffic_controller();
reg P_RES,CLK,MODE;
wire EAST_G,EAST_Y,EAST_R, NORTH_G,NORTH_Y,NORTH_R, WEST_G,WEST_Y,WEST_R,SOUTH_G,SOUTH_Y,SOUTH_R;
integer sec=1000000000;

traffic_controller DUT(.clk(CLK),.p_reset(P_RES),.east_green(EAST_G),.east_yellow(EAST_Y),.east_red(EAST_R), .north_green(NORTH_G),.north_yellow(NORTH_Y),.north_red(NORTH_R),.west_green(WEST_G),.west_yellow(WEST_Y),.west_red(WEST_R),.south_green(SOUTH_G),.south_yellow(SOUTH_Y),.south_red(SOUTH_R),.mode_select(MODE));



initial
    CLK<=0; 
always begin
 #12.5 CLK<=~CLK;
end
initial begin
    P_RES <= 0;
    #1 P_RES <=1; 
    MODE <= 0;
     
    #100 P_RES <= 0;
    #(30*sec) MODE <= 1;
    #(60*sec) MODE <= 0;
    end
//initial begin
//$monitor("EAST_G=%b,NORTH_G=%b,WEST_G=%b,SOUTH_G=%B,EAST_Y=%b,NORTH_Y=%b,WEST_Y=%b,SOUTH_Y=%B,EAST_B=%b,NORTH_B=%b,WEST_B=%b,SOUTH_B=%b",EAST_G,NORTH_G,WEST_G,SOUTH_G,EAST_Y,NORTH_Y,WEST_Y,SOUTH_Y,EAST_B,NORTH_B,WEST_B,SOUTH_B);


//#500000 $finish;
//end

endmodule
