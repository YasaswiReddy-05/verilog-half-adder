`timescale 1ns/1ns
`include "half_adder.v"

module half_adder_tb;

    reg a, b;       // Inputs
    wire s, c;      // Outputs

    // Instantiate DUT (Device Under Test)
    half_adder dut (.a(a), .b(b), .s(s), .c(c));

    initial begin
        $dumpfile("half_adder_tb.vcd");   // waveform file
        $dumpvars(0, half_adder_tb);

        $display("Time\t a b | s c");
        $monitor("%g\t %b %b | %b %b", $time, a, b, s, c);

        // Apply all input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish; 
    end

endmodule
