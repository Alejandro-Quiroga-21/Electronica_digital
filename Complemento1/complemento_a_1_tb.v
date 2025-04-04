`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module complemento_a_1_tb();

parameter DURATION = 10;


reg clk=0;
always #0.5 clk = ~clk;

// Entradas
reg test_BTN1, test_BTN2, test_BTN3, test_BTN4;
//Salidas
wire test_LED0, test_LED1, test_LED2, test_LED3;

complemento_a_1 UUT (
    .BTN1(test_BTN1),
    .BTN2(test_BTN2),
    .BTN3(test_BTN3),
    .BTN4(test_BTN4),
    .LED0(test_LED0),
    .LED1(test_LED1),
    .LED2(test_LED2),
    .LED3(test_LED3)
);

integer  i;
reg [3:0] entradas;

initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, complemento_a_1_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d",i);
        
        #1
        entradas = i;
        test_BTN1 = entradas[0];
        test_BTN2 = entradas[1];
        test_BTN3 = entradas[2];
        test_BTN4 = entradas[3];
    end

    // Finaliza la simulación
    // $display("Simulación completada.");
    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule



