module main();

reg clk;
reg load;
reg [19:0] data_out;
reg [19:0] address;
reg write;
reg data;
reg [3:0] wrAddr;
reg [19:0] wrData;
reg [3:0] rdAddrA;
reg [3:0] rdAddrB;
reg [19:0] rdDataA;
reg [19:0] rdDataB;
   
reg [19:0] mem [0:(1 << 20)];

rom_test rom(clk,load,address,data_out);


initial begin
	clk<=1'b0;
	address = 20'h00000;
	load = 1'b0;
end

ram_test ram(clk, write,load,address,data);

initial begin
	clk<=1'b0;
	write = 1'b0;
	load = 1'b0;
	address = 20'h00000;
end


registerfile_test registerfile(clk,write,wrAddr,wrData,rdAddrA,rdAddrB,rdDataA,rdDataB);

initial begin
	clk<=1'b0;
	write = 1'b0;
	wrData = 20'hxxxxx;
	wrAddr = 4'bxxxx;
	rdAddrA = 4'bxxxx;
	rdAddrB = 4'bxxxx;
	rdDataA = 20'hxxxxx;
	rdDataB = 20'hxxxxxx;
end

ControlUnit_test ControlUnit(instruction,immediate,pcWrite,regWrite,load,memoryRead,memoryWrite,branch,ALUControl,pcMux,store);


initial begin
	clk<=1'b0;
end






always begin
	#15 clk<=~clk;	
end

endmodule
