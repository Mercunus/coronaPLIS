`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2020 13:58:25
// Design Name: 
// Module Name: test_lamp
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


module main(
 input [15:0] sw,
 output [6:0] hex,
 output [7:0]  AN
 );
 
 wire [3:0] inv_sw;
 wire [3:0] dc1;
 wire [3:0] dc2;
 wire f;
 reg [6:0] hex;
 
 assign AN = 8'b1111_1110;

 
 assign inv_sw = ~sw[3:0];
 assign dc1 = inv_sw[0]+inv_sw[1]+inv_sw[2]+inv_sw[3];
 assign dc2 = sw[7:4] & 4'b0101;
 assign f = sw[0]&sw[1]&sw[2]^sw[3];
 
 always @(*) begin
   
    case (sw[9:8])
        2'b00 : hex = dc1;
        2'b01 : hex = dc2;
        2'b10 : hex = f;
        2'b11 : hex = sw[3:0];
 endcase
   
   
    case (hex)
        16'h0 : hex = 7'b1000000;
        16'h1 : hex = 7'b1111001;
        16'h2 : hex = 7'b0100100;
        16'h3 : hex = 7'b0110000;
        16'h4 : hex = 7'b0011001;
        16'h5 : hex = 7'b0010010;
        16'h6 : hex = 7'b0000010;
        16'h7 : hex = 7'b1111000;
        16'h8 : hex = 7'b0000000;
        16'h9 : hex = 7'b0010000;
        16'h10 : hex = 7'b0001000;
        16'h11 : hex = 7'b0000011;
        16'h12 : hex = 7'b1000110;
        16'h13 : hex = 7'b0100001;
        16'h14 : hex = 7'b0000100;
        16'h15 : hex = 7'b0001110;
        
 endcase

 end 

 endmodule
