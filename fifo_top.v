`timescale 1ns / 1ps



module fifo_top(
                input clk,
                input rst,
                input write_en,
                input read_en,
                input [7:0] data_in,
                output [7:0] data_out,
                output full,
                output empty
                );

    wire [2:0] wr_ptr, rd_ptr;

    fifo_mem mem_inst (
                       .clk(clk),
                       .rst(rst),
                       .data_in(data_in),
                       .wr_ptr(wr_ptr),
                       .rd_ptr(rd_ptr),
                       .write_en(write_en),
                       .read_en(read_en),
                       .data_out(data_out)
                       );

    fifo_ctrl ctrl_inst (
                         .clk(clk),
                         .rst(rst),
                         .write_en(write_en),
                         .read_en(read_en),
                         .wr_ptr(wr_ptr),
                         .rd_ptr(rd_ptr),
                         .full(full),
                         .empty(empty)
                         );

endmodule
