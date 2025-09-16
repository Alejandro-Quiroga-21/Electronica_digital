`include "FFJK/FFJK.v"

module M_Estado(
    input wire CLK,
    input wire Re,
    output wire [2:0] Estados 
);

wire [2:0] Q;
wire [2:0] J,K;

assign J[0] = 1'b1;
assign K[0] = ~Re&(~Q[2]|~Q[1]);

assign J[1] = Re|~Q[2];
assign K[1] = ~Re&((~Q[2]&~Q[0])|(Q[2]&Q[0]));

assign J[2] = Re|~Q[1]|~Q[0];
assign K[2] = ~Re;

genvar i;
    generate
        for (i = 0; i < 3; i = i + 1) begin : FFJK
             ffJK JK_instancia (
                .clk(CLK),
                .j(J[i]),
                .k(K[i]),
                .Q(Q[i])
             );
        end
    endgenerate

assign Estados = Q;

endmodule
