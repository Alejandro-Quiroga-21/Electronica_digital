`define DUMPSTR(x) `"x.vcd`"
`timescale 1ns / 1ps

module main_tb;

    parameter DURATION = 200;

    // Señales de entrada/salida
    reg CLK = 0;          // Señal de reloj
    wire LED0;        // Señal del LED

    // Instancia del módulo principal
    main uut (
        .CLK(CLK),    // Conecta la señal de reloj
        .LED0(LED0)   // Conecta la señal del LED
    );

    // Generación de la señal de reloj
    always begin
        
        #5 CLK = ~CLK;  // Cambia el reloj cada 5 ns (esto genera un reloj de 100 MHz)
    end

    // Bloque inicial para la simulación
    initial begin
        // Inicializa las señales
        $dumpfile(`DUMPSTR(`VCD_OUTPUT));
        $dumpvars(0, main_tb);
        

        // CLK = 0;

        // Duración de la simulación
        // #200;  // Simula durante 200,000,000 ns (200 ms)
        #(DURATION) $display("End of simulation");

        // Finaliza la simulación
        // $display("Simulación completada.");
        $finish;
    end

endmodule
