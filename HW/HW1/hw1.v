module hw1;
reg A;
reg B;
wire nA;
wire nB;
wire nAandnB;
not Ainv(nA, A);
not Binv(nB, B);
and andgate(nAandnB, nA, nB);
or orgate(nAornB, nA, nB);
and andgate1(AandB, A, B);
not AndBinv(nAandB, AandB);
or orgate1(AorB, A, B);
not AorBinv(nAorB, AorB);
initial begin
$display("A B |~A ~B|~A~B  ~(A+B)|~(AB) ~A+~B");
A=0;B=0; #1
$display("%b %b | %b %b |  %b      %b  |  %b     %b ", A, B, nA, nB, nAandnB, nAorB, nAandB, nAornB);
A=0;B=1; #1
$display("%b %b | %b %b |  %b      %b  |  %b     %b ", A, B, nA, nB, nAandnB, nAorB, nAandB, nAornB);
A=1;B=0; #1
$display("%b %b | %b %b |  %b      %b  |  %b     %b ", A, B, nA, nB, nAandnB, nAorB, nAandB, nAornB);
A=1;B=1; #1
$display("%b %b | %b %b |  %b      %b  |  %b     %b ", A, B, nA, nB, nAandnB, nAorB, nAandB, nAornB);
end
endmodule
