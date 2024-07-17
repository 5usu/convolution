`timescale 1ns / 1ps

module digital_tb;

    reg clk;
    reg reset;
    reg x;

    wire z;

//    wire [8*5:1] state_string;

    digital_design uut (
        .clk(clk), 
        .reset(reset), 
        .x(x), 
        .z(z)
    );

/*    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100MHz clock
    end

    initial begin
        $dumpfile("digital_design.vcd");
        $dumpvars(0, digital_tb);
    end

/*    function [8*5:1] state_to_string;
        input [1:0] state;
        begin
            case(state)
                2'b00: state_to_string = "A    ";
                2'b01: state_to_string = "B    ";
                2'b10: state_to_string = "C    ";
                default: state_to_string = "UNKN ";
            endcase
        end
    endfunction

    assign state_string = state_to_string(uut.current_state); */

    initial begin
        reset = 1;
        x = 0;

        #100;
        reset = 0;

        #10 x = 0;
        
        #10 x = 1;
        
        #10 x = 1;
        
        #10 x = 1;
        
        #10 x = 0;
        
        #10 x = 1;
        #10 x = 1;
        
        #10 x = 0;
        #10 x = 0;

        #100 $finish;
    end

/*   initial begin
        $monitor("Time=%0t, Reset=%b, X=%b, Z=%b, State=%s", 
                 $time, reset, x, z, state_string);
    end */

    initial begin 
        $dumpfile("digital_design.vcd");
        $dumpvars(0, digital_tb);
    end

endmodule
