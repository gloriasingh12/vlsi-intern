# 4-Stage Pipelined Processor Design (Task 58)

### 1. Verilog Code (RTL Logic)
```verilog
module pipeline_processor (
    input clk, reset,
    input [15:0] instr_in, // Input Instruction
    output reg [7:0] alu_result
);
    // Pipeline Registers
    reg [15:0] IF_ID_instr;
    reg [7:0]  ID_EX_A, ID_EX_B;
    reg [1:0]  ID_EX_op;
    reg [7:0]  EX_MEM_res;

    // Stage 1: Instruction Fetch (IF)
    always @(posedge clk) begin
        if (reset) IF_ID_instr <= 0;
        else IF_ID_instr <= instr_in;
    end

    // Stage 2: Decode (ID)
    always @(posedge clk) begin
        ID_EX_op <= IF_ID_instr[15:14]; // OpCode
        ID_EX_A  <= IF_ID_instr[13:7];  // Operand A
        ID_EX_B  <= IF_ID_instr[6:0];   // Operand B
    end

    // Stage 3: Execute (EX)
    always @(posedge clk) begin
        case(ID_EX_op)
            2'b00: EX_MEM_res <= ID_EX_A + ID_EX_B; // ADD
            2'b01: EX_MEM_res <= ID_EX_A - ID_EX_B; // SUB
            2'b10: EX_MEM_res <= ID_EX_A;           // LOAD
            default: EX_MEM_res <= 0;
        endcase
    end

    // Stage 4: Write Back (WB)
    always @(posedge clk) begin
        alu_result <= EX_MEM_res;
    end
endmodule
