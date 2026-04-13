module FIFO_Write(
	input wclk , wrst , winc ,
	input  [3:0] wrptr2 , 
	output reg [3:0] wptr ,
	output [2:0] waddr,
	output wfull);

reg [3:0] wptr_bin ;

assign wfull = (wptr == {~wrptr2[3:2], wrptr2[1:0]});

always @(posedge wclk or posedge wrst) begin
	if (wrst) begin
		wptr_bin <= 0 ;
		wptr <= 0 ;
	end
	else if (winc && !wfull) begin
		wptr_bin <= wptr_bin + 1 ;
        wptr <= ((wptr_bin+1)>>1) ^ (wptr_bin + 1 ) ;
	end
end

assign waddr = wptr_bin[2:0] ;

endmodule 
