module matrix
(
input [71:0] A,
input clk
);

reg display;
integer i, j;



always@(posedge clk)begin
   //display = 1;
   if(display == 1)begin
      for(i=0; i<=2; i=i+1)begin
         for(j=0;j<=2;j=j+1)begin
            $write(" %d", A[(i*3 + j)*8 +: 8]);
         end
         $write("\n");
      end
      
   end
   display = 0;
end

endmodule
