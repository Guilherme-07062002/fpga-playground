`timescale 1ns / 1ps // Define the time unit (1 nanosecond)

module tb_counter;

    // Signals to connect to our module
    reg clk;
    reg rst_n;
    wire [3:0] out;

    // Instantiate our Design (DUT - Device Under Test)
    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .out(out)
    );

    // 1. Clock generator (This simulates the board oscillator)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Inverte o clock a cada 5ns (Período = 10ns)
    end

    // 2. Test script
    initial begin
        // Configure waveform dump file location (write directly to build/)
        $dumpfile("build/waves.vcd"); // Output file name
        $dumpvars(0, tb_counter); // Save all variables from this module

        // Test scenario
        $display("Starting simulation...");

        rst_n = 0; // Hold reset asserted
        #20;       // Wait 20ns
        rst_n = 1; // Release reset (start counting)

        #200;      // Let it run for 200ns (counter will increment)

        rst_n = 0; // Assert reset again to observe clearing
        #20;
        rst_n = 1;

        #50;
        $display("End of simulation.");
        $finish; // End simulation
    end

endmodule