//module color_select(input logic status, output logic [3:0] rgb [2:0]);
//	always_comb begin
//		if(status) begin
//			rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//			rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//			rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//		end else begin
//			rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//			rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//			rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//		end
//	end
//endmodule
//
//if(lines <= DIVIDE_DISPLAY_H) begin
//	
//		if(pixel_count < DIVIDE_DISPLAY_V) begin
//			always_comb begin
//				if(m[0][0]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (2	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][1]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (3	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][2]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (4	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][3]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (5	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][4]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (6	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][5]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end		
//		end
//		else if(pixel_count < (7	*DIVIDE_DISPLAY_V)) begin	
//			always_comb begin
//				if(m[0][6]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (8	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][7]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (9	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][8]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (10	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][9]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (11	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][10]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (12	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][11]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (13	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][12]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (14	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][13]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (15	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][14]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (16	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][15]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (17	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][16]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (18	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][17]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end
//		else if(pixel_count < (19	*DIVIDE_DISPLAY_V)) begin
//			always_comb begin
//				if(m[0][18]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end
//		end else 												  begin	
//			always_comb begin
//				if(m[row][column]) begin
//					rgb[2] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[1] = {1'h1,1'h1,1'h1,1'h1};
//					rgb[0] = {1'h1,1'h1,1'h1,1'h1};
//				end else begin
//					rgb[2] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[1] = {1'h0,1'h0,1'h0,1'h0};
//					rgb[0] = {1'h0,1'h0,1'h0,1'h0};
//				end
//			end	
//		end
//	end
//	end else if(lines <= (2*DIVIDE_DISPLAY_H)) begin
//		
//	end else if(lines <= (3*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (4*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (5*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (6*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (7*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (8*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (9*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (10*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (11*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (12*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (13*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (14*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (15*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (16*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (17*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (18*DIVIDE_DISPLAY_H)) begin
//	
//	end else if(lines <= (19*DIVIDE_DISPLAY_H)) begin
//	
//	end else
//	
//	end