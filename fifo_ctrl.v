`timescale 1ns / 1ps



module fifo_ctrl(
                 input clk,
                 input rst,
                 input write_en,
                 input read_en,
                 output reg [2:0] wr_ptr,
                 output reg [2:0] rd_ptr,
                 output reg full,
                 output reg empty
                 );

    reg [3:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count  <= 0;
            full   <= 0;
            empty  <= 1;
        end
        else begin
            case ({write_en, read_en})
                2'b10: if (!full) begin
                    wr_ptr <= wr_ptr + 1;
                    count <= count + 1;
                end

                2'b01: if (!empty) begin
                    rd_ptr <= rd_ptr + 1;
                    count <= count - 1;
                end
            endcase

            full  <= (count == 8);
            empty <= (count == 0);
        end
    end

endmodule

