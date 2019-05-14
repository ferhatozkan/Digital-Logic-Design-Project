module mux_1_2 (
    input [19:0] I0,
    input [19:0] I1,
    input  Sel
);
reg [19:0] Y;

always @ (Sel, I0, I1)
begin
    case (Sel)
        1'b0:
            Y = I0;
        1'b1:
            Y = I1;
        default:
            Y = 2'dz;
    endcase
end
endmodule
