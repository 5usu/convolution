module matrix_tb;
reg [71:0] A;
reg clock;

matrix mt(
.A(A),
.clk(clock)
);


initial begin
clock = 0;
forever #5 clock = ~clock;
end

integer i, j;
initial begin
$dumpfile("matrix.vcd");
$dumpvars(0, matrix_tb);


for(i=0; i<=2; i=i+1)begin
   for(j=0; j<=2; j=j+1)begin
      A[(i*3 + j)*8 +: 8] = i+j*2;
   end
end


end

endmodule
