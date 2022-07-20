module testbench;
    reg clk;
    reg reset;
    reg d;
    wire q;
    wire q_bar;

    // Instantiating the D flip flop module
     d_flip_flop DFF(
         .clk(clk),
         .reset(reset),
         .d(d),
         .q(q),
         .q_bar(q_bar) );

    // clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
      $dumpvars(1);
    end

    task display;
        $display("d:%b, q:%b, q_bar:%b", d, q, q_bar);
    endtask

    initial begin
        reset = 0;
        d = 0;
        display;
        #5;
        reset = 1;
        d = 1;
        display;
        #10;
        reset = 0;
        d = 1;
        display;
        #15;
        reset = 1;
        d = 0;
        display;
        #5;
        d = 0;
    end

    initial
      #50 $finish;
endmodule
