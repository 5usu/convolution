module convolution(
input clk,
input rst,
input enable,
input values,
input convolve,
input [647:0] IMG,
output reg [8:0]MASK,
output reg [647:0] ConvIMG,
output reg done
);

reg signed [8:0] matIMG[8:0][8:0];
reg signed [8:0] matMASK[2:0][2:0];
//reg signed [8:0] matConvIMG[8:0][8:0];
integer i, j;
integer m, n;
reg [15:0] temp;
integer x;
//reg values;
//reg convolve;

//kernel for GAUSSIAN-BLUR
initial begin
matMASK[0][0] = 2; matMASK[0][1] = 1; matMASK[0][2] = 2;
matMASK[1][0] = 1; matMASK[1][1] = 6; matMASK[1][2] = 1;
matMASK[2][0] = 2; matMASK[2][1] = 1; matMASK[2][2] = 2;
end

initial begin
$display("gaussian blur kernel: ");
for(i=0; i<=2; i=i+1)begin
   for(j=0; j<=2; j=j+1)begin
      $write(matMASK[i][j]);
   end
   $write ("\n");
end
end


always@(posedge clk or posedge rst or posedge enable)begin
    if(rst==1)begin
       //$display("reset flag ON start");
       for(i=0; i<=8; i=i+1)begin
           for(j=0; j<=8; j=j+1)begin
               matIMG[i][j] <= 8'd0;
               //matConvIMG[i][j] <= 8'd0;
               //$write(matIMG[i][j]);
           end
           //$write("\n");
       end
       i = 0;
       j = 0;
       m = 0;
       n = 0;
      
       //values = 0;
       //convolve = 0;
       temp = 8'd0;
      //$display("reset flag ON end"); 
    end  
    else begin
       if(enable==1)begin
          //values = 1;
          //$display("enable is ON start");
          if(values==1)begin
          
             for(i=0;i<=8;i=i+1)begin
                 for(j=0;j<=8;j=j+1)begin
                 matIMG[i][j] = IMG[(i*9 + j)*8 +: 8];
                 //matConvIMG[i][j] = 8'd0;
                 end
             end
             i = 0;
             j = 0;
             m = 0;
             n = 0;
             x = 0;
             //values=0;
             //convolve=1;
           //$display("values ON");  
          end
          else if(convolve==1)begin
          //$display("convolve on ");
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
                         done = 1;
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
          //else if(convolve==0)begin
          //$display("convolve off");
          //       done = 1;
          //end
       end
    end
end

endmodule
