`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/14/2023 03:36:39 PM
// Design Name: 
// Module Name: Add_round
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


module Add_round(
    input [127:0] Data,
    input [127:0] Key,
    output [127:0] out
    );
    
    assign out=Data^Key;
endmodule
