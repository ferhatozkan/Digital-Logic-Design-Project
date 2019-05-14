module ControlUnit(input [19:0] instruction,
                          output reg immediate,
                          output reg pcWrite,
			  output reg regWrite,
		          output reg load,
                          output reg memoryRead,
                          output reg memoryWrite,
                          output reg branch,
                          output reg ALUControl,
                          output reg pcMux,
                          output reg store);

reg  [3:0] opcode ;

always@(instruction)
begin
case(opcode)
        
4'b0001: 
	begin
	immediate = 0;
        pcWrite =1;
	regWrite =1;
	load =0;
        memoryRead =0;
        memoryWrite =0;
        branch =0;
        ALUControl =1;
        pcMux =0;
        store =0;
	end
4'b0010: 
	begin
	immediate = 0;
        pcWrite =1;
	regWrite =1;
	load =0;
        memoryRead =0;
        memoryWrite =0;
        branch =0;
        ALUControl =1;
        pcMux =0;
        store =0;
	end
4'b0011:
	begin
	immediate = 0;
        pcWrite =1;
	regWrite =1;
	load =0;
        memoryRead =0;
        memoryWrite =0;
        branch =0;
        ALUControl =1;
        pcMux =0;
        store =0;
	end 
4'b0100: 
	begin
	immediate = 0;
        pcWrite =1;
	regWrite =1;
	load =0;
        memoryRead =0;
        memoryWrite =0;
        branch =0;
        ALUControl =1;
        pcMux =0;
        store =0;
	end
4'b0101: 
	begin
	immediate = 0;
        pcWrite =1;
	regWrite =0;
	load =0;
        memoryRead =0;
        memoryWrite =0;
        branch =0;
        ALUControl =0;
        pcMux =1;
        store =0;
	end 
4'b0110:
	begin
	immediate = 0;
        pcWrite =0;
	regWrite =0;
	load =1;
        memoryRead =1;
        memoryWrite =0;
        branch =0;
        ALUControl =0;
        pcMux =0;
        store =0;
	end
4'b0111:
	begin
	immediate = 0;
        pcWrite =1;
	regWrite =0;
	load =0;
        memoryRead =0;
        memoryWrite =1;
        branch =0;
        ALUControl =0;
        pcMux =0;
        store =1;
	end
4'b1000: 
	begin
	immediate = 0;
        pcWrite =1;
	regWrite =0;
	load =0;
        memoryRead =0;
        memoryWrite =0;
        branch =1;
        ALUControl =0;
        pcMux =0;
        store =1;
	end 

endcase

end

 

endmodule
