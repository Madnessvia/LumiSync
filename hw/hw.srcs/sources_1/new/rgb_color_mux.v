`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 07:35:44 PM
// Design Name: 
// Module Name: rgb_color_mux
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


module rgb_color_mux(
    input [2:0] color_sel,
    input [23:0] data_in,
    output [23:0] data_out
    );
    
//    always @(color_sel) begin
//        case (color_sel)
//            3'd0: data_out = data_in;
//            3'd1: data_out = 24'hffffff;
//            3'd2: data_out = 24'hff0000;
//            3'd3: data_out = 24'h00ff00;
//            3'd4: data_out = 24'h0000ff;
//            default: data_out = data_in;
//            endcase
//    end
assign data_out = (color_sel == 3'b000) ? data_in :
           (color_sel == 3'b001) ? 24'hffffff:
           (color_sel == 3'b010) ? 24'hff0000:
           (color_sel == 3'b011) ? 24'h00ff00 :
           (color_sel == 3'b100) ? 24'h0000ff: data_in;
    
endmodule
