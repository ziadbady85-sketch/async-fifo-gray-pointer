`timescale 1ns/1ps

module async_FIFO_tb();

reg wclk , rclk , wrst_n , rrst_n , winc , rinc ;
reg [7:0] wdata ;
wire [7:0] rdata ;
wire wfull , empty ;

FIFO_Buffer DUT (.wclk(wclk),.rclk(rclk),.wrst_n(wrst_n),.rrst_n(rrst_n),.winc(winc),.rinc(rinc),.wdata(wdata),
	             .rdata(rdata),.wfull(wfull),.empty(empty));


initial begin
	wclk = 0 ;
	rclk = 0 ;
	forever begin
		#2 wclk = ~wclk ;
		#3 rclk = ~rclk ;
	end
end

initial begin
	wrst_n = 0 ;
	rrst_n = 0 ;
	winc   = 0 ;
	rinc   = 0 ;
	wdata  = 0 ;
	#10 ;
	wrst_n = 1 ;
	rrst_n = 1 ;
	winc   = 1 ;
	rinc   = 0 ;
	repeat(5) begin
		wdata  = $random ;
		#4 ;
	end 
	winc   = 0 ;
	rinc   = 1 ;
	#80 ;
	winc   = 1 ;
	rinc   = 1 ;
	repeat(5) begin
		wdata  = $random ;
		#10 ;
	end

	$stop;
end

endmodule