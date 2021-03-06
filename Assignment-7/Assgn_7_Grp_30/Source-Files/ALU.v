/*
   Assignment No. - 7
   KGP-RISC
   Semester - 5 (Autumn 2021-22)
   Group No. - 30
   Group Members - Ashutosh Kumar Singh (19CS30008) & Vanshita Garg (19CS10064)
*/

`timescale 1ns / 1ps

// ALU module to compute the result and flags based on ALUop and ALUsel
module ALU (
    input signed [31:0] a, 
    input signed [31:0] b, 
    input ALUsel, 
    input [4:0] ALUop, 
    output reg carry, 
    output reg zero, 
    output reg sign, 
    output reg [31:0] result
);

    // Stores carry generated by adder1
    wire carryTemp;

    // Stores 32-bit output of not, adder1, shifter, and, xor, mux1, mux2 respectively from left to right.
    wire [31:0] not1Out, adder1Out, shifterOut, and1Out, xor1Out, mux1Out, mux2Out;

    mux_32b_2_1 mux1 (.a0(a), .a1(32'b00000000000000000000000000000001), .sel(ALUsel), .out(mux1Out));
    mux_32b_2_1 mux2 (.a0(b), .a1(not1Out), .sel(ALUsel), .out(mux2Out));

    adder_32_bit adder1 (.a(mux1Out), .b(mux2Out), .c_in(1'b0), .c_out(carryTemp), .sum(adder1Out));

    shifter shifter1 (.in(mux1Out), .shamt(mux2Out), .dir(ALUop[1]), .out(shifterOut), .aorl(ALUop[0]));

    assign not1Out = ~b;
    assign and1Out = mux1Out & mux2Out;
    assign xor1Out = mux1Out ^ mux2Out;

    // result changes on change of any input signal
    always @(*) begin
        if (ALUop == 5'b00000) begin
            result = mux1Out;
        end else if (ALUop == 5'b00001) begin
            carry = carryTemp;
            result = adder1Out;
        end else if (ALUop == 5'b00101) begin
            result = adder1Out;
        end else if (ALUop == 5'b10101) begin
            result = adder1Out;
        end else if (ALUop == 5'b00010) begin
            result = and1Out;
        end else if (ALUop == 5'b00011) begin
            result = xor1Out;
        end else if (ALUop[4:2] == 3'b010) begin
            result = shifterOut;
        end 
        else begin
            result = 32'b00000000000000000000000000000000;
        end
    end

    // Flags change on change of result
    always @(result) begin
        if (!result) begin
            zero = 1'b1;
        end else begin
            zero = 1'b0;
        end
        sign = result[31];
    end
    
endmodule