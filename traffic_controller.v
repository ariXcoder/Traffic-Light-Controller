`timescale 1ns / 1ps

module traffic_controller(clk, p_reset, east_green,east_yellow,east_red, north_green,north_yellow,north_red, west_green,west_yellow,west_red,
    south_green,south_yellow,south_red, mode_select);
    input p_reset, clk, mode_select;
    output reg east_green,east_yellow,east_red, north_green,north_yellow,north_red, west_green,west_yellow,west_red,
    south_green,south_yellow,south_red;
    

    parameter st0 = 4'd0, st1 = 4'd1, st2 = 4'd2, st3 = 4'd3, st4 = 4'd4, st5 = 4'd5, st6 = 4'd6, st7 = 4'd7, st8 = 4'd8, st9 = 4'd9, st10 = 4'd10;
    reg [3:0] pres_state;
    reg clk_1Hz;
    reg [5:0] count = 6'b0;
    reg [25:0] counter = 26'b0;

    
always @(posedge clk or posedge p_reset) 
    begin
        if (p_reset)
                counter <= 0;
        else if (counter == 40000000 - 1) 
                counter <= 0; 
        else 
                counter <= counter + 1;  
    end

always @(posedge clk or posedge p_reset) 
    begin
        if (p_reset)
            clk_1Hz <= 0; 
        else 
            begin 
                if (counter == 20000000 - 1)
                   clk_1Hz <= 1;
                else if (counter == 40000000 - 1)
                    clk_1Hz<=0;
                    
            end  
              
    end
 
    always @ (posedge clk_1Hz or posedge p_reset) begin
        if(p_reset)
        begin
            pres_state<=st0; 
            count<=0;
        end     
        else begin
                case(pres_state)
                    st0:begin
                            if(!mode_select)
                                if(count<2)begin
                                    pres_state<=st0;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st1;
                                    count<=0;
                                end
                            else begin
                            
                                pres_state<=st9; count<=0;
                                end           
                        end       
                    st1:begin
                            if(!mode_select)
                                if(count<5)begin
                                    pres_state<=st1;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st2;
                                    count<=0;
                                end
                            else begin
                                pres_state<=st9; count<=0;   
                                end        
                        end 
                    st2:begin
                        if(!mode_select)
                                if(count<2)begin
                                    pres_state<=st2;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st3;
                                    count<=0;
                                end
                        else    begin
                                pres_state<=st9; count<=0;   
                                end            
                        end 
                    st3:begin
                        if(!mode_select)
                                if(count<5)begin
                                    pres_state<=st3;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st4;
                                    count<=0;
                                end
                         else   begin
                                pres_state<=st9; count<=0; 
                                end             
                        end
                   
                   st4:begin
                        if(!mode_select)
                            if(count<2)begin
                                pres_state<=st4;
                                count<=count+1;
                            end
                            else begin 
                                pres_state <=st5;
                                count<=0;
                            end
                        else    begin
                                pres_state<=st9; count<=0;
                                end               
                        end      
                        
                    st5:begin
                            if(!mode_select)
                                if(count<5)begin
                                    pres_state<=st5;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st6;
                                    count<=0;
                                end
                           else begin
                                pres_state<=st9; count<=0;            
                                end 
                        end
                    
                    st6:begin
                            if(!mode_select)
                                if(count<2)begin
                                    pres_state<=st6;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st7;
                                    count<=0;
                                end
                            else begin
                                pres_state<=st9; count<=0;           
                                end
                        end 
                    
                    st7:begin
                            if(!mode_select)
                                if(count<5)begin
                                    pres_state<=st7;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st8;
                                    count<=0;
                                end
                           else begin
                                pres_state<=st9; count<=0; 
                                end           
                        end     
                    
                    st8:begin
                            if(!mode_select)
                    
                                if(count<2)begin
                                    pres_state<=st8;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st1;
                                    count<=0;
                                end
                           else begin
                                pres_state<=st9; count<=0; 
                                end           
                        end 
                   
                   st9:begin
                            if(mode_select)
                    
                                if(count<2)begin
                                    pres_state<=st9;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st10;
                                    count<=0;
                                end
                           else begin
                                pres_state<=st0; count<=0;     
                                end       
                        end
                  st10:begin
                            if(mode_select)
                    
                                if(count<2)begin
                                    pres_state<=st10;
                                    count<=count+1;
                                end
                                else begin 
                                    pres_state <=st9;
                                    count<=0;
                                end
                           else begin
                                pres_state<=st0; count<=0;        
                                end    
                        end              
            endcase
       end 
   end    // 

    always @(posedge clk_1Hz or posedge p_reset) begin
        if (p_reset) begin
            east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 0;
            east_yellow <= 0; west_yellow <= 0; north_yellow <= 0; south_yellow <= 0;
            east_red <= 1; west_red <= 1; north_red <= 1; south_red <= 1;
        end else begin
            case (pres_state)
                st1:  begin east_green <= 1; west_green <= 0; north_green <= 0; south_green <= 0;
                            east_yellow <= 0; west_yellow <= 0; north_yellow <= 0; south_yellow <= 0;
                            east_red <= 0; west_red <= 1; north_red <= 1; south_red <= 1;
             end
                st2:  begin east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 0;
                            east_yellow <= 1; west_yellow <= 0; north_yellow <= 0; south_yellow <= 0;
                            east_red <= 0; west_red <= 1; north_red <= 1; south_red <= 1;
            end
                st3:  begin east_green <= 0; west_green <= 0; north_green <= 1; south_green <= 0;
                            east_yellow <= 0; west_yellow <= 0; north_yellow <= 0; south_yellow <= 0;
                            east_red <= 1; west_red <= 1; north_red <= 0; south_red <= 1; 
            end
                st4:  begin east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 0;
                            east_yellow <= 0; west_yellow <= 0; north_yellow <= 1; south_yellow <= 0;
                            east_red <= 1; west_red <= 1; north_red <= 0; south_red <= 1;
             end
                st5:  begin east_green <= 0; west_green <= 1; north_green <= 0; south_green <= 0;
                            east_yellow <= 0; west_yellow <= 0; north_yellow <= 0; south_yellow <= 0;
                            east_red <= 1; west_red <= 0; north_red <= 1; south_red <= 1;
             end
                st6:  begin east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 0;
                            east_yellow <= 0; west_yellow <= 1; north_yellow <= 0; south_yellow <= 0;
                            east_red <= 1; west_red <= 0; north_red <= 1; south_red <= 1;
             end
                st7:  begin east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 1;
                            east_yellow <= 0; west_yellow <= 0; north_yellow <= 0; south_yellow <= 0;
                            east_red <= 1; west_red <= 1; north_red <= 1; south_red <= 0; end
                st8:begin   east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 0;
                            east_yellow <= 0; west_yellow <= 0; north_yellow <= 0; south_yellow <= 1;
                            east_red <= 1; west_red <= 1; north_red <= 1; south_red <= 0;
             end
                st9:  begin east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 0;
                            east_yellow <= 1; west_yellow <= 1; north_yellow <= 1; south_yellow <= 1;
                            east_red <= 0; west_red <= 0; north_red <= 0; south_red <= 0;
             end
                st10: begin east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 0;
                            east_yellow <= 0; west_yellow <= 0; north_yellow <= 0; south_yellow <= 0;
                            east_red <= 0; west_red <= 0; north_red <= 0; south_red <= 0; end
                default: begin 
                            east_green <= 0; west_green <= 0; north_green <= 0; south_green <= 0;
                            east_yellow <= 0; west_yellow <= 0; north_yellow <= 0; south_yellow <= 0;
                            east_red <= 1; west_red <= 1; north_red <= 1; south_red <= 1;  end
            endcase
        end
    end
endmodule
