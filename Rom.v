module Rom#(parameter Width = 16, depth = 32)(
    input [4:0] Addr,
    output [Width-1:0] Out
);

reg [Width-1:0] mem [0:depth-1]; // 16*32 ROM

initial begin 
    $readmemb("C:/Users/hp/Desktop/ROM_Data.txt", mem);
end

assign Out = mem[Addr];

endmodule
