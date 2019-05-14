module signextender7_20(
  input [6:0] unextended,//the msb bit is the sign bit
  output reg [19:0] extended 
);

always@*
  begin 
    extended <= $signed(unextended);
  end
endmodule
