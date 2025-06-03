`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module FFD_tb();

parameter DURATION = 10;


reg clk_test=0;
always #0.5 clk_test = ~clk_test;

// Entradas
reg S_test, R_test, E_test, D_test;
//Salidas
wire Q_test, Qn_test;

FFD UUT (
    .D(D_test),
    .set(S_test),
    .reset(R_test),
    .enable(E_test),
    .clk(clk_test),
    .Q(Q_test),
    .Qn(Qn_test)
);


initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, FFD_tb);

    D_test = 0; S_test = 0; R_test = 0; E_test = 0;
    #10;

    // Test asíncrono
    R_test = 1;
    #5;
    R_test = 0;
    #10;

    S_test = 1;
    #5;
    S_test = 0;
    #10;

    //Test síncrono
    // Carga Enable
    D_test = 1;
    E_test = 1;
    #10;  // flanco de subida del clk

    // Deshabilitar y cambiar D (debería mantener Q)
    E_test = 0;
    D_test = 0;
    #10;

    // Habilitar y cargar 0
    E_test = 1;


    #20 $finish;

end

endmodule