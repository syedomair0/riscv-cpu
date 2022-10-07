module clock_gen (input 	 enable, 
				  output reg clk);

	parameter FREQ = 100000
	parameter PHASE = 0;
	parameter DUTY = 50;


