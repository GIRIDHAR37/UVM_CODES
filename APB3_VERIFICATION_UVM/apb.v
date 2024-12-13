/*
/////////////////////////////////////////

// --> AMBA 3 APB 

// --> The AMBA 3 APB Protocol Specification v1.0 defines the following additional functionality:
  Wait states
  Error reporting

// --> The following interface signals support this functionality:
 
// --> PREADY : A ready signal to indicate completion of an APB transfer.
// --> PSLVERR : An error signal to indicate the failure of a transfer.
 
// --> This version of the specification is referred to as APB3.

////////////////////////////////////////
*/

parameter WIDTH = 8;
parameter MEM_DEPTH = 16; 
parameter ADDR_WIDTH = $clog2(MEM_DEPTH);

module apb(input wire pclk_i,                		// Clock
			input wire presetn_i,             		// Active low reset
    		input wire psel_i,                		// Peripheral select
    		input wire penable_i,             		// Enable signal
    		input wire pwrite_i,              		// Write control
    		input wire [ADDR_WIDTH-1:0] paddr_i,    // Address bus
    		input wire [WIDTH-1:0] pwdata_i,        // Write data
    		output reg [WIDTH-1:0] prdata_o,        // Read data
    		output reg pready_o,              		// Ready signal
    		output reg pslverr_o              		// Slave error
          );

// Define memory and parameters
    parameter IDLE = 2'b00, SETUP = 2'b01, ACCESS = 2'b10, TRANSFER = 2'b11;
	
	reg [ADDR_WIDTH:0]write_count=0;
	wire full = (write_count >= MEM_DEPTH); // memory full flag
	wire empty = (write_count==0); // memory empty flag
    reg [WIDTH-1:0] mem [MEM_DEPTH-1:0];   // 32 locations of 32-bit memory
    reg [1:0] state;                  // 2-bit state register

    integer i;

// Asynchronous reset and clock-triggered logic

    always @(posedge pclk_i or negedge presetn_i) begin
        if (!presetn_i) begin
            state <= IDLE;
            prdata_o <= 8'b0;
            pready_o <= 1'b0;
            pslverr_o <= 1'b0;
            for (i = 0; i < MEM_DEPTH; i = i + 1) begin
                mem[i] <= 8'b0;
			end
        end 
		else begin
            case (state)
			
                IDLE: begin
                    prdata_o <= 8'b0;
                    pready_o <= 1'b0;
                    pslverr_o <= 1'b0;
                    if (psel_i && penable_i)
                        state <= SETUP;
                end

                SETUP: begin
                    if (psel_i && penable_i) begin
                        if (paddr_i < MEM_DEPTH) begin
                            pready_o <= 1'b1;
                            state <= ACCESS;
                        end 
						else begin
                            pready_o <= 1'b0;
                            pslverr_o <= 1'b1;
                            state <= TRANSFER;  // Go to transfer even on invalid address
                        end
                    end
                end

                ACCESS: begin
                    if (penable_i && psel_i) begin
                        if (pwrite_i) begin  // Write operation
							if(!full) begin
//                            if (paddr_i < MEM_DEPTH) begin
                                mem[paddr_i] <= pwdata_i;
								write_count <= write_count+1;
                                pslverr_o <= 1'b0;
                            end 
							else begin
                                pslverr_o <= 1'b1;
                            end
                        end 
						else begin  // Read operation
                            if (!empty) begin
                                prdata_o <= mem[paddr_i][7:0];  // Only returning 8-bits
								write_count <= write_count-1;
                                pslverr_o <= 1'b0;
                            end 
							else begin
                                prdata_o <= 8'hXX;  // Unknown for invalid address
                                pslverr_o <= 1'b1;
                            end
                        end
                        pready_o <= 1'b1;
                        state <= TRANSFER;
                    end
                end

                TRANSFER: begin
                    pready_o <= 1'b0;
                    pslverr_o <= 1'b0;
                    state <= IDLE;  // Return to IDLE for next operation
                end

                default: state <= IDLE;

            endcase
        end
    end

endmodule

