module walking_led(
    input clk,
    input rst_n,
    input step,

    output reg [2:0] col,
    output reg row,
    output [5:0] led
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            col <= 0;
            row <= 1; // start sus
        end else if (step) begin

            if (row == 1) begin
                // SUS: HEX0 → HEX5
                if (col == 5) begin
                    row <= 0;
                end else begin
                    col <= col + 1;
                end

            end else begin
                // JOS: HEX0 → HEX5
                if (col == 0) begin
                    row <= 1;
                end else begin
                    col <= col - 1;
                end

            end

        end
    end

    assign led = 1 << col;

endmodule