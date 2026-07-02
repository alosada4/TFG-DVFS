`timescale 1ns / 1ps

module hb_counter #()
(
   input wire                       clk,
   input wire                       rst,
   input wire                       heartbeat,
   input wire                       enable,
  
   output reg[9:0]                  hb_cnt
    );
    
    reg heartbeat_r;
    reg prev_heartbeat = 0;
    
    
    
    always @(posedge clk) begin
        heartbeat_r <= heartbeat;
        prev_heartbeat <= heartbeat_r;
    end
    
    always @(posedge clk) begin
        if (rst || enable) begin
            hb_cnt = 0;
        end
        else if(heartbeat_r & ~prev_heartbeat) begin//heartbeat detected
            hb_cnt = hb_cnt + 1;
        end
    end
    
endmodule
