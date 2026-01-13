module pwm(
    // The "wire" keyword is optional for ports, but added here for clarity
    // The wire keyword indicates that these ports are connections rather than storage elements
    input wire clk,          // System clock
    input wire reset_n,        // Active-low reset
    // The duty cycle input (0-255 for 8-bit resolution)
    input wire [7:0] duty, // 8-bit duty cycle input (0-255)
    // The "reg" keyword means this port will hold its value until explicitly changed
    output reg pwm_out      // PWM output signal
);

reg [7:0] counter; // 8-bit counter register

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        counter <= 8'b0; // Reset counter to 0 on reset
        pwm_out <= 1'b0; // Set PWM output low on reset
    end else begin
        counter <= counter + 1; // Increment counter on each clock cycle

        // Compare counter with duty cycle to set PWM output
        if (counter < duty) begin
            pwm_out <= 1'b1; // Set PWM output high if counter is less than duty
        end else begin
            pwm_out <= 1'b0; // Set PWM output low otherwise
        end
    end
end
endmodule