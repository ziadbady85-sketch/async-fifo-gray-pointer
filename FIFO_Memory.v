module FIFO_Memory (
	input [7:0] wdata ,
	input winc , wclk , rclk , wfull , 
	input [2:0] raddr , waddr ,
	output reg [7:0] rdata );

reg [7:0] mem [0:7] ;

always @(posedge wclk) begin

	if (winc && !wfull) 
		mem[waddr] <= wdata ;
		
end

always @(posedge rclk) begin
	rdata = mem[raddr]  ;
end

endmodule
