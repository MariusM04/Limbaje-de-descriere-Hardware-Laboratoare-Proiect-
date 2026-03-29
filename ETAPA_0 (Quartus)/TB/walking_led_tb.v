`timescale 1ns/1ps

module walking_led_tb;

    reg clk;
    reg rst_n;
    reg step;

    wire [2:0] col;
    wire row;
    wire [5:0] led;

    // DUT
    walking_led dut (
        .clk(clk),
        .rst_n(rst_n),
        .step(step),
        .col(col),
        .row(row),
        .led(led)
    );

    // clock
    always #5 clk = ~clk;

    // generare step (impuls rar)
    always begin
        step = 0;
        #40;
        step = 1;
        #10;
    end

    initial begin
        clk = 0;
        rst_n = 0;
        step = 0;

        #20;
        rst_n = 1;

        #500;
        $stop;
    end

    initial begin
        $monitor("t=%0t | row=%b col=%d led=%b",
                 $time, row, col, led);
    end

endmodule