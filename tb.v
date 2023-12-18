module tb();

 reg [4:0] Addr;
 reg clk, rst_n;
 wire Odd;

 Top t1(Addr, clk, rst_n, Odd);

 integer period = 20; // Period of clk is 20ns

 // Clock generation
 always
 begin 
 #(period/2) clk = ~clk;
 end

 initial begin
   clk = 0; rst_n = 1; Addr = 3; #382; // Reads fourth row of data (has 2 sequences)
   rst_n = 0; #35; // Resetting  
   rst_n = 1; Addr = 15; #382; // Reads the row 16 of data (has 0 sequences)
   rst_n = 0; #35; // Resetting  
   rst_n = 1; Addr = 24; #382; // Reads the row 25 of data (has 1 sequences)
   $finish;
 end

endmodule

