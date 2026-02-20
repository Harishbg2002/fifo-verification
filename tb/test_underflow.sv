
module tb;
    reg clk;
    reg wen;
    reg ren;
    reg rst;
    reg [7:0] buf_in;
    wire [7:0]buf_out;
    wire buf_full;
    wire buf_empty;
    wire [3:0] fifo_count;
    integer i;
    fifo f(.clk(clk), .wen(wen), .ren(ren), .rst(rst), .buf_in(buf_in), .buf_out(buf_out), .full(buf_full),.empty(buf_empty));
    always #2 clk=~clk;
    initial begin
	   clk = 0;wen = 0;ren  = 0;rst = 0;
      @(negedge clk);
    @(negedge clk)rst = 1;	 
    
      for(i=0; i<12; i=i+1)
     	begin
     	@(negedge clk) wen = 1;ren = 1;buf_in = i + 1;          	
     	end
     	
     	for(i=0; i<12; i=i+1)
     	begin
          @(negedge clk) wen = 1;ren = 0;buf_in = i + 1;   
     	end
     	@(negedge clk);wen = 0;
      for(i=0; i<12; i=i+1)
     	begin
           @(negedge clk) ren = 1;buf_in = 0;  
          	$display("buf_out:%0d  ",buf_out);
     	end
      end
initial begin
#200 $finish;
end
endmodule

