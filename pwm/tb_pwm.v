module tb_pwm;
    reg clk;
    reg reset_n;
    reg [7:0] duty;
    // The "wire" keyword is used for signals that are driven by the DUT (Device Under Test)
    // This means we cannot assign values to them in the testbench
    // They will get their values from the pwm module
    wire pwm_out;

    // Instantiate our pwm module (DUT - Device Under Test)
    // We connect the signals defined above to the pwm ports
    // "uut" stands for "Unit Under Test"
    // The dot notation connects the module ports to the testbench signals
    pwm uut (
        .clk(clk),
        .reset_n(reset_n),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    always begin
        clk = 0;
        #5; // Wait 5 time units
        clk = 1;
        #5; // Wait another 5 time units
    end
    
    always @(posedge pwm_out) begin
        $display("[Time %0t]: PWM output is HIGH", $time);
    end

    always @(negedge pwm_out) begin
        $display("[Time %0t]: PWM output is LOW", $time);
    end

    initial begin
        $dumpfile("waves.vcd"); // Output file name
        $dumpvars(0, tb_pwm); // Save all variables from this module
        
        $display("Starting PWM simulation...");
        // Initialize signals
        clk = 0;
        reset_n = 0; // Start with reset asserted
        #15;          // Wait 15 time units
        reset_n = 1; // Release reset

        // Set initial duty cycle
        duty = 8'd128; // Set duty cycle to 50%
        // Run the simulation for a certain period
        #3000;        // Let it run for 3000 time units

        // Change duty cycle to 75%
        duty = 8'd192;
        #3000;        // Let it run for another 3000 time units

        // Change duty cycle to 25%
        duty = 8'd64;
        #3000;        // Let it run for another 3000 time units
        
        $display("End of PWM simulation.");
        $finish; // End simulation
    end
endmodule