# Digital FIR Filter Design (Task 59)

### 1. Verilog Code (RTL Logic)
```verilog
module fir_filter (
    input clk, reset,
    input signed [7:0] data_in,    // 8-bit Input Signal
    output reg signed [15:0] data_out // 16-bit Filtered Output
);
    // Filter Coefficients (3-tap example)
    parameter b0 = 8'd2;
    parameter b1 = 8'd4;
    parameter b2 = 8'd2;

    // Delay Line (Registers)
    reg signed [7:0] x1, x2;

    always @(posedge clk) begin
        if (reset) begin
            x1 <= 0;
            x2 <= 0;
            data_out <= 0;
        end else begin
            // Shift Delay Line
            x1 <= data_in;
            x2 <= x1;

            // FIR Equation: y(n) = b0*x(n) + b1*x(n-1) + b2*x(n-2)
            data_out <= (b0 * data_in) + (b1 * x1) + (b2 * x2);
        end
    end
endmodule
