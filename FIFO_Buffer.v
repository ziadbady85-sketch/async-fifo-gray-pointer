module FIFO_Buffer(
	input wclk , rclk , wrst_n , rrst_n , winc , rinc ,
	input [7:0] wdata ,
	output [7:0] rdata ,
	output wfull , empty );

wire [2:0] waddr , raddr ;
wire [3:0] wptr  , rptr , wrptr2 , rwptr2 ;

sync_2ff w2r (.clk(rclk),.rst_n(rrst_n),.sync_in(wptr),.sync_out(rwptr2)) ;
sync_2ff r2w (.clk(wclk),.rst_n(wrst_n),.sync_in(rptr),.sync_out(wrptr2)) ;

FIFO_Write D1 (.wclk(wclk),.wrst_n(wrst_n),.winc(winc),.wptr(wptr),.waddr(waddr),.wrptr2(wrptr2),.wfull(wfull));

FIFO_Memory D2 (.wclk(wclk),.rclk(rclk),.winc(winc),.waddr(waddr),.wfull(wfull),.wdata(wdata),.raddr(raddr),.rdata(rdata)) ;

FIFO_Read  D3 (.rclk(rclk),.rrst_n(rrst_n),.rinc(rinc),.rptr(rptr),.raddr(raddr),.rwptr2(rwptr2),.empty(empty));

endmodule