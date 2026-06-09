`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2026 12:05:30 PM
// Design Name: 
// Module Name: fuladdertb
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


module fuladdertb;
reg a_tb;
reg b_tb;
reg cin_tb;
wire sum_tb;
wire cout_tb;

fuladder mygate(.a(a_tb),.b(b_tb),.cin(cin_tb),.sum(sum_tb),.cout(cout_tb));
initial
begin
a_tb=1'b0;
b_tb=1'b0;
cin_tb=1'b0;
#5;
a_tb=1'b0;
b_tb=1'b0;
cin_tb=1'b1;
#5;
a_tb=1'b0;
b_tb=1'b1;
cin_tb=1'b0;
#5;
a_tb=1'b0;
b_tb=1'b1;
cin_tb=1'b1;
#5;
a_tb=1'b1;
b_tb=1'b0;
cin_tb=1'b0;
#5;
a_tb=1'b1;
b_tb=1'b0;
cin_tb=1'b1;
#5;
a_tb=1'b1;
b_tb=1'b1;
cin_tb=1'b0;
#5;
a_tb=1'b1;
b_tb=1'b1;
cin_tb=1'b1;
#5;
end
endmodule
