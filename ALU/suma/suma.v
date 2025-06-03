module suma(
    input wire A, B, Cin,
    output wire S,Cout
    );

    assign S = (~A&~B&Cin)|(~A&B&~Cin)|(A&B&Cin)|(A&~B&~Cin);
    assign Cout = (A&Cin)|(A&B)|(B&Cin);

endmodule