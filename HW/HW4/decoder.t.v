module decodertest;
  reg[4:1] address;
  wire[31:0] out;
  reg enable;
  //behavioralMultiplexer multiplexer (out,addr0,addr1,in0,in1,in2,in3);
  decoder1to32 decoder(out,enable, address);

  initial begin
    $display("address| enable |               out              |               exp              ");
    address=4'd2; enable=1; #5
    $display("  %b  |   %b   |%b|00000000000000000000000000000100", address, enable, out);
    address=4'd0; enable=1; #5
    $display("  %b  |   %b   |%b|00000000000000000000000000000001", address, enable, out);
    address=4'd2; enable=0; #5
    $display("  %b  |   %b   |%b|00000000000000000000000000000000", address, enable, out);
  end
endmodule
