

`timescale 1ns / 1ns

module ram

  (
   //clock, write and read signal
   input clk,
   input write,
   input load,
   address,
   data);
   
   parameter DATA_WIDTH = 20 ;
   parameter ADDR_WIDTH = 10 ;
   parameter RAM_DEPTH = 1 << ADDR_WIDTH;
   
   input [ADDR_WIDTH-1:0] address     ;
   input [DATA_WIDTH-1:0]  data       ;
   
   reg [DATA_WIDTH-1:0] data_out ;
   reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];


always @ (posedge clk)
 begin : MEM_WRITE
     if (  write  ) 
	begin
         mem[address] = data;
     	end
 end

always @ (posedge clk)
  begin : MEM_READ
    if ( load ) 
    begin
      data_out = mem[address];
    end 
  end

endmodule