`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module bin2gray_tb();

parameter DURATION = 10;


reg clk=0;
always #0.5 clk = ~clk;

// Entradas
reg [0:3]binario_test;
//Salidas
wire [0:3]gray_test;

bin2gray UUT (
    .binario(binario_test),
    .gray(gray_test)
);

integer  i;
reg [0:3]temp;
 

initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, bin2gray_tb);

    for (i=0;i<16;i=i+1)
        begin
            temp = i;
            binario_test = temp;
            #1;
        end
    //$display ("Current loop # %0d",i);
    
    #1;

    
    
        // Finaliza la simulación
        // $display("Simulación completada.");
    #(DURATION) $display("End of simulation");
    $finish;
    end
    
endmodule