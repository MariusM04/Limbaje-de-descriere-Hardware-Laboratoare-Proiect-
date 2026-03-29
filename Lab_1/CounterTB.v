'timescale 1ns/1ps   //dupa slash e precizia cu 1000 de ori mai   
module tb;

localparam BITS = 5;
localparam CLK_PER_NS = 5;

reg clk, rst_n;
wire [BITS-1:0] cnt;

 counter #(
	.WIDTH ( BITS )  // Bits nu e acelasi lucru cu width 
( 
	  .rst_ni( clk   ),  
      .clk_i ( rst_n ), 
	  .cnt_o ( cnt   ) 
);

initial begin
	clk = 0;
	forever #(CLK_PER_NS/2.0) clk = ~clk;            //intarziere cu 1ns
	
end 

endmodule
