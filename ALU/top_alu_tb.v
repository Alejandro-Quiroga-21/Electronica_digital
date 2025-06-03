`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module top_alu_tb();

parameter DURATION = 10;


reg clk=0;
always #0.5 clk = ~clk;

// Entradas
reg In1_test, In2_test, CBin_test;
reg [2:0] code_op_tes;
//Salidas
wire Result_test, CBout_test;

top_alu UUT (
    .In1(In1_test),
    .In2(In2_test),
    .CB_in(CBin_test),
    .code_op(code_op_tes),
    .Result(Result_test),
    .CB_out(CBout_test)
);

integer  i;
 

initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, top_alu_tb);

    for (i=0; i<128; i=i+1)
    begin
        $display ("Current loop # %0d",i);
        
        In1_test = i[2]; 
        In2_test = i[1];
        CBin_test = i[0];
        code_op_tes = i[5:3];
        #1;
        end
    
        // Finaliza la simulación
        // $display("Simulación completada.");
        #(DURATION) $display("End of simulation");
        $finish;
    end
    
endmodule