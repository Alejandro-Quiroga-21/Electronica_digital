module main (
    input wire CLK,       // Entrada de reloj
    output wire LED0       // Salida para el LED
);

// Contador para generar un retardo
reg [31:0] counter = 0;

reg LED0_REG = 0;

always @(posedge CLK) begin
    counter <= counter + 1;
    LED0_REG <= ~LED0_REG; 
    if (counter == 20) begin  // Ajusta este valor para cambiar la velocidad del parpadeo
                      // Cambia el estado del LED
        counter <= 0;              // Reinicia el contador
    end
end

assign  LED0 = LED0_REG;

endmodule