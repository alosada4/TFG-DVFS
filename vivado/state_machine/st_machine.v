`timescale 1ns / 1ps

module st_machine(
    input wire                             clk,
    input wire                             rst,
    input wire                             w_req_debug,
    
    output reg                             heartbeat
    );

   parameter NO_HEARTBEAT = 4'b0001;
   parameter HEARTBEAT = 4'b0010;
 
//Internal variables
   reg [3:0] state = NO_HEARTBEAT;
   reg [17:0] counter = 0;
   
   always @(posedge clk)
      if (rst) begin
         state <= NO_HEARTBEAT;
         counter <= 0;
      end
      else
         case (state)
            NO_HEARTBEAT : begin
            counter <= 0;
               if (w_req_debug == 1)
                  state <= HEARTBEAT;          
               else
                  state <= NO_HEARTBEAT;
               
            end
             HEARTBEAT  : begin
               if (w_req_debug == 0 && counter == 210000)
                  state <= NO_HEARTBEAT;
               else
                begin
                  counter <= counter + 1;
                  state <= HEARTBEAT;
                end
                
               
            end

            default: begin  // Fault Recovery
               state <= NO_HEARTBEAT;
               counter <= 0;
	       end
         endcase
     
    always @(*) begin
        case(state)
            NO_HEARTBEAT: heartbeat = 0;
            HEARTBEAT: heartbeat = 1;
            default: heartbeat = 0;
        endcase
     end
					
endmodule

