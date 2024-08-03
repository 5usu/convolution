module convolution(
input clk,
input rst,
input enable,
input [647:0] IMG,
input [8:0] MASK,
output reg [647:0] ConvIMG,
output reg vals,
output reg  conv,
output reg done
);

reg signed [8:0] matIMG[8:0][8:0];
reg signed [8:0] matMASK[2:0][2:0];
//reg signed [8:0] matConvIMG[8:0][8:0];
integer i, j;
integer m, n;
reg [15:0] temp;
integer x;

reg values;
reg convolve;

initial begin
   vals = values;
   conv =  convolve;
end

//kernel for GAUSSIAN-BLUR
initial begin
matMASK[0][0] = 2; matMASK[0][1] = 1; matMASK[0][2] = 2;
matMASK[1][0] = 1; matMASK[1][1] = 6; matMASK[1][2] = 1;
matMASK[2][0] = 2; matMASK[2][1] = 1; matMASK[2][2] = 2;
end

always@(posedge clk or posedge rst)begin
    if(rst==1)begin
       for(i=0; i<=8; i=i+1)begin
           for(j=0; j<=8; j=j+1)begin
               matIMG[i][j] <= 8'd0;
               //matConvIMG[i][j] <= 8'd0;
           end
       end
       i = 0;
       j = 0;
       m = 0;
       n = 0;
      
       values = 0;
       convolve = 0;
       temp = 0;
    end  
    else begin
       if(enable==1)begin
          if(values==1)begin
             for(i=0;i<=8;i=i+1)begin
                 for(j=0;j<=8;j=j+1)begin
                 matIMG[i][j] = IMG[(i*9 + j)*8 +: 8];
                 //matConvIMG[i][j] = 8'd0;
                 end
             end
          end
          else if(convolve==1)begin
                 temp = temp + (matMASK[i][j])*(matIMG[i+m][j+n]);
                 ConvIMG[8*x +: 8] = temp;
                 if(j==2)begin 
                   j<=0;
                   if(i==2)begin
                     i<=0;
                     x = x + 1;
                     if(n==6)begin
                       n<=0;
                       if(m==6)begin
                         m<=0;
                         convolve=0;
                       end
                       else
                         m=m+1;
                     end
                     else
                     n=n+1;
                   end
                   else
                   i=i+1;
                 end
                 else 
                 j=j+1;
          end
          else if(convolve==0)begin
                 done = 1;
          end
       end
    end
end

endmodule
