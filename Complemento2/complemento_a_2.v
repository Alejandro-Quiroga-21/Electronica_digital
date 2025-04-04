module complemento_a_2(
    //Entradas
    input [3:0] BTN,
    //Salidas
    output [3:0] LED
);

assign LED = ~BTN + 1;


endmodule