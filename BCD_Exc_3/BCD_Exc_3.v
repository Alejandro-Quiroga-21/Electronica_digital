module BCD_Exc_3(
    //Entradas
    input [3:0] BTN,
    //Salidas
    output [3:0] LED
);

assign LED = BTN + 3;

/*
reg [3:0] Aiken;

always @(*) begin
    if (BTN<=9)
        Aiken = BTN + 3;
    else 
        Aiken = 0;
end
assign LED = Aiken;
*/

endmodule