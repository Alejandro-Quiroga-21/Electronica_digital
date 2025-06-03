module seg_7_func(
    input wire A, B, C, D,
    output wire [6:0] seg_7
    );

    assign seg_7[0] = A|C|((B&D)|(~B&~D));
    assign seg_7[1] = ~B|(C&D)|(~C&~D);
    assign seg_7[2] = B|~C|D;
    assign seg_7[3] = A|(C&~D)|(~B&C)|(~B&~D)|((B&~C)&D);
    assign seg_7[4] = (C&~D)|(~B&~D);
    assign seg_7[5] = A|(B&~D)|(B&~C)|(~C&~D);
    assign seg_7[6] = (~B&C)|(B&~C)|(C&~D)|A;

endmodule