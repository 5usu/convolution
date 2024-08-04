module();

reg[1:0] A;
reg[1:0] B;
reg[1:0] C;
output[1:0] out;

always@(*)begin
A[0]<=3'd3;
A[1]<=3'd4;
end

always@(*)begin
B[0]<=3'd2;
B[1]<=3'd5;
end

always@(*)begin
C[0] = A[0]*B[0];
C[1] = B[1]*B[1];
end


assign out = C;

$display("output= %0h", out);

endmodule

