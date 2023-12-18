module PISO#(parameter Width = 16)(
 input clk,
 input rst_n,
 input [Width-1:0] Data_in,
 output Serial_out,
 output Done
 );

 reg [Width:0] Shift_data;
 reg [4:0] Shift_Count;
 integer i;
 
 always@(Data_in) begin
   Shift_data = {1'bx, Data_in};
   Shift_Count = 0;
 end

 // Parallel to serial shift
 always@(posedge clk or negedge rst_n)
 begin
  if(~rst_n) begin
      Shift_data <= {(Width+1){1'b0}};
      Shift_Count <= 0;
  end
  else
      for(i=0; i<Width; i=i+1) Shift_data[i+1] <= Shift_data[i];
      Shift_Count <= Shift_Count +1;
      Shift_data[0] <= 1'bx;
 end

 assign Serial_out = Shift_data[Width];
 assign Done = (Shift_Count == Width); // Shifting is done when all bits of data input 

endmodule
