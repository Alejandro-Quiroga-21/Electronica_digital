`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module Reg_tb();

parameter DURATION = 10;


reg clk_test=0;
always #0.5 clk_test = ~clk_test;

// Entradas
reg S_test, R_test, E_test;
reg [1:0] mode_test;
reg [3:0] P_in_test;
reg S_in_test;
reg [3:0] D_in_test;
//Salidas
wire [3:0] P_out_test;
wire S_out_test;

Reg UUT (
    .set(S_test),
    .reset(R_test),
    .enable(E_test),
    .clk(clk_test),
    .mode(mode_test),
    .P_in(P_in_test),
    .S_in(S_in_test),
    .P_out(P_out_test),
    .S_out(S_out_test)
);


initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, Reg_tb);

    clk_test = 0; R_test = 0; S_test = 0; E_test = 0;
    mode_test = 2'b00;
    P_in_test = 4'b0000;
    S_in_test = 0;

    // Reset asíncrono
    #5 R_test = 1;
    #10 R_test = 0;

    // Set asíncrono
    #5 S_test = 1;
    #10 S_test = 0;

    // Cargar datos en paralelo (P_in)
    #5 
    E_test = 1;
    mode_test = 2'b11; // Modo carga paralela
    P_in_test = 4'b1010;
    #10;

    // Mantener valores
    mode_test = 2'b00;
    #10;

    // Desplazamiento a la derecha
    mode_test = 2'b01;
    S_in_test = 1; // Bit que entra por la izquierda
    #10;
    S_in_test = 0;
    #10;

    // Desplazamiento a la izquierda
    mode_test = 2'b10;
    S_in_test = 1; // Bit que entra por la derecha
    #10;
    S_in_test = 0;
    #10;

    // Deshabilitar el registro
    E_test = 0;
    P_in_test = 4'b1111;
    mode_test = 2'b11;
    #10;  // No debería cargar nada

    // Finalizar simulación
    #20;
    $finish;
    end
endmodule
