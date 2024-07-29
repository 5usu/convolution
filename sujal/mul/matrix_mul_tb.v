
module matrix_mul_tb;

reg clk;
reg reset;
reg start;
reg [8:0][7:0] matrix_a;
reg [8:0][7:0] matrix_b;
wire [8:0][15:0] result;
wire done;

matrix_mul uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .matrix_a(matrix_a),
    .matrix_b(matrix_b),
    .result(result)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("matrix_mul.vcd"); 
    $dumpvars(0, matrix_mul_tb);
    reset = 1;
    start = 0;
    #10 reset = 0;

    // Example 1
    matrix_a = {8'd1, 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8, 8'd9};
    matrix_b = {8'd9, 8'd8, 8'd7, 8'd6, 8'd5, 8'd4, 8'd3, 8'd2, 8'd1};
    

    // Example 2
    #10;
    matrix_a = {8'd1, 8'd0, 8'd0, 8'd0, 8'd1, 8'd0, 8'd0, 8'd0, 8'd1};
    matrix_b = {8'd1, 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8, 8'd9};
    
    // Example 3
    #10;
    matrix_a = {8'd2, 8'd0, 8'd0, 8'd0, 8'd2, 8'd0, 8'd0, 8'd0, 8'd2};
    matrix_b = {8'd1, 8'd2, 8'd3, 8'd4, 8'd5, 8'd6, 8'd7, 8'd8, 8'd9};
    

    // Example 4
    #10;
    matrix_a = {8'd1, 8'd2, 8'd3, 8'd0, 8'd1, 8'd4, 8'd0, 8'd0, 8'd1};
    matrix_b = {8'd1, 8'd0, 8'd0, 8'd2, 8'd1, 8'd0, 8'd3, 8'd4, 8'd1};
   
end
endmodule
