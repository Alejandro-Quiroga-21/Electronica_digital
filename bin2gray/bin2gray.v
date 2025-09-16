module bin2gray(
    input wire [0:3] binario,
    output wire [0:3] gray
);
assign gray[0] = binario[0];
assign gray[1] = binario[0] ^ binario[1];
assign gray[2] = binario[1] ^ binario[2];
assign gray[3] = binario[2] ^ binario[3];
endmodule