`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module M_Estado_tb();

parameter DURATION = 10;


reg clk_test=0;
always #5 clk_test = ~clk_test;

// Entradas
reg Re_test;
//Salidas
wire [2:0] Estados_test;

M_Estado UUT (
    .CLK(clk_test),
    .Re(Re_test),
    .Estados(Estados_test)
);


initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, M_Estado_tb);

    // Inicialización
    Re_test = 0;

    // Espera unos ciclos con Re=0
    #100;

    // Activa Re para volver al estado 7
    Re_test = 1;
    #20;

    // Vuelve a poner Re en 0 para continuar la secuencia
    Re_test = 0;
    #100;

    // Finalizar simulación
    #20;
    $finish;
    end
endmodule
