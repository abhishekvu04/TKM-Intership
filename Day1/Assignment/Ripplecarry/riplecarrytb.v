`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2026 12:17:06 PM
// Design Name: 
// Module Name: riplecarrytb
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


module riplecarrytb;
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] S;
    wire Cout;
    riplecarry mygate(
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .S(S), 
        .Cout(Cout)
    );
    initial begin
        A = 4'b0010; B = 4'b0100; Cin = 1'b0; #10; 
        A = 4'b0101; B = 4'b0011; Cin = 1'b1; #10; 
        A = 4'b0111; B = 4'b0001; Cin = 1'b0; #10; 
        A = 4'b1111; B = 4'b0001; Cin = 1'b0; #10; 
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #10;
end     
endmodule
