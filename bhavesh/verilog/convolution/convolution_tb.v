module convolution_tb;
reg clk;
reg rst;
reg enable;
reg convolve;
reg values;
reg [647:0] IMG;
wire [8:0] MASK;
wire [647:0] ConvIMG;
wire done;


convolution uut(
.clk(clk),
.rst(rst),
.enable(enable),
.IMG(IMG),
.MASK(MASK),
.ConvIMG(ConvIMG),
.done(done),
.convolve(convolve),
.values(values)
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
rst = 1;

#100;
rst = 0;
enable = 1;
values=0;

#100;
//enable = 1;
values = 1;
for(i=0; i<=8; i=i+1)begin
   for(j=0; j<=8; j=j+1)begin
      IMG[(i*9 + j)*8 +: 8] = 3*i + j + 3'd3;
   end
end


#100;
values = 0;
enable = 1; 
convolve = 1;

//displaying input matrix
$display("input matrix: \n");
 for(i=0; i<=8; i=i+1)begin
           for(j=0; j<=8; j=j+1)begin
              $write(" %d", IMG[(i*9 + j)*8 +: 8]);
           end
           $write("\n");
 end


#10000;
convolve = 0;
enable = 0;
values = 0;


//displaying output matrix
$display("output matrix: \n");
 for(i=0; i<=8; i=i+1)begin
    for(j=0; j<=8; j=j+1)begin
       $write(" %d", ConvIMG[(i*9 + j)*8 +: 8]);
    end
       $write("\n");
 end

$finish;

end

endmodule
