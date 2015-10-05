`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    
    wire carry0, carry1, carry2;

    structuralFullAdder adder0(sum[0], carry0, a[0], b[0], 0);
    structuralFullAdder adder1(sum[1], carry1, a[1], b[1], carry0);
    structuralFullAdder adder2(sum[2], carry2, a[2], b[2], carry1);
    structuralFullAdder adder3(sum[3], carryout, a[3], b[3], carry2); 
    
    `XOR (overflow, carryout, carry2);

endmodule

module structuralFullAdder(sum, carryout, a, b, carryin);
	output sum, carryout;
	input a, b, carryin;

	// Wires for out
	wire bXORc, nbXORc, na, nb, nc, aANDbXORc, aANDnbXORc;

	// Wires for carryout
	wire bANDc, aANDc, aANDb;

	`NOT n1(na, a);
	`NOT n2(nb, b);

	// Out logic
	`XOR x1(bXORc, b, carryin);
	`NOT nx1(nbXORc, bXORc);

	`AND a1(aANDbXORc, na, bXORc);
	`AND a2(aANDnbXORc, a, nbXORc);

	`OR o1(sum, aANDbXORc, aANDnbXORc);

	// Carryout logic
	`AND a3(bANDc, b, carryin);
	`AND a4(aANDc, a, carryin);
	`AND a5(aANDb, a, b);

	`OR o2(carryout, bANDc, aANDc, aANDb);
endmodule
