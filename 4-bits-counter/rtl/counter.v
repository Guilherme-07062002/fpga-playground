module counter (
    input clk,          // System clock
    input rst_n,        // Active-low reset (industry convention)
    output reg [3:0] out // 4-bit output (0 to 15)
);

    // Sequential logic: triggered on the clock rising edge
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // If reset is 0 (asserted), clear the register
            out <= 4'b0000;
        end else begin
            // Otherwise, increment by 1
            out <= out + 1;
        end
    end

endmodule