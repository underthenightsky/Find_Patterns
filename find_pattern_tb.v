`timescale 1ns/1ps
`include "find_pattern.v"
// dumpfile , dumpvars to show where to store output,levels,list of modules which are dumping variables
//levels=0 dumps all variables , levels=1 dumps variables upto this this hierachy level,order of modules 
module find_pattern_tb ;
// tb takes no inputs 
    reg clk,reset,in_bit;
    wire detected;
    // connect variables 
    find_pattern uut (.clk(clk),.reset(reset),.in_bit(in_bit),.detected(detected));
    // every 5 units revese clock
    always #5clk =~clk;

    initial begin 
        $dumpfile("find_pattern.vcd");
        $dumpvars(0,find_pattern_tb);
        
        #10 in_bit = 1;  
        #10 in_bit = 0;  
        #10 in_bit = 1;  
        #10 in_bit = 1; 
        #10 in_bit = 0;  
        #10 in_bit = 1; 
        #10 in_bit = 1;  
        #10 in_bit = 1; 

        #50 $finish;
    end

      initial begin
        $monitor("Time=%0t | in=%b | detected=%b", $time, in_bit, detected);
    end

endmodule    

