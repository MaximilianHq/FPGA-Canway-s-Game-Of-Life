typedef enum logic [7:0] {
    NEUTRAL = 8'hFFFFFF
} clans;

/// TEMP ///



module Cell(
    input logic clk,
    input logic rst,
	 input logic [7:0] neighbors,
    output logic state
);

	logic next_state;
	logic default_state; // ändra till structs senare
	int population; 
	
	// sum neighbors alive
	assign population = neightbors[0] +
							  neightbors[1] +
							  neightbors[2] +
							  neightbors[3] +
							  neightbors[4] +
							  neightbors[5] +
							  neightbors[6] +
							  neightbors[7];
	
	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			nextstate <= default_state;
		end else begin

			// Apply Game of Life rules
			if (state) begin
				 // Cell is alive
				 if (population < 2 || population > 3) begin
					  // Overcrowding or loneliness, cell dies
					  next_state <= 0;
				 end
			end else begin
				 // Cell is dead
				 if (population == 3) begin
					  // Exactly 3 neighbors, cell becomes alive
					  next_state <= 1;
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

	parameter GRIDSIZE = 10;
	parameter GENERATIONS = 10;
	
	logic cells[GRIDSIZE][GRIDSIZE];

	genvar i, j;
	generate
		for (i=0; i<GRIDSIZE; i=i+1) begin : row
			for (j=0; j<GRIDSIZE; j=j+1) begin : col
				logic [7:0] neighbors;
				
				// make condition for index
				always_comb begin
					neightbors[0] = cells[i-1][j-1];
					neightbors[1] = cells[i-1][j];
					neightbors[2] = cells[i-1][j+1];
					neightbors[3] = cells[i][j-1];
					neightbors[4] = cells[i][j+1];
					neightbors[5] = cells[i+1][j-1];
					neightbors[6] = cells[i+1][j];
					neightbors[7] = cells[i+1][j+1];
				end
				
				Cell cell_inst(.clk(clk), .rst(rst), .neighbors(neighbors), .state(cells[i][j]));
			end
		end
	endgenerate
	

//    // Run simulation
//    always_ff @(posedge clk or posedge rst) begin
//        if (rst) begin
//            Cell cells[GRIDSIZE][GRIDSIZE](clk, rst, 0);
//        end else begin
//            // Your Game of Life logic here
//            // Update the state of each cell based on its neighbors
//            for (int i = 0; i < GRIDSIZE; i = i + 1)
//                for (int j = 0; j < GRIDSIZE; j = j + 1) begin
//                    // Count neighbors for the cell at position (i, j)
//                    int neighbors_alive = 0;
//
//                    // Iterate through neighboring cells
//                    for (int ni = i - 1; ni <= i + 1; ni = ni + 1)
//                        for (int nj = j - 1; nj <= j + 1; nj = nj + 1) begin
//                            // Skip the center cell (i, j)
//                            if (ni == i && nj == j)
//                                continue;
//
//                            // Check boundaries to avoid accessing outside the array
//                            if (ni >= 0 && ni < GRIDSIZE && nj >= 0 && nj < GRIDSIZE)
//                                neighbors_alive += cells[ni][nj](.alive);
//                        end
//
//                    // Now neighbors_alive contains the count of alive neighbors for the current cell
//                    cells[i][j].alive_internal <= neighbors_alive;
//                end
//        end
//    end

endmodule
