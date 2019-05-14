module mux_2_4 (
    input [19:0] I0,
    input [19:0] I1,
    input [19:0] I2,
    input [19:0] I3,
    input [1:0] Sel
);
reg [19:0] Y;

always @ (Sel, I0, I1, I2, I3)
begin
    case (Sel)
        2'd0:
            Y = I0;
        2'd1:
            Y = I1;
        2'd2:
            Y = I2;
        2'd3:
            Y = I3;
        default:
            Y = 2'd0;
    endcase
end
endmodule
