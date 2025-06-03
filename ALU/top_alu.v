`include "suma/suma.v"
`include "resta/resta.v"

module top_alu(
    input wire In1,       // Entrada 1 (minuendo/sumando)
    input wire In2,       // Entrada 2 (sustraendo/sumando)
    input wire CB_in,     // Carry/Borrow de entrada
    input wire [2:0] code_op, // Código de operación
    output wire Result,   // Resultado
    output wire CB_out     // Carry/Borrow de salida
);

// Conexiones internas
wire suma_s, suma_c;
wire resta_d, resta_b;

// Instanciar sumador
suma sumador (
    .A(In1),
    .B(In2),
    .Cin(CB_in),
    .S(suma_s),
    .Cout(suma_c)
);

// Instanciar restador
resta restador (
    .A(In1),
    .B(In2),
    .Bin(CB_in),
    .R(resta_d),
    .Bout(resta_b)
);

// Lógica de selección de operación
reg tmp_result, tmp_cb;

always @(*) begin
    case(code_op)
        3'b001: begin // Suma
            tmp_result = suma_s;
            tmp_cb = suma_c;
        end
        3'b010: begin // Resta
            tmp_result = resta_d;
            tmp_cb = resta_b;
        end
        default: begin // Otras operaciones (AND, OR, etc.)
            tmp_result = 1'b0;
            tmp_cb = 1'b0;
        end
    endcase
end

assign Result = tmp_result;
assign CB_out = tmp_cb;

endmodule