module traffic_light(
    // The clock is used to time the light changes
    input clk, // System clock
    // The reset is used to initialize the state machine
    input reset_n, // Active-low reset
    // Outputs for the traffic light colors
    output red, // Red light output
    output yellow, // Yellow light output
    output green // Green light output
);

// State encoding
// The "parameter" keyword defines constants
// Each state is represented by a 2-bit value
parameter RED_STATE = 2'b00; // Red state = binary 00
parameter GREEN_STATE = 2'b01; // Green state = binary 01
parameter YELLOW_STATE = 2'b10; // Yellow state = binary 10

// State register to hold the current state
reg [1:0] state; // Current state register
reg [5:0] timer; // Timer register for state duration

// Sequential logic: State transition on clock edge or reset
// The state machine changes state on the rising edge of the clock
// or resets to the initial state when reset is asserted
// The "always" block defines a process that runs on specific events
// Here, it triggers on the rising edge of clk or the falling edge of reset_n
// The "posedge" keyword indicates a rising edge, and "negedge" indicates a falling edge
// This means the block will execute when clk goes from 0 to 1 or reset_n goes from 1 to 0
always @(posedge clk or negedge reset_n) begin
    timer <= timer + 1; // Increment timer each clock cycle
    // If reset is asserted (active low), go to RED_STATE
    if (!reset_n) begin
        state <= RED_STATE; // Initialize to RED_STATE on reset
        timer <= 0; // Reset timer on reset
    end else begin
        // State machine
        case (state)
            RED_STATE: begin    
                // Only transition to GREEN_STATE after 50 clock cycles
                // Here we set timer to 49 because we start counting from 0
                // So when timer reaches 49, it means 50 cycles have passed
                if (timer == 49) begin    
                state <= GREEN_STATE; // From RED to GREEN
                timer <= 0; // Reset timer on state change
                end
            end
            GREEN_STATE: begin    
                if (timer == 49) begin    
                    state <= YELLOW_STATE; // From GREEN to YELLOW
                    timer <= 0; // Reset timer on state change
                end
            end 
            YELLOW_STATE: begin 
                // The yellow light lasts for a shorter duration
                // Here we set timer to 9 for a 10-cycle duration
                // Because we start counting from 0, reaching 9 means 10 cycles have passed
                if (timer == 9) begin
                    state <= RED_STATE; // From YELLOW to RED
                    timer <= 0; // Reset timer on state change
                end
            end
            default: state <= RED_STATE; // Default case (should not occur)
        endcase

    end
end

// Combinational logic: Output logic based on current state
// The outputs are determined by the current state
// Only one light is on at a time
// The "assign" statements create continuous assignments
// This means the outputs will always reflect the current state
assign red = (state == RED_STATE); // Red light is on in RED_STATE
assign green = (state == GREEN_STATE); // Green light is on in GREEN_STATE
assign yellow = (state == YELLOW_STATE); // Yellow light is on in YELLOW_STATE

endmodule