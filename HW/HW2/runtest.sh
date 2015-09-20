iverilog -o $1.ignore $1.v
vvp $1.ignore
gtkwave dump.vcd
