module FFD(
    input wire D,
    input wire clk,
    input wire set, 
    input wire reset,
    input wire enable,
    output wire Q,Qn 
);

reg salida = 0;

always  @(posedge clk or posedge reset or posedge set) begin
        if (reset)
            salida <= 0;
        else if (set)
            salida <= 1;
        else if (enable)
            salida <= D; 

    end

    assign Q = salida;
    assign Qn = ~salida;

endmodule
