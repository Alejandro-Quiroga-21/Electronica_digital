module seg_7_proc(
    input wire A, B, C, D,
    output wire [0:6] seg_7
    );

    wire [3:0] BCD = {A,B,C,D};
    reg [0:6] seg;

    always @(*) begin
        case (BCD)
        4'd0: seg = 7'b1111110;
        4'd1: seg = 7'b0110000;
        4'd2: seg = 7'b1101101;
        4'd3: seg = 7'b1111001;
        4'd4: seg = 7'b0110011;
        4'd5: seg = 7'b1011011;
        4'd6: seg = 7'b1011111;
        4'd7: seg = 7'b1110000;
        4'd8: seg = 7'b1111111;
        4'd9: seg = 7'b1111011;
        default: seg = 7'b0000001; // Segmento 'g' encendido como error
        endcase
    end
    
    assign seg_7 = seg; 

endmodule