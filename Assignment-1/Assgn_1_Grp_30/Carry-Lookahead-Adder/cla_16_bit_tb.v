`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:30:05 08/25/2021
// Design Name:   
// Module Name:   cla_16_bit_tb
// Project Name:  Carry-Lookahead-Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla_16_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// 
////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 1
   Problem No. - 2
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

// Testbench for 16-bit carry look-ahead adder module using the look-ahead carry unit
module cla_16_bit_tb;

    // Inputs
    reg [15:0] A = 16'd0, B = 16'd0;
    reg c_in = 1'b0;

    // Outputs
    wire [15:0] sum;
    wire c_out, P, G;

    // Instantiate the unit under test
    cla_16_bit CLA(.a(A), .b(B), .c_in(c_in), .sum(sum), .c_out(c_out), .P(P), .G(G));

    initial begin
        // Monitor the changes
        $monitor("A = %d, B = %d, c_in = %b, sum = %d, c_out = %b, block propagate = %b, block generate = %b", A, B, c_in, sum, c_out, P, G);
        
        // Stimulus to verify the working of the 4-bit carry look-ahead adder
        #5 A = 16'd414; B = 16'd1036;
        #5 A = 16'd5045; B = 16'd45042;
        #5 A = 16'd32768; B = 16'd32768;
        #5 A = 16'd65535; B = 16'd65535;
        #5 $finish;
    end
endmodule
