
`timescale 1ns / 1ns

module registerfile

  (
   //clock and write signal
   input clk,
   input write,
   //writing data on registers
   input [3:0] wrAddr,
   input [19:0] wrData,
   //reading data from registers
   input [3:0] rdAddrA,
   input [3:0] rdAddrB,
   output reg [19:0] rdDataA,
   output reg [19:0] rdDataB);

   //16 Register
   reg [15:0] 	 reg0, reg1, reg2, reg3, 
				 reg4, reg5, reg6, reg7,
				 reg8, reg9, reg10, reg11, 
				 reg12, reg13, reg14, reg15;

	
	//Read part
   always @(*)
      begin
      case (rdAddrA)
	0: rdDataA = reg0;
	1: rdDataA = reg1;
	2: rdDataA = reg2;
	3: rdDataA = reg3;
	4: rdDataA = reg4;
	5: rdDataA = reg5;
	6: rdDataA = reg6;
	7: rdDataA = reg7;
	8: rdDataA = reg8;
	9: rdDataA = reg9;
	10: rdDataA = reg10;
	11: rdDataA = reg11;
	12: rdDataA = reg12;
	13: rdDataA = reg13;
	14: rdDataA = reg14;
	15: rdDataA = reg15;
	
	default: rdDataA = 16'hXXXX;
      endcase
	  
      case (rdAddrB)
	0: rdDataB = reg0;
	1: rdDataB = reg1;
	2: rdDataB = reg2;
	3: rdDataB = reg3;
	4: rdDataB = reg4;
	5: rdDataB = reg5;
	6: rdDataB = reg6;
	7: rdDataB = reg7;
	8: rdDataB = reg8;
	9: rdDataB = reg9;
	10: rdDataB = reg10;
	11: rdDataB = reg11;
	12: rdDataB = reg12;
	13: rdDataB = reg13;
	14: rdDataB = reg14;
	15: rdDataB = reg15;
	
	default: rdDataB = 16'hXXXX;
      endcase
   end
   
   //write part
   always @(posedge clk) 
   begin
      if (write) 
	case (wrAddr) 
	  0: reg0 <= wrData;
	  1: reg1 <= wrData;
	  2: reg2 <= wrData;
	  3: reg3 <= wrData;
	  4: reg4 <= wrData;
	  5: reg5 <= wrData;
	  6: reg6 <= wrData;
	  7: reg7 <= wrData;
	  8: reg8 <= wrData;
	  9: reg9 <= wrData;
	  10: reg10 <= wrData;
	  11: reg11 <= wrData;
	  12: reg12 <= wrData;
	  13: reg13 <= wrData;
	  14: reg14 <= wrData;
	  15: reg15 <= wrData;
	endcase 
   end 
endmodule
