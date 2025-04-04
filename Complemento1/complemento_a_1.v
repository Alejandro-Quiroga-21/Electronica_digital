module complemento_a_1 (
    //Entradas
    input wire BTN1,
    input wire BTN2,
    input wire BTN3,
    input wire BTN4,

    //Salidas
    output wire LED0,
    output wire LED1,
    output wire LED2,
    output wire LED3
);

    assign LED0 =~BTN1;
    assign LED1 =~BTN2;
    assign LED2 =~BTN3;
    assign LED3 =~BTN4;

endmodule