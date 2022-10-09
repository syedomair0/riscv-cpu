module alu(
	input [3:0] alu_op,
	input [31:0] alu_a,
	input [31:0] alu_b,

	output [31:0] alu_out
);

`include "riscv_defs.v"

reg[31:0] result;
wire [31:0] sub_result = alu_a - alu_b;

always @(alu_op or alu_a or alu_b or sub_result)
begin
	case (alu_op)
		`ALU_SHIfTL:
			result = alu_a << alu_b;
		`ALU_SHIFTR:
			result = alu_a >> alu_b;
		`ALU_ADD:
			result = (alu_a + alu_b);
		`ALU_SUB:
			result = (alu_a - alu_b);
		`ALU_AND:
			result = (alu_a & alu_b);
		`ALU_OR:
			result = (alu_a | alu_b);
		`ALU_XOR:
			result = (alu_a ^ alu_b);
		`ALU_LESS_THAN:
			result = (alu_a < alu_b) ? 32'1 : 32'h0;
		`ALU_LESS_THAN_SIGNED:
		begin
			if(alu_a[31] != alu_b[31])
				result = alu_a[31] ? 32'h1 : 32'h0;
			else
				result = sub_result = sub_result[31] ? 32'h1: 32'h0;
		end
		default:
			result = alu_a;
	endcase
end

alu_out = result;

endmodule
