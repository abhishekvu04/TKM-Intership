module fuladder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
module riplecarry (
    input [3:0] A,   
    input [3:0] B,   
    input Cin,      
    output [3:0] S,  
    output Cout      
);
    wire c1, c2, c3;
    fuladder fa0 (.a(A[0]), .b(B[0]), .cin(Cin), .sum(S[0]), .cout(c1));
    fuladder fa1 (.a(A[1]), .b(B[1]), .cin(c1),  .sum(S[1]), .cout(c2));
    fuladder fa2 (.a(A[2]), .b(B[2]), .cin(c2),  .sum(S[2]), .cout(c3));
    fuladder fa3 (.a(A[3]), .b(B[3]), .cin(c3),  .sum(S[3]), .cout(Cout));
endmodule

