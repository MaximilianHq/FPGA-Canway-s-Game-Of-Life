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

module GameOfLife2(
	input logic clk,
	input logic rst
);
	parameter GRIDSIZE = 3;
	
	logic cells[GRIDSIZE][GRIDSIZE];
	logic def[3][3] = '{'{0,0,0},'{1,1,1},'{0,0,0}}; // packed array

	genvar i, j;
	generate		
		for (i=0; i<GRIDSIZE; i=i+1) begin : row
			for (j=0; j<GRIDSIZE; j=j+1) begin : col
				logic [7:0] neighbors = 8'b00000000;
				
				// validate positions
				always_comb begin
					if (i-1 >= 0 && j-1 >= 0)
						neighbors[0] = cells[i-1][j-1];
					if (i-1 >= 0)
						neighbors[1] = cells[i-1][j];
					if (i-1 >= 0 && j+1 < GRIDSIZE)
						neighbors[2] = cells[i-1][j+1];
					if (j-1 >=0)
						neighbors[3] = cells[i][j-1];
					if (j+1 < GRIDSIZE)
						neighbors[4] = cells[i][j+1];
					if (i+1 < GRIDSIZE && j-1 >= 0)
						neighbors[5] = cells[i+1][j-1];
					if (i+1 < GRIDSIZE)
						neighbors[6] = cells[i+1][j];
					if (i+1 < GRIDSIZE && j+1 < GRIDSIZE)
						neighbors[7] = cells[i+1][j+1];
				end
				Cell cell_inst(.clk(clk), .rst(rst), .neighbors(neighbors), .default_state(def[i][j]), .state(cells[i][j]));
			end
		end
	endgenerate
endmodule
