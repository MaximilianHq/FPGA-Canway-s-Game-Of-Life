module Cell(
    input logic clk,
    input logic rst,
	 input logic [7:0] neighbors,
	 input logic default_state,
    output logic state
);

	logic nextstate;
// logic default_state = 1; // ändra till structs senare
	int population; 

	// sum neighbors alive
	assign population = neighbors[0] +
							  neighbors[1] +
							  neighbors[2] +
							  neighbors[3] +
							  neighbors[4] +
							  neighbors[5] +
							  neighbors[6] +
							  neighbors[7];
	
	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			nextstate <= default_state;
		end else begin

			// Apply Game of Life rules
			if (state) begin
				 // Cell is alive
				 if (population < 2 || population > 3) begin
					  // Overcrowding or loneliness, cell dies
					  nextstate <= 0;
				 end
			end else begin
				 // Cell is dead
				 if (population == 3) begin
					  // Exactly 3 neighbors, cell becomes alive
					  nextstate <= 1;
				 end
			end
		end
		state <= nextstate;
	end


endmodule

module GameOfLife (
	input logic clk,
	input logic rst,
	input              MAX10_CLK1_50, // 50 MHz clock - PIN_P11
	input              KEY[1],   // Push button  - PIN_A7
	output logic [3:0] VGA_R,  // VGA Red Data   - PIN_AA1, V1, Y2, Y1
	output logic [3:0] VGA_G,  // VGA Green Data - PIN_W1, T2, R2, R1
	output logic [3:0] VGA_B,  // VGA Blue Data  - PIN_P1, T1, P4, N2
	output logic       VGA_HS, // VGA hsync - PIN_N3
	output logic       VGA_VS  // VGA vsync - PIN_N1
);
	parameter DIVIDE_DISPLAY_V = 20;	//one twentieth of the display
	parameter DIVIDE_DISPLAY_H = 20; //one twentieth of the display
	parameter GRIDWIDTH = 32;
	parameter GRIDHEIGHT = 24;
	
	logic cells[GRIDHEIGHT][GRIDWIDTH];
	logic gol_clk;
	
	clock_div gol_clock(
		.clk(MAX10_CLK1_50), 
		.k(2), 
		.clk_1hz(gol_clk)
	);

	genvar i, j;
	generate		
		for (i=0; i<GRIDHEIGHT; i=i+1) begin : row
			for (j=0; j<GRIDWIDTH; j=j+1) begin : col
				logic [7:0] neighbors;
				
				// validate positions
				always_comb begin
					if (i-1 >= 0 && j-1 >= 0)
						neighbors[0] = cells[i-1][j-1];
					if (i-1 >= 0)
						neighbors[1] = cells[i-1][j];
					if (i-1 >= 0 && j+1 < GRIDWIDTH)
						neighbors[2] = cells[i-1][j+1];
					if (j-1 >=0)
						neighbors[3] = cells[i][j-1];
					if (j+1 < GRIDWIDTH)
						neighbors[4] = cells[i][j+1];
					if (i+1 < GRIDHEIGHT && j-1 >= 0)
						neighbors[5] = cells[i+1][j-1];
					if (i+1 < GRIDHEIGHT)
						neighbors[6] = cells[i+1][j];
					if (i+1 < GRIDHEIGHT && j+1 < GRIDWIDTH)
						neighbors[7] = cells[i+1][j+1];
				end
				Cell cell_inst(.clk(gol_clk), .rst(rst), .neighbors(neighbors), .default_state(1/*def[i][j]*/), .state(cells[i][j]));
			end
		end
	endgenerate
	
	VGA_PRIMA #(
		.DIVIDE_DISPLAY_V(DIVIDE_DISPLAY_V),
		.DIVIDE_DISPLAY_H(DIVIDE_DISPLAY_H),
		.GRIDWIDTH(GRIDWIDTH),
		.GRIDHEIGHT(GRIDHEIGHT)
	)(
		.cells(cells),
		.MAX10_CLK1_50(MAX10_CLK1_50),
		.rst_sync(KEY),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.VGA_HS(VGA_HS),
		.VGA_VS(VGA_VS)
	);
		
	
endmodule
