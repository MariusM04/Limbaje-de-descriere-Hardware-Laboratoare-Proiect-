`timescale 1ns/1ps 

module test_bench;

localparam N_LEDS      = 10;
localparam CLK_PER_NS  = 10;   // perioada ceasului (10ns => 100MHz)

reg  clk, rst_ni;
reg  enable_i;
wire [N_LEDS-1:0] leds_o;

// Instantierea modulului tau
led_move #(
    .N_LEDS(N_LEDS)
) dut (
    .clk_i     (clk),
    .rst_ni    (rst_ni),
    .enable_i  (enable_i),
    .leds_o    (leds_o)
);

// Generarea semnalului de ceas
initial begin
    clk = 0;
    forever #(CLK_PER_NS/2.0) clk = ~clk;   // .0 ca sa fie real, ca la tine
end

// Secventa de test
initial begin
    // init
    rst_ni   = 0;   // reset activ (activ-low)
    enable_i = 0;

    #(CLK_PER_NS * 2);
    rst_ni = 1;     // scot resetul

    #(CLK_PER_NS * 2);
    enable_i = 1;   // pornesc miscarea

    #(CLK_PER_NS * 30); // las sa ruleze

    enable_i = 0;        // pauza
    #(CLK_PER_NS * 10);

    enable_i = 1;        // reiau
    #(CLK_PER_NS * 30);

    $stop;
end

endmodule