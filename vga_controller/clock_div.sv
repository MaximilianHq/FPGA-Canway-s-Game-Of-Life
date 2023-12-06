module clock_div(
input logic clk,
input logic k,
output logic clk_1hz
);

	logic [25:0]counter = 0;
	
	always_ff @(posedge clk) begin
		if(counter < 50000000/k) begin
			counter <= counter + 1;
			clk_1hz <= 0;
		end else begin
			clk_1hz <= 1;
			counter <= 0;
		end
	end
	
endmodule
