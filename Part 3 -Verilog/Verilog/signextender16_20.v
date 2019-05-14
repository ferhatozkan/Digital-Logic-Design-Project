module signextender16_20(
  input [15:0] unextended,//the msb bit is the sign bit
  output reg [19:0] extended 
);

always@*
  begin 
    extended <= $signed(unextended);
  end
endmodule
