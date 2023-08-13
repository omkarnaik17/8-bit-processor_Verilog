//8-bit instruction memory
module instruction_memory (clk, pc, opcode, rs, rd, shamt);

    input clk;
    input[7:0] pc;
    reg [7:0] instruction;
    reg [7:0] instrMem[0:5];
    output reg [2:0] opcode, shamt;
    output reg rs, rd;
    
    //instructions
    initial
        begin
            instrMem[00] = 8'b00000000; //instruction none
            instrMem[01] = 8'b00010000; //instruction for add
            instrMem[02] = 8'b10010110; //instruction for addi
            instrMem[03] = 8'b11010111; //instruction for load word
            instrMem[04] = 8'b10110010; //instruction for store word
            instrMem[05] = 8'b11110101; //instruction for shift left logical 
        end
        
    always@(*)
        begin
            instruction <= instrMem[pc]; //mapping instructions from instruction Memory
            opcode <= instruction[7:5]; //extracting opcode
            rs <= instruction[3]; //extracting reg1
            rd <= instruction[4]; //extracting reg2
            shamt <= instruction[2:0]; //extracting shift amt/immediate
        end
    
endmodule
