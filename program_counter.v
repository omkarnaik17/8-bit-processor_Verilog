//8-bit program counter
module program_counter (clk, reset,pc_inp, pc_out);

  input clk, reset;
  input [7:0] pc_inp;
  output reg [7:0] pc_out;
  
  initial begin
    pc_out = 8'b0;
  end
  
  always@(posedge clk or posedge reset)
      begin
        if(reset)
            pc_out <= 8'b0;
        if(pc_out < 5)
            pc_out <= pc_inp + 1;
        else
            pc_out <= pc_inp;
      end

endmodule 
