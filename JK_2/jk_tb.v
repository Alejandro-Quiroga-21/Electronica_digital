`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module ffJK_tb();

parameter DURATION = 10;


reg clk_test=0;
always #0.5 clk_test = ~clk_test;

// Entradas
reg j_test, k_test, preset_test, reset_test;
//Salidas
wire Q_test,Qn_test;

ffJK UUT (
    .j(j_test),
    .k(k_test),
    .clk(clk_test),
    .preset(preset_test),
    .reset(reset_test),
    .Q(Q_test),
    .Qn(Qn_test)
);


initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, ffJK_tb);

   // Estado inicial
    j_test = 0; k_test = 0;
    preset_test = 0; reset_test = 0;

    #2 reset_test = 1;   // Asynchronous reset
    #2 reset_test = 0;

    #2 preset_test = 1;  // Asynchronous set
    #2 preset_test = 0;

    // Entradas síncronas con reloj
    #5 j_test = 1; k_test = 0;   // Set
    #10 j_test = 0; k_test = 1;  // Reset
    #10 j_test = 1; k_test = 1;  // Toggle
    #10 j_test = 0; k_test = 0;  // Hold

    #20 $finish;
end

endmodule