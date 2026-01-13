// First we define the testbench module for the ALU
module tb_alu;
    // Signals to connect to our ALU module
    // The "reg" keyword is used for signals that will be driven in initial or always blocks
    // This means we can assign values to them in the testbench
    reg [3:0] A, B;
    reg [2:0] operation;
    // The "wire" keyword is used for signals that are driven by the DUT (Device Under Test)
    // This means we cannot assign values to them in the testbench
    // They will get their values from the ALU module
    wire [3:0] result;

    // Instantiate our ALU module (DUT - Device Under Test)
    // We connect the signals defined above to the ALU ports
    // "uut" stands for "Unit Under Test"
    // The dot notation connects the module ports to the testbench signals
    alu uut (
        .A(A),
        .B(B),
        .operation(operation),
        .result(result)
    );

    // Clock generator is not needed for combinational ALU
    // Test script
    // "initial" block runs once at the start of the simulation
    initial begin 
        // "dumpfile" specifies the output file for waveform data
        $dumpfile("waves.vcd"); // Output file name
        // "dumpvars" specifies which variables to record in the waveform
        $dumpvars(0, tb_alu); // Save all variables from this module

        // Test scenario
        $display("Starting ALU simulation...");

        // Testing addition
        A = 4'b0011; // 3
        B = 4'b0101; // 5
        operation = 3'b000; // Addition
        // Wait for some time to observe the result
        // The time unit depends on the `timescale` directive (default is 1ns)
        #10; // Wait 10 time units
        // The "display" command prints to the console
        // We print the inputs and the result
        // "%d" formats the number as decimal
        $display("A=%d, B=%d, operation=ADD, result=%d", A, B, result);

        // Testing subtraction
        operation = 3'b001; // Subtraction
        #10;
        $display("A=%d, B=%d, operation=SUB, result=%d", A, B, result);

        // Testing AND
        operation = 3'b010; // AND
        #10;
        $display("A=%d, B=%d, operation=AND, result=%d", A, B, result);

        // Testing OR
        operation = 3'b011; // OR
        #10;
        $display("A=%d, B=%d, operation=OR, result=%d", A, B, result);

        // Testing XOR
        operation = 3'b100; // XOR
        #10;
        $display("A=%d, B=%d, operation=XOR, result=%d", A, B, result);

        // Testing NOT A
        operation = 3'b101; // NOT A
        #10;
        $display("A=%d, operation=NOT A, result=%d", A, result);

        // Testing Less than
        operation = 3'b110; // Less than
        #10;
        $display("A=%d, B=%d, operation=LT, result=%d", A, B, result);

        // Testing NOP
        operation = 3'b111; // NOP
        #10;
        $display("A=%d, B=%d, operation=NOP, result=%d", A, B, result);

        $display("End of ALU simulation.");
        $finish; // End simulation
    end
endmodule