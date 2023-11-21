typedef enum logic [7:0] { // define clans
	NEUTRAL = 8'hFFFFFF,
	CLAN1 = 8'hFF0000,
	CLAN2 = 8'h00FF00,
	CLAN3 = 8'h0000FF
} clans;

typedef struct packed { // define new cell
	logic alive;
	clans clan;
} entity;

module sentry #(parameter GRID_SIZE);

	initial begin
		entity grid[GRID_SIZE][GRID_SIZE];
	end
	
	function void initialize_grid();
		// initialize every grid entity
		for (int i = 0; i < GRID_SIZE; i = i + 1) begin
			for (int j = 0; j < GRID_SIZE; j = j + 1) begin
				grid[i][j].alive = 0;
				grid[i][j].clan = NEUTRAL;
			end
		end
	endfunction
	
	function automatic void count_neighbours(
		input entity grid[GRID_SIZE][GRID_SIZE],
		input int i, j,
		input int indices[8][2],
		output int neighbours_alive
	);
	
		// itterate through indeces
		for (int k = 0; k < 8; k = k + 1) begin
			int l = i + indices[k][0];
			int m = j + indices[k][1];
			
			// if a neighbour is outside array, treat it as not alive
			if (l < 0 || l >= GRID_SIZE ||
				 m < 0 || m >= GRID_SIZE) begin
				continue;
			end
				
			// check if neighbour is alive
			else if (grid[l][m].alive == 1) begin
				neighbours_alive = neighbours_alive + 1;
			end
		end
		
	endfunction
	
	/*function automatic void get_next_gen ()
		//apply gamertules
		
	endfunction*/

endmodule

module GameOfLife ();
	parameter GRID_SIZE = 2;
	parameter GENERATIONS = 10; // amount of simulation steps
	
	int indices[8][2] = '{ { -1, -1 }, { -1, 0 }, { -1, 1 }, { 0, -1 }, { 0, 1 }, { 1, -1 }, { 1, 0 }, { 1, 1 } };
	
	// create first grid
	sentry #(GRID_SIZE) grid_inst;
	
	// array to store grid generation
	sentry #(GRID_SIZE) evolution[0:GENERATIONS-1];

	//initialize first grid
	grid_inst.initialize_grid();
	
	// store first generation
	evolution[0] = grid_inst;
		
	// run simulation
	/*
	for (int gen = 1; gen < GENERATIONS; gen = gen + 1) begin
		// generate next generation
		grid_inst.get_next_gen();
		// store the new generation
		evolution[gen] = grid_inst;
	end
	*/
	
endmodule