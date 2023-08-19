`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/15/2023 02:19:56 PM
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter(
    input clk,reset,
    output reg [3:0] count,
    output done_mix,done
    );
    reg [3:0]next_count;
    
    
    always@(posedge clk,negedge reset)begin
       if(!reset)
        count<='b0;
       else 
        count<=next_count;
    end
    
    always@(*)begin
         if(count==9)
            next_count=count;
         else
            next_count=count+1;
    end
    
    assign done_mix= (count==9);
    assign done= (count==9);
endmodule
