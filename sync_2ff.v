module sync_2ff (
    input   clk,
    input   rst,
    input   [3:0] sync_in,
    output reg  [3:0] sync_out
);

reg [3:0] ff1;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        ff1 <= 0;
        sync_out <= 0;
    end
    else begin
        ff1 <= sync_in;
        sync_out <= ff1;
    end
end

endmodule
