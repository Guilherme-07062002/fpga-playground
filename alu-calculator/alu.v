// First we define the ALU module with inputs and outputs
module alu (
    // We need think, what are the inputs and outputs of an ALU
    // So, we have two operands (A and B), an operation selector as input
    // The "[3:0]" means it's a 4-bit wide bus
    input [3:0] A, // First operand
    input [3:0] B, // Second operand
    input [2:0] operation, // ALU operation select
    // And the result as output
    // The "reg" keyword is needed because we will assign value in an always block
    output reg [3:0] result // ALU result
);

    // Combinational logic: always block triggered on any input change
    // The "*" means "any input signal"
    always @(*) begin 
        // Case statement to select operation based on the operation input
        case (operation)
            // The "3" means it's a 3-bit wide bus
            // The "b" means binary
            // The "000" is the binary value for 0
            // The "001" is the binary value for 1 and so on...
            3'b000: result = A + B;        // Addition
            3'b001: result = A - B;        // Subtraction
            3'b010: result = A & B;        // AND
            3'b011: result = A | B;        // OR
            3'b100: result = A ^ B;        // XOR
            3'b101: result = ~A;           // NOT A
            // Here we add the "4" before the "b" to indicate a 4-bit binary value
            // Because the result is 4 bits wide
            3'b110: result = (A < B) ? 4'b0001 : 4'b0000; // Less than
            3'b111: result = 4'b0000;      // NOP (No operation)
            // If none of the above cases match, we set result to 0
            default: result = 4'b0000;     // Default case
        endcase
    end
endmodule