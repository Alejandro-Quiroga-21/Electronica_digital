`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100ns / 10ns

module RAM_16X4_tb();

parameter DURATION = 10;


reg clk_test=0;
always #0.5 clk_test = ~clk_test;

// Entradas
reg reset_test = 0;
reg set_test = 0;
reg write_enable_test = 0;
reg read_enable_test = 0;
reg [3:0] addr_test = 0;
reg [3:0] data_in_test = 4'b0000;
//Salidas
wire [3:0] data_out_test;

RAM_16x4 UUT (
    .clk(clk_test),
    .reset(reset_test),
    .set(set_test),
    .write_enable(write_enable_test),
    .read_enable(read_enable_test),
    .addr(addr_test),
    .data_in(data_in_test),
    .data_out(data_out_test)
);


initial begin
    // Inicializa las señales
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, RAM_16X4_tb);

    // Inicialización
    reset_test = 1; #10; reset_test = 0;
    set_test = 0;

    // Escribir datos en direcciones 0 a 3
    write_enable_test = 1;
    
    addr_test = 4'd0; data_in_test = 4'b1010; #10;
    addr_test = 4'd1; data_in_test = 4'b0101; #10;
    addr_test = 4'd2; data_in_test = 4'b1111; #10;
    addr_test = 4'd3; data_in_test = 4'b0001; #10;

    write_enable_test = 0; #10;

    // Leer los datos escritos
    read_enable_test = 1;
    
    addr_test = 4'd0; #10;
    addr_test = 4'd1; #10;
    addr_test = 4'd2; #10;
    addr_test = 4'd3; #10;

    read_enable_test = 0;

    // Finalizar simulación
    #20;
    $finish;
    end
endmodule
