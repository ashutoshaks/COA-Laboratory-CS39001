`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:12:09 11/07/2021
// Design Name:   barrel_shifter
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/lookahead_carry_unit_tb.v
// Project Name:  Assn-7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barrel_shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
// Testbench for Look-ahead carry unit module
module lookahead_carry_unit_tb;

    // Inputs
    reg [3:0] p = 4'b0000, g = 4'b0000;
    reg c_in = 1'b0;

    // Outputs
    wire [3:0] carry;
    wire c_out, P, G;

    // Instantiate the unit under test
    lookahead_carry_unit LCU(.p(p), .g(g), .c_in(c_in), .c(carry), .c_out(c_out), .P(P), .G(G));

    initial begin
        // Monitor the changes
        $monitor("input propagates = %b, input generates = %b, c_in = %b, carry(s) = %b, c_out = %b, LCU propagate = %b, LCU generate = %b", p, g, c_in, carry, c_out, P, G);
        
        // Stimulus to verify the working of the look-ahead carry unit
        #5 p = 4'b1111; g = 4'b0110;
        #5 p = 4'b1101; g = 4'b0010;
        #5 p = 4'b1100; g = 4'b1001;
        #5 $finish;
    end
endmodule