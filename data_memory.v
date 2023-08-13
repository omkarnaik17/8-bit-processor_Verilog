//8-bit data mamory
module data_memory (clk, address, memRead, memWrite, wData, rData);

    input clk, memRead, memWrite;
    input [7:0] address, wData;
    reg [7:0] dataMem[255:0];
    output reg [7:0] rData;
    
    initial
        begin
            
            dataMem[0] = 8'b01001011; //75
            dataMem[1] = 8'b00000111; //7
            dataMem[2] = 8'b01011110; //94
            dataMem[3] = 8'b00010010; //18
            dataMem[4] = 8'b00100011; //35
            dataMem[5] = 8'b00000011; //3
            dataMem[6] = 8'b00000101; //5
            dataMem[7] = 8'b11110011; //unused mem loc
            dataMem[8] = 8'b11110011; //33
            dataMem[9] = 8'b11110011; //unused mem loc
            dataMem[10] = 8'b11110011; //unused mem loc
            dataMem[12] = 8'b11110011; //unused mem loc
            dataMem[13] = 8'b11110011; //unused mem loc
            dataMem[14] = 8'b11110011; //unused mem loc
            dataMem[15] = 8'b11110011; //unused mem loc
        end
    
    always@(posedge clk)
        begin
            if(memWrite)
                dataMem[address] <= wData; //writing data to mem
            else
               dataMem[address] <= dataMem[address];            
                
            if (memRead)
                rData <= dataMem[address]; //reading data from mem
            else
                rData <=  rData;
        end
    
endmodule




