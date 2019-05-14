module ALU(a,b,out,sel); 

input [19:0] a,b; 
input [3:0] sel; 
output [19:0]out;
reg [19:0]out;


always@(sel)
begin
case(sel)
        
4'b0001: out = a+b; // ADD without CARRY 
4'b0010: out = a&b; // AND 
4'b0011: out = a|b; // OR 
4'b0100: out = a^b; // EXOR 

default : out = 9'bxxxxxxxxx;

endcase

end

 

endmodule
