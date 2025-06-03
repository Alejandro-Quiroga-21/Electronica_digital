`include "FFD/FFD.v"

module Reg(
    input wire clk,
    input wire reset,
    input wire set,
    input wire enable,
    input wire [1:0] mode,
    input wire [3:0] P_in,
    input wire S_in,
    output wire [3:0] P_out,
    output wire S_out
);

wire [3:0] D_in;
wire [3:0] Q, Qn;

//Lógica de cada FFD
assign D_in[0] = (mode == 2'b01) ? S_in :
                 (mode == 2'b10) ? Q[1] :
                 (mode == 2'b11) ? P_in[0] : Q[0];

assign D_in[1] = (mode == 2'b01) ? Q[0] :
                 (mode == 2'b10) ? Q[2] :
                 (mode == 2'b11) ? P_in[1] : Q[1];

assign D_in[2] = (mode == 2'b01) ? Q[1] :
                 (mode == 2'b10) ? Q[3] :
                 (mode == 2'b11) ? P_in[2] : Q[2];

assign D_in[3] = (mode == 2'b01) ? Q[2] :
                 (mode == 2'b10) ? S_in :
                 (mode == 2'b11) ? P_in[3] : Q[3];

// Instanciamos cada FFD
genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin : FF_D  //FF_D almacena cada instacia de hardware
        FFD ff (   //Módulo e intancia
            .D(D_in[i]),
            .clk(clk),
            .reset(reset),
            .set(set),
            .enable(enable),
            .Q(Q[i]),
            .Qn(Qn[i])
        );
    end
endgenerate

assign P_out = Q;
assign S_out = (mode == 2'b01) ? Q[0] : // LSB
               (mode == 2'b10) ? Q[3] : // MSB
               1'bz; // Alta impedancia, no escribe nada

endmodule

