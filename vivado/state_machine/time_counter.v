`timescale 1ns / 1ps

module time_counter#()(
    input wire                       clk,
    output reg                       enable
    );
    
    reg [31:0] reset_time = 0;
    
    always @(posedge clk) begin  
        
      enable = 0;
      
      if(reset_time == 300000000) begin//3000000000) begin//60 seconds
      //if(reset_time == 900000) begin
          enable = 1;
          reset_time = 0;
      end
      
      else begin
          reset_time = reset_time + 1;
      end
       
     end
    
endmodule
