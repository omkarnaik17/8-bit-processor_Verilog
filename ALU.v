//8-bit ALU 
module ALU (input1, input2, ALUOp, result);
    
    input [7:0] input1, input2;
    input [2:0] ALUOp;
    output reg[7:0]result;
//    output reg checkWrite;
    
    always@(*)
    begin
        case(ALUOp)
        3'b000: begin //add
            result = input1 + input2; 
//            checkWrite = 1;
        end
        3'b100: begin //addi
            result = input1 + input2; 
//            checkWrite = 1;
        end
        3'b101: begin //sw
            result = input1 + input2; 
//            checkWrite = 0;
        end
        3'b110: begin //lw
            result = input1 + input2; 
//            checkWrite = 1;
        end
        3'b111:
         begin //sll
            result = input1 << input2; 
//            checkWrite = 1;
        end
//        result = input1 << input2; //sll
        default: begin //add
            result = 0; 
//            checkWrite = 0;
        end
//        result = 0;
        endcase
    end
endmodule
