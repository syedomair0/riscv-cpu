module registers(
	input clock,
	input writeEnable,
	input [5:0] readReg1, readReg2, writeReg,
	input [31:0] writeData,
	output [31:0] readData1, readData2,
);

reg [31:0] reg_array [31:0];
integer i;

initial
begin
	for(i=0;i<32;i=i+1)
		reg_array[i] <= 32'd0;
end

always @(posedge clock)
begin
	if(writeEnable) begin
		reg_array[writeReg] <= writeData;
	end
end

assign readData1 = reg_array[readReg1];
assign readData2 = reg_array[readReg2];

endmodule
