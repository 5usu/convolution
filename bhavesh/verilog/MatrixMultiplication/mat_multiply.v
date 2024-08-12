module matmultiply(
input [71:0] a,
input [71:0] b,
output reg[71:0] c,
input enable,
input clk,
input rst,

output reg done,
output reg high
);

reg [7:0] matrixA[2:0][2:0];
reg [7:0] matrixB[2:0][2:0];
reg [7:0] matrixC[2:0][2:0];
integer i, j, k;
reg[15:0] addition;
reg multiply;
reg values;

always@(posedge clk or posedge rst)begin
    
    if(rst==1)begin
       for(i=0; i<=2; i=i+1)begin
          for(j=0;j<=2;j=j+1)begin
             matrixA[i][j]=8'd0;
             matrixB[i][j]=8'd0;
             matrixC[i][j]=8'd0;
             
          end
       end
       i<=0;
       j<=0;
       k<=0;
       multiply<=0;
       values<=0;
       
    end
    else begin
       if(enable==1)begin
       values = 1;
         if(values==1)begin
         
           for(i=0; i<=2; i=i+1)begin
              for(j=0; j<=2; j=j+1)begin
                 matrixA[i][j] = a[(i*3 + j)*8+:8];
                 matrixB[i][j] = b[(i*3 + j)*8+:8];
                 matrixC[i][j] = 8'd0;
              end
           end
           high <= 1;
           values = 0;
           multiply = 1;
           
         end
         else if(multiply==1)begin
            addition <= matrixA[i][k]*matrixB[k][j];
            matrixC[i][j] += addition;
            
            if(k==2)begin
              k = 0;
              if(j==2)begin
                j = 0;
                if(i==2)begin
                  i = 0;
                  multiply = 0;
                end
                else begin
                  i = i +1;
                end
              end
              else 
                j=j+1;
            end
            else
              k=k+1;
         end
         
         else if(multiply==0)begin
            for(i=0; i<=2; i=i+1)begin
               for(j=0; j<=2; j=j+1)begin
                  c[(i*3 + j)*8 +: 8] = matrixC[i][j];
               end
            end
            done = 1;
         end
       end
    end
end


endmodule
