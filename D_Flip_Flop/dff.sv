// RTL code for D Flip-Flop

module d_flip_flop(
    input d,
    input clk,
    input reset,
    output q,
    output q_bar,
);

    reg q;
    assign q_bar = ~q;
    always @(posedge clk or negedge reset)
    begin
        if (!reset)
            q <= 0;
        else
            q <= d;
    end

endmodule
