`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module complemento_a_2_tb();

parameter DURATION = 10;


reg clk=0;
always #0.5 clk = ~clk;

// Entradas
reg [3:0] test_BTN;
//Salidas
wire test_LED;

complemento_a_2 UUT (
    .BTN(test_BTN),
    .LED(test_LED)
);

integer  i;
reg [3:0] entradas;

initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, complemento_a_2_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d",i);
        
        #1
        entradas = i;
        test_BTN[0] = entradas[0];
        test_BTN[1] = entradas[1];
        test_BTN[2] = entradas[2];
        test_BTN[3] = entradas[3];
        end
    
        // Finaliza la simulación
        // $display("Simulación completada.");
        #(DURATION) $display("End of simulation");
        $finish;
    end
    
endmodule