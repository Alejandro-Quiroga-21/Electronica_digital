`include "Reg_PP_4bit/FFD/FFD.v"

module Reg_PP_4bit (
    input wire clk,
    input wire reset,
    input wire set,
    input wire enable,
    input wire [3:0] D_in,
    output wire [3:0] Q
);

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : FF_GEN
            ffD_async_en ff (
                .clk(clk),
                .reset(reset),
                .set(set),
                .en(enable),
                .D(D_in[i]),
                .Q(Q[i]),
                .Qn() // No usamos Qn en este caso
            );
        end
    endgenerate

endmodule