`timescale 1ns / 1ps

module enable_reg#()(
    input wire                             clk,
    input wire                             rst,
    input wire [9:0]                      hb_cnt,
    input wire                            enable,
    
    output reg [9:0]                      hb_latch           
    );
    
    
      always @(posedge clk) begin
        if (rst) begin
            hb_latch = 0;
        end
        else
            if(enable == 1) begin
                hb_latch = hb_cnt;
        end 
       end   

endmodule
