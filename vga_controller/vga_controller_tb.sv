`timescale 1ns/1ps

module sync_pulse_generator_tb();
  logic i_clk, i_rst_n;
  logic o_hsync_n, o_vsync_n;
  logic o_hblank_n, o_vblank_n;

  logic [10:0] pixel_counter;
  logic [10:0] line_counter;
  integer fd; // File handle

  sync_pulse_generator dut (.i_clk, .i_rst_n, .o_hsync_n, .o_vsync_n, .o_hblank_n, .o_vblank_n);

  // Generate clock pulses
  always begin
    #5; i_clk = ~i_clk;
  end
  
  // Count the number of pixels per line
  // A pixel is drawn each clock edge
  always begin
    @(posedge i_clk) pixel_counter <= pixel_counter + 1;
  end

  // New line when the horizontal blank pulse rises
  // Count each new line, and reset the pixel count
  always begin 
    @(negedge o_hsync_n) begin 
      line_counter <= line_counter + 1;
      pixel_counter <= 0;
    end
  end

  // Initialize variables and write values to the file
  initial begin
    i_clk <= 0;
    i_rst_n <= 0;
    pixel_counter <= 0;
    line_counter <= 1;
    #10; i_rst_n <= 1;  // reset
    pixel_counter <= 0;
    line_counter <= 1;
    forever begin
      #10;
      // Write the line number, and whether the vertical blank/sync pulses are low or high
      // vblank should fall at line 481 and rise at line 525 (525th line will be a new frame)
      // vsync should fall at line 481+11=492 and rise at 492+2=494
      $fwrite(fd, "%d %b %b", line_counter, o_vblank_n, o_vsync_n);
      // Write the number of pixels counted when the front porch is reached (should be 640)
      @(posedge o_hsync_n) $fwrite(fd, "%d ", pixel_counter);
      // Write the number of pixels counted when the hsync pulse falls (should be 640+16=656)
      @(posedge o_hblank_n) $fwrite(fd, "%d ", pixel_counter);
      // Write the number of pixels counted when the hsync pulse rises (should be 656+96=752)
      @(negedge o_hblank_n) $fwrite(fd, "%d ", pixel_counter);
      // Write the number of pixels counted when the back porch is reached (should be 752+8=800)
      @(negedge o_hsync_n) $fwrite(fd, "%d\n", pixel_counter);
    end
  end

  // Set simulation length, and open and close the file
  initial begin
    fd = $fopen("./tb_results.txt");
    $fwrite(fd, "Line VBlank VSync HSync BackPorch Display FrontPorch\n"); // Header
    #4320000; // Run long enough to display an entire frame plus a few extra lines
    $fclose(fd);
    $stop; 
  end

endmodule