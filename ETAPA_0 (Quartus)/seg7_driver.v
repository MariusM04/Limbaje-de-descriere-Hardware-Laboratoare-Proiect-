module seg7_driver(
    input row,
    input [2:0] col,

    output reg [7:0] HEX0,
    output reg [7:0] HEX1,
    output reg [7:0] HEX2,
    output reg [7:0] HEX3,
    output reg [7:0] HEX4,
    output reg [7:0] HEX5
);

    //---------------------------------
    // pattern-uri (active LOW)
    //---------------------------------
    localparam UP   = 8'b10011100; // seg: 0,1,5,6
    localparam DOWN = 8'b10100011; // seg: 2,3,4,6
    localparam OFF  = 8'b11111111;

    reg [7:0] seg [5:0];
    integer i;

    //---------------------------------
    // logică
    //---------------------------------
    always @(*) begin
        for (i = 0; i < 6; i = i + 1) begin
            if (i == col) begin
                if (row)
                    seg[i] = UP;
                else
                    seg[i] = DOWN;
            end else begin
                seg[i] = OFF;
            end
        end
    end

    //---------------------------------
    // mapping
    //---------------------------------
    always @(*) begin
        HEX0 = seg[0];
        HEX1 = seg[1];
        HEX2 = seg[2];
        HEX3 = seg[3];
        HEX4 = seg[4];
        HEX5 = seg[5];
    end

endmodule