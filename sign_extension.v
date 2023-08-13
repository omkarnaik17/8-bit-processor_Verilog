//8-bit sign extension
module sign_extension(immediate, extended, extendCheck);
    
    input extendCheck;
    input [2:0] immediate;
    output reg [7:0] extended;
    
    always@(*)
        begin
            extended = {5'b00000, immediate}; //extend by 0 
        end
    endmodule
