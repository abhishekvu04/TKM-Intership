`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2026 11:42:20 AM
// Design Name: 
// Module Name: fulladder
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


module fulladder(
input a,
input b,
input cin,
output sum,
output cout
);
wire w1,w2,w3;
xor(w1,a,b);
and(w3,a,b);
xor(sum,w1,cin);
and(w2,w1,cin);
or(cout,w2,w3);
endmodule
