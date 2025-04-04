`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module BCD_Exc_3_tb();

parameter DURATION = 10;


reg clk=0;
always #0.5 clk = ~clk;

// Entradas
reg [3:0] test_BTN;
//Salidas
wire [3:0] test_LED;

BCD_Exc_3 UUT (
    .BTN(test_BTN),
    .LED(test_LED)
);

integer  i;
reg [3:0] entradas;

initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, BCD_Exc_3_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d",i);
        
        #1
        entradas = i;
        test_BTN = entradas;
        end
    
        // Finaliza la simulación
        // $display("Simulación completada.");
        #(DURATION) $display("End of simulation");
        $finish;
    end
    
endmodule