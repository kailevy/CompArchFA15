// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
  output out;
  input address0, address1;
  input in0, in1, in2, in3;
  wire[3:0] inputs = {in3, in2, in1, in0};
  wire[1:0] address = {address1, address0};
  assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
  output out;
  input address0, address1;
  input in0, in1, in2, in3;
  wire nA0;
  wire nA1;
  `NOT A0inv(nA0, address0);
  `NOT A1inv(nA1, address1);
  wire A0andA1;
  wire nA0andA1;
  wire nA0andnA1;
  wire A0andnA1;
  `AND and1(nA0andnA1, nA0, nA1);
  `AND and2(A0andnA1, address0, nA1);
  `AND and3(nA0andA1, nA0, address1);
  `AND and4(A0andA1, address0, address1);
  wire in0andnA0andnA1;
  wire in1andA0andnA1;
  wire in2andnA0andA1;
  wire in3andA0andA1;
  `AND and5(in0andnA0andnA1, in0, nA0andnA1);
  `AND and6(in1andA0andnA1, in1, A0andnA1);
  `AND and7(in2andnA0andA1, in2, nA0andA1);
  `AND and8(in3andA0andA1, in3, A0andA1);
  `OR orgate(out,in0andnA0andnA1,in1andA0andnA1,in2andnA0andA1,in3andA0andA1);
endmodule


module testMultiplexer;
  reg addr0, addr1;
  wire out;
  reg in0,in1,in2,in3;
  //behavioralMultiplexer multiplexer (out,addr0,addr1,in0,in1,in2,in3);
  structuralMultiplexer multiplexer (out,addr0,addr1,in0,in1,in2,in3);

  initial begin
    $dumpvars(0,testMultiplexer);
    $display("A0 A1| I0 I1 I2 I3 | O | Expected Output");
    addr0=0;addr1=0;in0=1;in1=0;in2=0;in3=0; #1000
    $display("%b  %b |  %b  %b  %b  %b | %b | 1", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=0;in0=0;in1=1;in2=0;in3=0; #1000
    $display("%b  %b |  %b  %b  %b  %b | %b | 1", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=1;in0=0;in1=0;in2=1;in3=0; #1000
    $display("%b  %b |  %b  %b  %b  %b | %b | 1", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=1;in0=0;in1=0;in2=0;in3=1; #1000
    $display("%b  %b |  %b  %b  %b  %b | %b | 1", addr0, addr1, in0, in1, in2, in3, out);
  end
endmodule
