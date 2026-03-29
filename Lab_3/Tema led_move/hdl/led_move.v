module led_move #(
    parameter N_LEDS = 10
)(
    input  wire clk_i,
    input  wire rst_ni,
    input  wire enable_i,
    output reg  [N_LEDS-1:0] leds_o
);

always @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
        // LSB=1
        leds_o <= {{(N_LEDS-1){0}}, 1};
    end else if (enable_i) begin
        // daca MSB=1 sari la inceput
        if (leds_o[N_LEDS-1] == 1)
            leds_o <= {{(N_LEDS-1){0}}, 1};
        else
            leds_o <= leds_o << 1;
    end	
end

endmodule