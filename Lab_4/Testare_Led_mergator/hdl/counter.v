module counter #(
parameter WIDTH        = 28,      // cat de lung sa fie delay-ul
parameter LED_WIDTH    = 10,
parameter CNT_STOP     = 2500000000       
)(
    input                       clk_i,
    input                       rst_ni,
    output reg [LED_WIDTH-1:0]  led_o
);

reg [WIDTH-1:0] cnt_o;

always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni)
        cnt_o <= 0;
    else if (cnt_o == CNT_STOP)
        cnt_o <= 0;
    else
        cnt_o <= cnt_o + 1;
end




always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
        led_o <= 1;          
    end
	 
    else if (cnt_o == CNT_STOP) begin
        if (led_o == (1 << (LED_WIDTH-1)))
            led_o <= 1;      
        else
            led_o <= led_o << 1;  
    end
end

endmodule