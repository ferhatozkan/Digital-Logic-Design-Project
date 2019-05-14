module branch(
    input [2:0] nzp,
    input [19:0] I0,
    input [19:0] I1,
    output reg branch_out);

reg [2:0] test_nzp;

always @(*)
begin
  if (I0 == I1)
    begin
    test_nzp = 3'b010;
    end
  else if (I0 < I1)
    begin
    test_nzp = 3'b100;
    end
  else 
    begin
    test_nzp = 3'b001;
    end
end

always @ (*)
begin
   if (test_nzp & nzp)
    begin
    branch_out = 1;
    end
  else
    begin
    branch_out = 0;
    end

end
endmodule
