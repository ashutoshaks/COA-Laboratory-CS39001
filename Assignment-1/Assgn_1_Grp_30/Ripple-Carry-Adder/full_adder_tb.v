`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:28:16 08/25/2021
// Design Name:   
// Module Name:   full_adder_tb
// Project Name:  Ripple-Carry-Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// 
////////////////////////////////////////////////////////////////////////////////

/*
   Assignment No. - 1
   Problem No. - 1
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

// Testbench for full adder module
module full_adder_tb;

    // Inputs
    reg A = 1'b0, B = 1'b0, c_in = 1'b0;

    // Outputs
    wire sum, c_out;

    // Instantiate the unit under test
    full_adder FA(.a(A), .b(B), .c_in(c_in), .sum(sum), .c_out(c_out));

    initial begin
        // Monitor the changes
        $monitor("A = %b, B = %b, c_in = %b, sum = %b, c_out = %b", A, B, c_in, sum, c_out);
        
        // Stimulus to verify the working of the full adder
        #5 A = 1'b0; B = 1'b0; c_in = 1'b1;
        #5 A = 1'b0; B = 1'b1; c_in = 1'b0;
        #5 A = 1'b0; B = 1'b1; c_in = 1'b1;
        #5 A = 1'b1; B = 1'b0; c_in = 1'b0;
        #5 A = 1'b1; B = 1'b0; c_in = 1'b1;
        #5 A = 1'b1; B = 1'b1; c_in = 1'b0;
        #5 A = 1'b1; B = 1'b1; c_in = 1'b1;
        #5 $finish;
    end
endmodule
