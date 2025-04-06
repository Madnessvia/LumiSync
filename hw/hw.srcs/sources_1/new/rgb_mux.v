`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 11:40:57 PM
// Design Name: 
// Module Name: rgb_mux
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


module rgb_mux(
    input on_off,
    input [23:0] data_in,
    output [23:0] data_out
    );
    
    
    assign data_out = on_off ? data_in : 24'd0;
    
endmodule
