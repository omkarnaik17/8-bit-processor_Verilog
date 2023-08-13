`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2023 10:33:07 AM
// Design Name: 
// Module Name: muxSelector_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//you cannot use assign statements within an always block
module muxSelector_1(extendCheck, regWSource, muxNo, selector);
    
    input extendCheck, regWSource; input muxNo; output reg selector;
    
    //always@(*) recommended for proper synthesis
    always@(*)
    begin
        case(muxNo)
            default : begin
                //if opCode is for lw, sw, addi or extendCheck is 1 - return 01
                if(extendCheck == 1)
                    begin 
                        selector = 1;
                    end
                //else return 00
                else
                    begin
                        selector = 0;
                    end
                end
             1 : begin
                 if(regWSource)
                    begin 
                        selector = 1;
                    end
                 else
                    begin 
                        selector = 0;
                    end
                end
        endcase
    end
endmodule
