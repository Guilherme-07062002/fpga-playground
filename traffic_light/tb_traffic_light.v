module tb_traffic_light;
    // The "reg" keyword is used for signals that we will drive in the testbench
    // This means we can assign values to them in the testbench
    reg clk;
    reg reset_n;
    // The "wire" keyword is used for signals that are driven by the DUT (Device Under Test)
    // This means we cannot assign values to them in the testbench
    // They will get their values from the traffic_light module
    wire red;
    wire yellow;
    wire green;

    // Instantiate our traffic_light module (DUT - Device Under Test)
    // We connect the signals defined above to the traffic_light ports
    // "uut" stands for "Unit Under Test"
    // The dot notation connects the module ports to the testbench signals
    traffic_light uut (
        .clk(clk),
        .reset_n(reset_n),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // 1. Clock generator (This simulates the board oscillator)
    always begin
        clk = 0;
        #5; // Wait 5 time units
        clk = 1;
        #5; // Wait another 5 time units
    end

    always @(posedge red) begin
        $display("[Time %0t]: RED light is ON", $time);
    end

    always @(posedge yellow) begin
        $display("[Time %0t]: YELLOW light is ON", $time);
    end

    always @(posedge green) begin
        $display("[Time %0t]: GREEN light is ON", $time);
    end

    initial begin 
        $dumpfile("waves.vcd"); // Output file name
        $dumpvars(0, tb_traffic_light); // Save all variables from this module

        $display("Starting traffic light simulation...");
        // Initialize signals
        clk = 0;
        reset_n = 0; // Start with reset asserted
        #15;          // Wait 15 time units
        reset_n = 1; // Release reset
        // Run the simulation for a certain period
        #2000;        // Let it run for 2000 time units
        $display("End of traffic light simulation.");
        $finish; // End simulation
    end
endmodule