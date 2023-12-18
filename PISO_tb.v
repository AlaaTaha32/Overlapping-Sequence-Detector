module P_tb();

 reg [15:0] Data_in;
 reg clk, rst_n;
 wire Done, Serial_Out;

 PISO #(16) t1(clk, rst_n, Data_in, Serial_Out, Done);

 integer period = 20; // Period of clk is 20ns

 // Clock generation
 always
 begin 
 #(period/2) clk = ~clk;
 end

 initial begin
   clk = 0; rst_n = 1; Data_in = 16'hf000; #382; // Reads fourth row of data (has 2 sequences)
   rst_n = 0; #35; // Resetting  
   rst_n = 1; Data_in = 16'hff11; #382; // Reads the row 16 of data (has 0 sequences)
   rst_n = 0; #35; // Resetting  
   $finish;
 end

endmodule
