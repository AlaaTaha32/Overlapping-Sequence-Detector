module Top(
 input [4:0] Addr,
 input clk,
 input rst_n,
 output Odd);

 wire [15:0] Parallel_Data;
 wire Serial_Out, PISO_Done, Detect;
 wire [2:0] Count; 

 Rom #(.Width(16), .depth(32)) B1(.Addr(Addr), .Out(Parallel_Data));
 PISO #(.Width(16)) B2(.clk(clk), .rst_n(rst_n), .Data_in(Parallel_Data), .Serial_out(Serial_Out), .Done(PISO_Done));
 Fsm B3(.clk(clk), .rst_n(rst_n), .Bit_in(Serial_Out), .Seq_det(Detect));
 Count B4(.clk(clk), .rst_n(rst_n), .Seq_det(Detect), .count(Count));
 Odd_Checker B5(.Count(Count), .Out(Odd));
  

endmodule
