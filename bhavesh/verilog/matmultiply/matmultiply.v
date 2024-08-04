module multiply(
input[8:0] A,
input[8:0] B,
output[8:0] C
);


assign C[0] = A[0]*B[0] + A[1]*B[3] + A[2]*B[6];
assign C[1] = A[0]*B[1] + A[1]*B[4] + A[2]*B[7];
assign C[2] = A[0]*B[2] + A[1]*B[5] + A[2]*B[8];

assign C[3] = A[3]*B[0] + A[4]*B[3] + A[5]*B[6];
assign C[4] = A[3]*B[1] + A[4]*B[4] + A[5]*B[7];
assign C[5] = A[3]*B[2] + A[4]*B[5] + A[5]*B[8];

assign C[6] = A[6]*B[0] + A[7]*B[3] + A[8]*B[6];
assign C[7] = A[6]*B[1] + A[7]*B[4] + A[8]*B[7];
assign C[8] = A[6]*B[2] + A[7]*B[5] + A[8]*B[8];


endmodule




