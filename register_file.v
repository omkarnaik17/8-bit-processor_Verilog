// register file for 8-bit
module register_file (clk, regRead1, regRead2, writeData, regCase, checkWrite, readData1, readData2);
    
    input clk, checkWrite, regRead1, regRead2, regCase;
    input [7:0] writeData;
    reg [7:0] registers[0:1];
    output reg [7:0] readData1, readData2;    
    
    initial
        begin
            registers[0] = 8'b00000001; //1
            registers[1] = 8'b00000100; //4
        end
    
    //Write data happens during rising clock edge.
    always@(posedge clk)
        begin
            if(regCase) begin
                    //do nothing as we need the same value from the register that we currently have
                    registers[regRead2] <= registers[regRead2];
                end
            else begin
                    if(checkWrite) //begin
                        registers[regRead2] <= writeData; //writing data to register2
//                        end
//                    else
//                        begin
                            //do nothing
//                        registers[regRead2] <= registers[regRead2];
//                        end
                end
        end
    
    //Read data happens during falling clock edge.
    always@(negedge clk)
        begin
            readData1 <= registers[regRead1]; //reading data from register1
            readData2 <= registers[regRead2]; //reading data from register2
        end
    
endmodule
