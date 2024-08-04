module multiply_tb;


reg[8:0] a;
reg[8:0] b;
wire[8:0] c;

initial begin
$dumpfile("matmultiply_test.vcd");
$dumpvars(0  ,multiply_tb);

end

multiply m0(.A(a), .B(b), .C(c));



initial begin

assign a[0] = 5'd0;
assign a[1] = 5'd1;
assign a[2] = 5'd2;
assign a[3] = 5'd3;
assign a[4] = 5'd4;
assign a[5] = 5'd5;
assign a[6] = 5'd6;
assign a[7] = 5'd7;
assign a[8] = 5'd8;



assign b[0] = 5'd9;
assign b[1] = 5'd10;
assign b[2] = 5'd11;
assign b[3] = 5'd12;
assign b[4] = 5'd13;
assign b[5] = 5'd14;
assign b[6] = 5'd15;
assign b[7] = 5'd16;
assign b[8] = 5'd17;

end

initial begin
$display("multiplication of A and B = %0d", c[1]);

end

endmodule
