module counter #(
	parameter WIDTH = 3)
( 
      input                  clk_i, 
	  input 		         rst_ni,  
	  output reg [WIDTH-1:0] cnt_o  // cnt poate avea 2 la 16 - 1
);

always @ (posedge clk_i or negedge rst_ni) begin
	if (!rst_ni)
		cnt_o <= 0;
	else 
		cnt_o <= cnt_o + 1;
	
end 


// block procedural always si initiall (in testbench)

endmodule 