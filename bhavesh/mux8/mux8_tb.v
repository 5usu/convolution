module mux_tb();
  reg [7:0] d;
  reg [2:0] s;
  wire out;
  
  mux m(
  .d(d),
  .s(s), 
  .out(out)
  );
  
 //initialize
 initial begin
 d[0] = 3'd0;
 s[0]=0; s[1]=0; s[2]=0;
 end
 
  initial begin 
    #10    d[1]=3'd1;
    #10    d[2]=3'd2;
    #10    d[3]=3'd3;
    #10    d[4]=3'd4;
    #10    d[5]=3'd5;
    #10    d[6]=3'd6;
    #10    d[7]=3'd7;

    #1000 $finish;
  end
  
  initial begin
 
    #10;
    s[0]=0; s[1]=0;s[2]=0;
    
    #10;
    s[0]=1; s[1]=0;s[2]=0;
    
    #10;
    s[0]=0; s[1]=1;s[2]=0;
    
    #10;
    s[0]=0; s[1]=0;s[2]=1;
    
    #10;
    s[0]=1; s[1]=1;s[2]=0;
    
    #10;
    s[0]=0; s[1]=1;s[2]=1;
    
    #10;
    s[0]=1; s[1]=0;s[2]=1;
    
    #10;
    s[0]=1; s[1]=1;s[2]=1;
  end
  
  initial begin
    $dumpfile("test_mux8.vcd");
    $dumpvars(0, mux_tb);
  end
endmodule
