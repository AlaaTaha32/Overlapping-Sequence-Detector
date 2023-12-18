module Fsm(
 input clk,
 input rst_n,
 input Bit_in,
 output Seq_det
);
 
 localparam S0 = 0, //
    S1 = 1, //1
    S10 = 2, //10
    S101 = 3, //101
    S1011 = 4; //1011 

 reg [2:0] Current_state, Next_state;

 always@(posedge clk or negedge rst_n)
 begin : next_state_logic
   if(!rst_n) Current_state = S0;
   else Current_state = Next_state;
 end

 // Next state logic
 always@(Current_state,Bit_in)
 begin
  case(Current_state)
  S0: begin
    if(Bit_in==1'b1) Next_state = S1;
    else Next_state = S0;
    end
  S1: begin
    if(Bit_in==1'b0) Next_state = S10;
    else Next_state = S1;
    end
  S10: begin
    if(Bit_in==1'b1) Next_state = S101;
    else Next_state = S0;
    end
  S101: begin
    if(Bit_in==1'b1) Next_state = S1011;
    else Next_state = S10;
    end
  S1011: begin
    if(Bit_in==1'b1) Next_state = S1;
    else Next_state = S10;
    end
  default: Next_state = S0;
  endcase
 end     

 // Output logic
 assign Seq_det = (Current_state==S1011);

endmodule
