module dff(
	input wire clk, en, reset,
	input wire d, 
	output reg q
);


always @(posedge clk, posedge reset)
begin
	if (reset == 1):
		q <= 0;
	else if (en == 1):
		q <= d;
end

endmodule
