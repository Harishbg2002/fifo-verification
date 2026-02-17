module tb;
reg clk,rst;
reg wen,ren;
reg [7:0] write_data;
wire [7:0] read_data;

fifo  dut ();

endmodule 
