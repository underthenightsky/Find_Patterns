module find_pattern(
    input clk, reset, in_bit,
    output reg detected
);

   localparam S0 = 2'b00;  // no '1' yet
    localparam S1 = 2'b01;  // last input was '1'
    localparam S2 = 2'b10;  // detected "11"
// 4 inputs , output is reg in procedural block,custom types with typedef , we are also specifying space taken by this datatype
// defining variables with our custom datatypes
 reg [1:0] state, next_state;

// reset logic (async)
always @(posedge clk or posedge reset) begin 
    if (reset)
        state <= S0;
    else 
        state <= next_state;
end

// transition logic
always @(*) begin 
    // starting output value 
    detected =0;
    // switch cases
    case(state)
        S0: begin 
        if (in_bit) next_state=S1;
        else next_state=S0;
        end

        S1: begin 
        if (in_bit) begin
        next_state=S2;
        detected =1;
        end
        else next_state = S0;
        end

        S2: begin 
        if(in_bit) begin 
        next_state=S2;
         detected=1;
        end
        else next_state=S1;
        end
        default: next_state=S0;
    endcase
end
endmodule

         