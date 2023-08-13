//8-bit control unit
module control_unit (opcode, rs, rd, shamt, ALUOp, checkWrite, regRead1, regRead2, memRead, memWrite, ALUSource, regDst, regWSource, signExt, extendCheck);

    // input [7:0] address;
    input [2:0] opcode, shamt;
    input rs, rd;
    
    output reg [2:0] ALUOp, signExt;
    output reg checkWrite, regRead1, regRead2, memRead, memWrite, ALUSource, regDst, regWSource, extendCheck;
    
    always@(*)
        begin
            case (opcode)
            
            3'b000: //add
                begin
                    checkWrite = 1;
                    regRead1 = rs;
                    regRead2 = rd;
                    ALUOp = opcode;
                    ALUSource = 1;
                    regDst = 0;
                    regWSource = 0;
                    extendCheck = 0;
                    signExt = shamt;
                    memRead = 0;
                    memWrite = 0;
                end
               
            3'b100: //addi
                begin
                    checkWrite = 1;
                    regRead1 = rs;
                    regRead2 = rd;
                    ALUOp = opcode;
                    ALUSource = 1;
                    regDst = 0;
                    regWSource = 0;
                    extendCheck = 1;
                    signExt = shamt;                
                    memRead = 0;
                    memWrite = 0;
                end
                
            3'b101: //sw
                begin
                    checkWrite = 0;
                    regRead1 = rs;
                    regRead2 = rd;
                    ALUOp = opcode;
                    ALUSource = 0;
                    regDst = 0;
                    regWSource = 1; //changed on 04/14/2023
                    extendCheck = 1;
                    signExt = shamt;                
                    memRead = 1;
                    memWrite = 1;
                end
                
            3'b110: //lw
                begin
                    checkWrite = 1;
                    regRead1 = rs;
                    regRead2 = rd;
                    ALUOp = opcode;
                    ALUSource = 0;
                    regDst = 0;
                    regWSource = 1;
                    extendCheck = 1;
                    signExt = shamt;                
                    memRead = 1;
                    memWrite = 0;
                end
                
            3'b111: //sll
                begin
                    checkWrite = 1;
                    regRead1 = rs;
                    regRead2 = rd;
                    ALUOp = opcode;
                    ALUSource = 1;
                    regDst = 0;
                    regWSource = 1;
                    extendCheck = 1;
                    signExt = shamt;                
                    memRead = 0;
                    memWrite = 0;
                end
           default:
                begin
                    checkWrite = 0;
                    regRead1 = rs;
                    regRead2 = rd;
                    ALUOp = opcode;
                    ALUSource = 0;
                    regDst = 0;
                    regWSource = 0;
                    extendCheck = 0;
                    signExt = shamt;                
                    memRead = 0;
                    memWrite = 0;
                end
            endcase
        end
    
endmodule
