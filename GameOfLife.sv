
//NOTE, None of this code is copied nor had we an leading example 
//and therefore we have simply tried to translate c++ code, as it isn't that complicated.
//therefore we are sure tries to do things than cannot be implemented on the fpga
//or that use a lot of uneccesary memmory and processes.
//
//the idea is that we create a module for our grid that has some functions such as the game logic
//and then we store every instance of those modules so that we can play back the timeline later on.
//the main problem is that it wount accept our module as a datatype / object.
//we have notet that oop doesen't really work which migch be part of the issue.

typedef enum logic [7:0] { // define clans
	NEUTRAL = 8'hFFFFFF
} clans;

typedef struct{ // define new cell
	logic alive;
	clans clan;
} entity;

parameter GRIDSIZE = 10;

typedef struct{ // define grid;
	entity grid[GRIDSIZE][GRIDSIZE];
} grid_layout;

module GameOfLife ();
	localparam GENERATIONS = 10; // amount of simulation steps
	
	// positions for surrounding neighbours
	// packed array
	int indices[8][2] = '{ '{-1, -1}, '{-1, 0}, '{-1, 1}, '{0, -1}, '{0, 1}, '{1, -1}, '{1, 0}, '{1, 1} };
	
	function void initiate_grid(ref grid_layout grid_inst);
		// initialize every grid entity
		for (int i = 0; i < GRIDSIZE; i = i + 1)
			for (int j = 0; j < GRIDSIZE; j = j + 1) begin
				grid_inst.grid[i][j].alive = 0;
				grid_inst.grid[i][j].clan = NEUTRAL;
				
			end
	endfunction
	
	function automatic void count_neighbours(
	input grid_layout grid_inst, // maybe i dont have to include things that already are inside the module??? ex: grid
	input int i, j,
	output int neighbours_alive
	);
	
		// itterate through indeces
		for (int k = 0; k < 8; k = k + 1) begin
			int l = i + indices[k][0];
			int m = j + indices[k][1];
			
			// if an indice is outside the array, skip over it
			if (l < 0 || l >= GRIDSIZE ||
				 m < 0 || m >= GRIDSIZE)
				continue;
				
			// check if neighbour is alive
			else if (grid_inst[l][m].alive == 1)
				neighbours_alive = neighbours_alive + 1;
				
		end
		
	endfunction
	
//	function get_next_gen(ref grid_layout grid);
//		
//		// game logic goes here...
//		// call function get_neighbours
//		
//	endfunction

	// create first grid
	grid_layout grid_init; // THIS IS NOT WORKING //
	
	// array to store grid generation
	grid_layout evolution[GENERATIONS]; // THIS IS NOT WORKING //
	
	initial begin
	
		// initialize first grid
		initiate_grid(grid_init);
		
		// save first generation
		evolution[0] = grid_init;
	
	end
	
		
	// run simulation
	for (int gen = 1; gen < GENERATIONS; gen = gen + 1) begin
		// copy previous generation
		grid_layout grid_inst = evolution[gen-1];
		// generate next generation
//		get_next_gen(grid_inst);
		// store the new generation
		evolution[gen] = grid_inst;
	end
	
endmodule