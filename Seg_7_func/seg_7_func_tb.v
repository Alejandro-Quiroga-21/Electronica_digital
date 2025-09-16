`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module seg_7_func_tb();

parameter DURATION = 10;


reg clk=0;
always #0.5 clk = ~clk;

// Entradas
reg [3:0] test_BTN;
//Salidas
wire [6:0] test_seg_7;

seg_7_func UUT (
    .A(test_BTN[3]),
    .B(test_BTN[2]),
    .C(test_BTN[1]),
    .D(test_BTN[0]),
    .seg_7(test_seg_7)
);

integer  i;
reg [3:0] entradas;

initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, seg_7_func_tb);

    for (i=0; i<10; i=i+1)
    begin
        $display ("Current loop # %0d",i);
        
        #1
        //entradas = i;
        test_BTN = i;//entradas;
        end
    
        // Finaliza la simulación
        // $display("Simulación completada.");
        #(DURATION) $display("End of simulation");
        $finish;
    end
    
endmodule