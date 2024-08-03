module convolution_tb;
reg clk;
reg rst;
reg enable;
reg [647:0] IMG;
reg [8:0] MASK;
wire [647:0] ConvIMG;
output reg values;
output reg convolve;
wire done;


convolution uut(
.clk(clk),
.rst(rst),
.enable(enable),
.IMG(IMG),
.MASK(MASK),
.ConvIMG(ConvIMG),
.vals(values),
.conv(convolve),
.done(done)
);

integer i, j;

initial begin
$dumpfile("convolution.vcd");
$dumpvars(0, convolution_tb);
end


initial begin
clk=0;
forever #5 clk = ~clk;
end

initial begin
#10;
rst = 1;

#10;
rst = 0;

assign values = 1;
for(i=0; i<=8; i=i+1)begin
   for(j=0; j<=8; j=j+1)begin
      IMG[(i*9 + j)*8 +: 8] = 3*i + j + 3'd3;
   end
end

assign convolve = 1;
//displaying input matrix
 for(i=0; i<=8; i=i+1)begin
           for(j=0; j<=8; j=j+1)begin
              $write(" %d", IMG[(i*9 + j)*8 +: 8]);
           end
           $write("\n");
 end

//displaying output matrix
 for(i=0; i<=8; i=i+1)begin
    for(j=0; j<=8; j=j+1)begin
       $write(" %d", ConvIMG[(i*9 + j)*8 +: 8]);
    end
       $write("\n");
 end

end
endmodule
