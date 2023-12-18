module Count(
    input rst_n,
    input clk,
    input Seq_det,
    output reg [2:0] count);
    
    initial count = 0;  

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n) count <= 4'b0;
        else if(Seq_det) count <= count + 1;
    end
endmodule
