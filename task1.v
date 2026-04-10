/* * PROJECT: 4-bit Arithmetic Logic Unit (ALU)
 * TASK 56: Digital Logic Design with Verilog
 * DELIVERABLE: RTL Code for Addition, Subtraction, AND, OR, NOT
 */

module alu_4bit (
    input [3:0] A, B,      // 4-bit Inputs
    input [2:0] OpCode,    // Operation Selector
    output reg [3:0] ALU_Out,
    output reg CarryOut
);

    always @(*) begin
        case(OpCode)
            3'b000: {CarryOut, ALU_Out} = A + B;       // Addition
            3'b001: {CarryOut, ALU_Out} = A - B;       // Subtraction
            3'b010: ALU_Out = A & B;                   // bitwise AND
            3'b011: ALU_Out = A | B;                   // bitwise OR
            3'b100: ALU_Out = ~A;                      // bitwise NOT
            default: ALU_Out = 4'b0000;
        endcase
    end
endmodule
