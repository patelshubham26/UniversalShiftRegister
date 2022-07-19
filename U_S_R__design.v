module Universal_Shift_Register(DataOut, clock, reset, MODE, DataIn);
  output reg [3:0] DataOut;
  
  reg [3:0] D_DataOut;
  input clock, reset;
  input [1:0] MODE;
  input [3:0] DataIn;
  
  always @(posedge clock)
  begin
    if(reset)
      D_DataOut = 0;
    else
      begin
        case(MODE)
          2'b00 : D_DataOut = DataOut;    
          2'b01 : D_DataOut = {DataIn[0], DataOut[3:1]};
          2'b10 : D_DataOut = {DataOut[2:0], DataIn[0]};
          2'b11 : D_DataOut = DataIn;
        endcase
      end
  end
  assign DataOut = D_DataOut;
  
endmodule