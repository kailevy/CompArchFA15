`include "adder.v"

module test_adders;
	reg [3:0] a;
	reg [3:0] b;
	wire [3:0] sum;
	wire carryout;
	wire overflow;
	reg second;

	// behavioralFullAdder adder (sum, carryout, a, b, carryin);
	FullAdder4bit adder (sum, carryout, overflow, a, b);

	initial begin
        $dumpfile("4adders.vcd");
        $dumpvars(0, test_adders);

	  	$display("A    B    | Sum  Co Ov");
	  	$display("Normal biz");
		a=4'b1;b=4'b0101; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1100;b=4'b1011; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1;b=4'b1; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1010;b=4'b0101; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1101;b=4'b001; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		$display("Carryout");
		a=4'b1111;b=4'b0001; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1111;b=4'b0111; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1100;b=4'b0110; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1010;b=4'b0111; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		$display("Overflow");
		a=4'b0101;b=4'b0011; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b0111;b=4'b0111; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b0100;b=4'b0111; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b0111;b=4'b1; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		$display("Overflow and Carryout");
		a=4'b1100;b=4'b1011; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1010;b=4'b1101; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1011;b=4'b1000; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
		a=4'b1000;b=4'b1111; #1000 
		$display("%b %b | %b %b %b", a, b, sum, carryout, overflow);
	end
endmodule
