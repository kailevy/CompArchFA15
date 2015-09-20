// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
output out, carryout;
input a, b, carryin;
wire axorb;
wire aandb;
wire axorbandc;
`XOR xor1(axorb,a,b);
`AND and1(aandb,a,b);
`AND and2(axorbandc,axorb,carryin);
`XOR xor2(out,axorb,carryin);
`OR or1(carryout,axorbandc,aandb);
endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
//behavioralFullAdder adder (sum, carryout, a, b, carryin);
structuralFullAdder adder (sum, carryout, a, b, carryin);
initial begin
$dumpvars(0,testFullAdder);
$display("A B Carryin| Sum Carryout | Expected Output");
a=0;b=0;carryin=0; #1000
$display("%b %b    %b   |  %b      %b    | 0 0",a,b,carryin,sum,carryout);
a=1;b=0;carryin=0; #1000
$display("%b %b    %b   |  %b      %b    | 1 0",a,b,carryin,sum,carryout);
a=0;b=1;carryin=0; #1000
$display("%b %b    %b   |  %b      %b    | 1 0",a,b,carryin,sum,carryout);
a=0;b=0;carryin=1; #1000
$display("%b %b    %b   |  %b      %b    | 1 0",a,b,carryin,sum,carryout);
a=1;b=1;carryin=0; #1000
$display("%b %b    %b   |  %b      %b    | 0 1",a,b,carryin,sum,carryout);
a=1;b=0;carryin=1; #1000
$display("%b %b    %b   |  %b      %b    | 0 1",a,b,carryin,sum,carryout);
a=0;b=1;carryin=1; #1000
$display("%b %b    %b   |  %b      %b    | 0 1",a,b,carryin,sum,carryout);
a=1;b=1;carryin=1; #1000
$display("%b %b    %b   |  %b      %b    | 1 1",a,b,carryin,sum,carryout);
end
endmodule
