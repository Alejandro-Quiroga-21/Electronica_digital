`include "Reg_PP_4bit/Reg_pp_4bit.v"

module RAM_16x4 (
    input wire clk,
    input wire reset,
    input wire set,
    input wire write_enable,      // Señal para escribir
    input wire read_enable,       // Señal para leer
    input wire [3:0] addr,        // Dirección (16 posiciones = 4 bits)
    input wire [3:0] data_in,     // Datos a escribir
    output wire [3:0] data_out    // Datos leídos
);

    wire [15:0] enable_lines;
    wire [3:0] q_lines [15:0];   // Salida de cada registro

    // Decodificador 4 a 16 para seleccionar una dirección de escritura
    assign enable_lines = (write_enable) ? (16'b1 << addr) : 16'b0;

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : memory_cells
            Reg_PP_4bit reg_inst (
                .clk(clk),
                .reset(reset),
                .set(set),
                .enable(enable_lines[i]),
                .D_in(data_in),
                .Q(q_lines[i])
            );
        end
    endgenerate

    // Multiplexor para seleccionar salida de lectura
    assign data_out = (read_enable) ? q_lines[addr] : 4'bz; // Alta impedancia si no se lee

endmodule
