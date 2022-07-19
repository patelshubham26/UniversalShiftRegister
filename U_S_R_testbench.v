module Universal_Shift_RegisterTb;
  wire [3:0] DataOut;
  reg clock, reset;
  reg [1:0] MODE;
  reg [3:0] DataIn;
  
  Universal_Shift_Register jusr(DataOut, clock, reset, MODE, DataIn);
  
  initial
  begin
    clock =0; MODE = 2'b00; DataIn = 4'b0000;
    reset = 1; #10; reset = 0; #10;
    
    $display("RSLT\tD == DOUT");
    
    MODE = 2'b00; reset = 1; #10; reset = 0; #10;
    MODE = 2'b01; DataIn = 4'b0011; #10;
    if ( DataOut === 4'b1000 )
      $display("PASS\t%p is %p with %p", DataIn, MODE, DataOut);
    else
      $display("FAIL\t%p is %p with %p", DataIn, MODE, DataOut);
    MODE = 2'b01; DataIn = 4'b0011; #10;
    if ( DataOut === 4'b1100 ) 
      $display("PASS\t%p is %p with %p", DataIn, MODE, DataOut);
    else
      $display("FAIL\t%p is %p with %p", DataIn, MODE, DataOut);
    
    
    
    MODE = 2'b00; reset = 1; #10; reset = 0; #10;
    MODE = 2'b10; DataIn = 4'b0111; #10;
    if ( DataOut === 4'b0001 ) 
      $display("PASS\t%p is %p with %p", DataIn, MODE, DataOut);
    else
      $display("FAIL\t%p is %p with %p", DataIn, MODE, DataOut);
    
    MODE = 2'b10; DataIn = 4'b0111; #10;
    if ( DataOut === 4'b0011 )
      $display("PASS\t%p is %p with %p", DataIn, MODE, DataOut);
    else
      $display("FAIL\t%p is %p with %p", DataIn, MODE, DataOut);


    
    MODE = 2'b00; reset = 1; #10; reset = 0; #10;
    MODE = 2'b11; DataIn = 4'b1010; #10;
    if ( DataOut === 4'b1010 )
      $display("PASS\t%p is %p with %p", DataIn, MODE, DataOut);
    else
      $display("FAIL\t%p is %p with %p", DataIn, MODE, DataOut);

    #20;
    $finish;
  end
  
    
 
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end

  
  always #5 clock = ~clock;
  
endmodule