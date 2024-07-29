module matrix_mul(
    input wire clk,
    input wire reset,
    input wire start,
    input wire [8:0][7:0] matrix_a,
    input wire [8:0][7:0] matrix_b,
    output reg [8:0][15:0] result,
    output reg done
);

reg [3:0] state;
reg [3:0] i, j, k;
reg [15:0] sum;

localparam IDLE = 4'd0, MULTIPLY = 4'd1, DONE = 4'd2;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        done <= 0;
        i <= 0;
        j <= 0;
        k <= 0;
        sum <= 0;
    end else begin
        case (state)
            IDLE: begin
                if (start) begin
                    state <= MULTIPLY;
                    i <= 0;
                    j <= 0;
                    k <= 0;
                    sum <= 0;
                    done <= 0;
                end
            end
            MULTIPLY: begin
                if (k == 3) begin
                    result[i*3 + j] <= sum;
                    sum <= 0;
                    k <= 0;
                    if (j == 2) begin
                        j <= 0;
                        if (i == 2) begin
                            state <= DONE;
                        end else begin
                            i <= i + 1;
                        end
                    end else begin
                        j <= j + 1;
                    end
                end else begin
                    sum <= sum + matrix_a[i*3 + k] * matrix_b[k*3 + j];
                    k <= k + 1;
                end
            end
            DONE: begin
                done <= 1;
                state <= IDLE;
            end
        endcase
    end
end

endmodule
