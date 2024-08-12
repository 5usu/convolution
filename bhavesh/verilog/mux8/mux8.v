module mux(
input [7:0] d,
input[2:0] s, 
output out);
  


  
 // assign o = (s[2])?((s[1])?((s[0])?d8:d7):((s[0])?d6:d5)):((s[1])?((s[0])?d4:d3):((s[0])?d2:d1)) ;
  
  
  always@(*)begin
  reg o;
  
  case(s)
  3'b000:o=d[0];
  3'b001:o=d[1];
  3'b010:o=d[2];
  3'b011:o=d[3];
  3'b100:o=d[4];
  3'b101:o=d[5];
  3'b110:o=d[6];
  3'b111:o=d[7];
  endcase
  end
  
  assign out = o;
  
endmodule
