`timescale 1ns / 1ps



module fifo_tb();

    reg clk, rst;
    reg write_en, read_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    // Instantiate DUT
    fifo_top DUT (
                  .clk(clk),
                  .rst(rst),
                  .write_en(write_en),
                  .read_en(read_en),
                  .data_in(data_in),
                  .data_out(data_out),
                  .full(full),
                  .empty(empty)
                  );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        write_en = 0;
        read_en = 0;
        data_in = 8'd0;

        // Apply reset
        #15;
        rst = 0;

        // Write 8 values
        repeat(8) begin
            @(posedge clk);
            if (!full) begin
                write_en = 1;
                data_in = data_in + 1;
            end
        end
        write_en = 0;

        // Wait a bit
        #20;

        // Read 8 values
        repeat(8) begin
            @(posedge clk);
            if (!empty)
                read_en = 1;
            else
                read_en = 0;
        end
        read_en = 0;

        #30;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | write=%b read=%b data_in=%h data_out=%h full=%b empty=%b",
                  $time, write_en, read_en, data_in, data_out, full, empty);
    end

endmodule

`timescale 1ns / 1ps



module fifo_tb();

    reg clk, rst;
    reg write_en, read_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full, empty;

    // Instantiate DUT
    fifo_top DUT (
                  .clk(clk),
                  .rst(rst),
                  .write_en(write_en),
                  .read_en(read_en),
                  .data_in(data_in),
                  .data_out(data_out),
                  .full(full),
                  .empty(empty)
                  );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        write_en = 0;
        read_en = 0;
        data_in = 8'd0;

        // Apply reset
        #15;
        rst = 0;

        // Write 8 values
        repeat(8) begin
            @(posedge clk);
            if (!full) begin
                write_en = 1;
                data_in = data_in + 1;
            end
        end
        write_en = 0;

        // Wait a bit
        #20;

        // Read 8 values
        repeat(8) begin
            @(posedge clk);
            if (!empty)
                read_en = 1;
            else
                read_en = 0;
        end
        read_en = 0;

        #30;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | write=%b read=%b data_in=%h data_out=%h full=%b empty=%b",
                  $time, write_en, read_en, data_in, data_out, full, empty);
    end

endmodule

