module andgate_tb();
reg a, b;
wire out;

andgate DUT(.a(a), .b(b), .c(out));

initial
begin
$dumpfile("test_and.vcd");
$dumpvars(0, andgate_tb);

#5 a=1'b0; b=1'b0;
#5 a=1'b0; b=1'b1;
#5 a=1'b1; b=1'b0;
#5 a=1'b1; b=1'b1;

#200 $finish;
end

endmodule
