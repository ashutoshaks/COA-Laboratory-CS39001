`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:34:37 11/08/2021
// Design Name:   ALU
// Module Name:   /home/vanshita/COA-Laboratory-CS39001/Assn-7/register_file_tb.v
// Project Name:  Assn-7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module register_file_tb;
    // Inputs
    reg [4:0] rs;
    reg [4:0] rt;
    reg regWrite;
    reg [4:0] writeReg;
    reg [31:0] writeData;
    reg clk;
    reg rst;

    // Outputs
    wire [31:0] readData1;
    wire [31:0] readData2;
    
    // Instantiate the unit under test
    register_file registerFile1 (
        .clk(clk),
        .rst(rst),
        .rs(rs), 
        .rt(rt),
        .regWrite(regWrite),
        .writeReg(writeReg),
        .writeData(writeData),
        .readData1(readData1),
        .readData2(readData2)
    );
    
    initial begin
        // Monitor the changes
        $monitor("time = %0d, rs = %d, rt = d, readData1 = %d, readData2 = %d", $time, rs, rt, readData1, readData2);
        
        // Stimulus to verify the working of the DFF
        clk = 1'b0; regWrite = 1'b0; writeData = 75;
        #2 rst = 1'b1;
        #1 rst = 1'b0;
        #5 rs = 5'b10101; rt = 5'b00101; regWrite = 1'b1; writeData = 45; writeReg = 5'b10101;
        #10 regWrite = 1'b0; writeData = 45; writeReg = 5'b10101;
        #10 regWrite = 1'b1; writeData = 45; writeReg = 5'b10111;
        #10 rs = 5'b10111; writeData = 45; writeReg = 5'b10111;
        #5 $finish;
    end
    
    // Change the clock signal after every 5 time units
    always begin
        #5 clk = ~clk;
    end
endmodule