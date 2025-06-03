module ffD_async_en (
    input wire D,
    input wire clk,
    input wire reset,    // reset asíncrono
    input wire set,      // set asíncrono
    input wire en,
    output reg Q,
    output wire Qn
);

assign Qn = ~Q;

always @(posedge clk or posedge reset or posedge set) begin
    if (reset)
        Q <= 1'b0;
    else if (set)
        Q <= 1'b1;
    else if (en)
        Q <= D;
end

endmodule