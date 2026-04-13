module FIFO_Read(
	input rclk , rrst , rinc ,
	input [3:0] rwptr2 ,
	output [2:0] raddr ,
	output reg [3:0] rptr ,
	output empty) ;

reg [3:0] rptr_bin ;

assign empty = (rptr==rwptr2)? 1 : 0  ;

always @(posedge rclk or posedge rrst) begin
	if (rrst) begin
		rptr <= 0 ;
		rptr_bin <= 0 ;
		
	end
	else if (rinc && !empty) begin
		rptr_bin <= rptr_bin + 1 ;
		rptr <= ((rptr_bin + 1) >> 1) ^ (rptr_bin + 1) ;
	end
end

assign raddr = rptr_bin[2:0] ;

endmodule
