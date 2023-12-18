module Odd_Checker(
    input [2:0] Count,
    output reg Out);

 always@(*)
 begin
  if(Count[0]) Out = 1'b1;
  else Out = 1'b0; 
 end
endmodule
