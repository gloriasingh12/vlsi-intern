# Synchronous RAM Design (Task 57)

### 1. Verilog Code (RTL)
```verilog
module sync_ram (
    input clk, we,
    input [3:0] addr,
    input [7:0] data_in,
    output reg [7:0] data_out
);
    // 16x8 Memory Array
    reg [7:0] ram_block [15:0];

    always @(posedge clk) begin
        if (we) ram_block[addr] <= data_in; // Write Logic
        else data_out <= ram_block[addr];   // Read Logic
    end
endmodule
