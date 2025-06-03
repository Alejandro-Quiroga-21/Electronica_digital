`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module resta_tb();

parameter DURATION = 10;


reg clk=0;
always #0.5 clk = ~clk;

// Entradas
reg A_test, B_test, Bin_test;
//Salidas
wire R_test, Bout_test;

resta UUT (
    .A(A_test),
    .B(B_test),
    .Bin(Bin_test),
    .R(R_test),
    .Bout(Bout_test)
);

integer  i;
 

initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, resta_tb);

    for (i=0; i<8; i=i+1)
    begin
        $display ("Current loop # %0d",i);
        
        A_test = i[2]; 
        B_test = i[1];
        Bin_test = i[0];
        #1;
        end
    
        // Finaliza la simulación
        // $display("Simulación completada.");
        #(DURATION) $display("End of simulation");
        $finish;
    end
    
endmodule