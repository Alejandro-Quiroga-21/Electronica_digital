`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module suma_tb();

parameter DURATION = 10;


reg clk=0;
always #0.5 clk = ~clk;

// Entradas
reg A_test, B_test, Cin_test;
//Salidas
wire S_test, Cout_test;

suma UUT (
    .A(A_test),
    .B(B_test),
    .Cin(Cin_test),
    .S(S_test),
    .Cout(Cout_test)
);

integer  i;
 

initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, suma_tb);

    for (i=0; i<8; i=i+1)
    begin
        $display ("Current loop # %0d",i);
        
        A_test = i[2]; 
        B_test = i[1];
        Cin_test = i[0];
        #1;
        end
    
        // Finaliza la simulación
        // $display("Simulación completada.");
        #(DURATION) $display("End of simulation");
        $finish;
    end
    
endmodule