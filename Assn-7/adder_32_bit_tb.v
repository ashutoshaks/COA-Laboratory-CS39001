`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:22:50 11/07/2021
// Design Name:   adder_32_bit
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/adder_32_bit_tb.v
// Project Name:  Assn-7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder_32_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
// Testbench for the 32-bit ripple carry adder module
module adder_32_bit_tb;

    // Inputs
    reg [31:0] A = 32'd0, B = 32'd0;
    reg c_in = 1'b0;

    // Outputs
    wire [31:0] sum;
    wire c_out;

    // Instantiate the unit under test
    adder_32_bit UUT(.a(A), .b(B), .c_in(c_in), .sum(sum), .c_out(c_out));

    initial begin
        // Monitor the changes
        $monitor("A = %d, B = %d, c_in = %b, sum = %d, c_out = %b", A, B, c_in, sum, c_out);
        
        // Stimulus to verify the working of the 32-bit ripple carry adder
        #5 A = 32'd1024; B = 32'd4096;
        #5 A = 32'd34343434; B = 32'd8123659;
        #5 A = 32'd4294967295; B = 32'd4294967295;
        #5 $finish;
    end
endmodule