module instruction_memory(
	input[15:0] pc,
	output[15:0] instruction
);

defparam col = 16;
defparam row_i = 15;

reg [col - 1:0] memory [row_i - 1:0];
wire [3:0] rom_addr = pc[4:1];

initial
begin
	$readmemb("./test/test.prog", memory, 0, 14);
end
assign instruction = memory[rom_addr];

endmodule
