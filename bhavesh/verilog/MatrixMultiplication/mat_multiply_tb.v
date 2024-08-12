module matmultiply_tb;

reg clk;
reg rst;
reg [71:0] a;
reg [71:0] b;
wire [71:0] c;
reg enable;
wire done;
wire high;


matmultiply mat
(
.a(a),
.b(b),
.c(c),
.clk(clk),
.rst(rst),
.done(done),
.enable(enable),
.high(high)
);

initial begin 

$dumpfile("mat_multiply.vcd");
$dumpvars(0, matmultiply_tb);

end

integer i, j;
initial begin

clk = 1'b0;
forever #5 clk = ~clk;

end 


initial begin
    rst = 1'b0;
    
    #5;
    rst = 1'b0;
    enable=1'b1;
    
    
    
    #10
    assign a[71:0] = {8'haa, 8'hbb, 8'hcc, 8'hdd, 8'hee, 8'hff, 8'h11, 8'h22, 8'h33};
    assign b[71:0] = {8'hab, 8'hac, 8'had, 8'hae, 8'haf, 8'hba, 8'hbc, 8'hbd, 8'hbe};
    
    #10;
    for(i=0; i<=2; i=i+1)begin
       for(j=0; j<=2; j=j+1)begin
          $display(" %d", c[(i*3+j)*8 +: 8]);
       end
       $display("\n");
    end
end

endmodule
