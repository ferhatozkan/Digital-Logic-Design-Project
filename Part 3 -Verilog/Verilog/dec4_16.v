module dec4_16(
input a,b,c,d,
output y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15
);
assign y0= (~a) & (~b) & (~c) & (~d) ;
assign y1= (~a) & (~b) & (~c) & (d) ;
assign y2= (~a) & (~b) & (c) & (~d) ;
assign y3= (~a) & (~b) & (c) & (d) ;
assign y4= (~a) & (b) & (~c) & (~d) ;
assign y5= (~a) & (b) & (~c) & (d) ;
assign y6= (~a) & (b) & (c) & (~d) ;
assign y7= (~a) & (b) & (c) & (d) ;
assign y8= (a) & (~b) & (~c) & (~d) ;
assign y9= (a) & (~b) & (~c) & (d) ;
assign y10= (a) & (~b) & (c) & (~d) ;
assign y11= (a) & (~b) & (c) & (d) ;
assign y12= (a) & (b) & (~c) & (~d) ;
assign y13= (a) & (b) & (~c) & (d) ;
assign y14= (a) & (b) & (c) & (~d) ;
assign y15= (a) & (b) & (c) & (d) ;

endmodule 
