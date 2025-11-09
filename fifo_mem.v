`timescale 1ns / 1ps



module fifo_mem(
                input clk,
                input rst,
                input [7:0] data_in,
                input [2:0] wr_ptr,
                input [2:0] rd_ptr,
                input write_en,
                input read_en,
                output reg [7:0] data_out
                );
                
    reg [7:0] mem[7:0];
    integer i;

    // Initialize memory
    initial begin
        for (i = 0; i < 8; i = i + 1)
            mem[i] = 8'd0;
        data_out = 8'd0;
    end

    // Write logic
    always @(posedge clk) begin
        if (write_en)
            mem[wr_ptr] <= data_in;
    end

    // Read logic with reset
    always @(posedge clk or posedge rst) begin
        if (rst)
            data_out <= 8'd0;
        else if (read_en)
            data_out <= mem[rd_ptr];
    end
endmodule

