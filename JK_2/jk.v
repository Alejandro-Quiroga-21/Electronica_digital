module ffJK(
    input wire j,
    input wire k,
    input wire preset,
    input wire reset,
    input wire clk,
    output wire Q,Qn
);

reg salida = 0;

always @(posedge clk or posedge preset or posedge reset) begin
    if (reset)
        salida <= 1'b0;
    else if (preset)
        salida <= 1'b1;
    else
        begin
        case ({j,k})
        2'b00: salida<=salida;
        2'b01: salida<=1'b0;
        2'b10: salida<=1'b1;
        2'b11: salida<=~salida;
        endcase
    end
end

assign Q = salida;
assign Qn = ~salida;


endmodule