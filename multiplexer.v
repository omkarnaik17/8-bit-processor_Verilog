//8-bit multiplexer
module multiplexer (input1, input2, selector, selected);
    
    input [7:0] input1, input2;
    input selector;
    output reg [7:0] selected;
    
    always@(*) 
    begin
        if(!selector)
            selected = input1; //binary condition 0 from selector
        else
            selected = input2; //binary condition 1 from selector
    end
    
endmodule
