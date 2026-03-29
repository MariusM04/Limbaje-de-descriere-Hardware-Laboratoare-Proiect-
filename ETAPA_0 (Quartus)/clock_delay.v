module clock_delay #(
    parameter CLK_FREQ = 5_000_000_000
)(
    input clk,
    input rst_n,
    input [7:0] delay_s,
	output reg step
    
);

    //---------------------------------
    // localparam
    //---------------------------------
    localparam CNT_WIDTH = 32;
	
    //---------------------------------
    // calcul cicluri
    //---------------------------------
    wire [CNT_WIDTH-1:0] max_count;
    assign max_count = delay_s * CLK_FREQ;

    //---------------------------------
    // counter
    //---------------------------------
    reg [CNT_WIDTH-1:0] cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt  <= 0;
            step <= 0;
        end else if (cnt >= max_count - 1) begin
            cnt  <= 0;
            step <= 1;
        end else begin
            cnt  <= cnt + 1;
            step <= 0;
        end
    end

endmodule