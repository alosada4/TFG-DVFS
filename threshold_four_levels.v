`timescale 1ns / 1ps

module threshold_four_levels(
    input wire                                  clk,
    input wire [9:0]                            hb_latch,
    
    output reg [1:0]                            freq_threshold
    );
    
    parameter THRESHOLD_HIGH = 24;//20;
    parameter THRESHOLD_MED = 20;//16;
    parameter THRESHOLD_LOW = 12;
    
    
    always @(posedge clk) begin
        if(THRESHOLD_LOW > hb_latch)begin
            freq_threshold = 2'b00;
            end
        else if(THRESHOLD_MED > hb_latch && hb_latch >= THRESHOLD_LOW)begin
            freq_threshold = 2'b01;
            end
        else if(THRESHOLD_HIGH > hb_latch && hb_latch >= THRESHOLD_MED)begin
            freq_threshold = 2'b10;
            end
        if(hb_latch >= THRESHOLD_HIGH) begin
            freq_threshold = 2'b11;
            end 
    end
    
endmodule
