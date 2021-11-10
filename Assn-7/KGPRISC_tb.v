`timescale 1ns / 1ps

module KGPRISC_tb;

	// Inputs
	reg clk;
	reg rst;
	// Instantiate the Unit Under Test (UUT)
	KGPRISC uut (
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
        #5 rst = 0;
		
   
//       #3705 
//        $display ("Content in register 20: %d", uut.DP.registerFile.registerBank[20]);
//        if (uut.DP.registerFile.registerBank[20] == -1) begin
//            $display("Element not found.");
//        end else begin
//            $display("Element found at index: %d", uut.DP.registerFile.registerBank[20]);
//        end
//        $finish;
//        
        
    end
    
    always @ (*) begin
            if (uut.DP.registerFile.registerBank[16] == 1) begin 
                $finish;
               end
        end
    
    always begin
        #10 clk = ~clk;
    end
      
endmodule
