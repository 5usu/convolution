module digital_design (
    input wire clk,
    input wire reset,
    input wire x,
    output reg z
);

    parameter A = 2'b00,
              B = 2'b01,
              C = 2'b10;

    reg [1:0] current_state, next_state;

    always @(*) begin
        case (current_state)
            A: next_state = x ? B : A;
            B: next_state = x ? C : B;
            C: next_state = x ? C : A;
            default: next_state = A;
        endcase
    end

    always @(*) begin
        z = (current_state == C) & x;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= A;
        else
            current_state <= next_state;
    end

endmodule
