`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 11:45:27 AM
// Design Name: 
// Module Name: eight_bit_processor
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


module eight_bit_processor( clk, reset, pc_inp, procOut);
   
    // inputs
    input clk;
    input reset;
    input [7:0] pc_inp;
    
    //wires here
    wire [2:0] opcode, shamt;
    wire rs, rd, selector1,selector2;
    wire [2:0] ALUOp, signExt;
    wire checkWrite, regRead1, regRead2, memRead, memWrite, ALUSource, regDst, regWSource, extendCheck;
    wire [7:0] pc_out, readData1, readData2, readData11, readData22, extended, selected1, selected2, aluResult, wData, rData, writeData;
    
    //output
    output [7:0] procOut;

    //program counter
    program_counter program_counter(.clk(clk), .reset(reset), .pc_inp(pc_inp), .pc_out(pc_out));
    
    //instr Mem
    instruction_memory instruction_memory(.clk(clk), .pc(pc_out), .opcode(opcode), .rs(rs), .rd(rd), .shamt(shamt));
    
    //control unit
    control_unit control_unit(.opcode(opcode), .rs(rs), .rd(rd), .shamt(shamt), .ALUOp(ALUOp), .checkWrite(checkWrite), .regRead1(regRead1), .regRead2(regRead2), .memRead(memRead), .memWrite(memWrite), .ALUSource(ALUSource), .regDst(regDst), .regWSource(regWSource), .signExt(signExt), .extendCheck(extendCheck));
    
    //reg file
    register_file register_file1(.clk(clk), .regRead1(regRead1), .regRead2(regRead2), .writeData(writeData), .regCase(1), .checkWrite(checkWrite), .readData1(readData1), .readData2(readData2));

    //sign Ext
    sign_extension sign_extension(.immediate(shamt), .extended(extended), .extendCheck(extendCheck));
    
    //deciding values for MUX
    //sign ext - lw, sw, addi otherwise use ALU
    muxSelector_1 muxSel10(.extendCheck(extendCheck), .regWSource(regWSource), .muxNo(0), .selector(selector1));
    
    //multiplexer - 1
    multiplexer multiplexer1(.input1(readData2), .input2(extended), .selector(selector1), .selected(selected1)); //add this before ALU -> addi and sll

    //ALU
    ALU ALU(.input1(readData1), .input2(selected1), .ALUOp(ALUOp), .result(aluResult));//, .checkWrite(checkWrite));

    
    //data Mem
    data_memory data_memory(.clk(clk), .address(aluResult), .memRead(memRead), .memWrite(memWrite), .wData(wData), .rData(rData));


    //if lw read data and use value from data_memory otherwise use ALU value
    muxSelector_1 muxSel2(.extendCheck(extendCheck), .regWSource(regWSource), .muxNo(1), .selector(selector2));

        
    //multiplexer - 2
    multiplexer multiplexer2(.input1(aluResult), .input2(rData), .selector(selector2), .selected(selected2)); //this will have wData value if
    
    //used when and if writing back to register is required
    register_file register_file2(.clk(clk), .regRead1(regRead1), .regRead2(regRead2), .writeData(selected2), .regCase(0), .checkWrite(checkWrite), .readData1(readData11), .readData2(readData22));
    assign procOut = readData22;
    
endmodule
