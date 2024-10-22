// pattern : 110110 => CCBCCB 
module pdm(clk_i,rst_i,data_i,valid_i,pd_o);
parameter B=1'B0;
parameter C=1'B1;
parameter S_RST=3'B000; //3 bit register group of flip flops ...
parameter S_C=3'B001;
parameter S_CC=3'B010;
parameter S_CCB=3'B011;
parameter S_CCBC=3'B100;
parameter S_CCBCC=3'B101;
// decleration of inputs and outputs ...
input clk_i,rst_i,data_i,valid_i;
output reg pd_o;
reg [2:0]state,next_state;
always @(posedge clk_i) begin
if(rst_i) begin 
pd_o<=0;
state<=0;
next_state<=0; 
end
else begin 
if(valid_i)
case(state) //CCBCCB
S_RST : begin 
  pd_o<=0;
 if(data_i==C) 
 next_state<=S_C; 
 else 
 next_state<=S_RST; 
 end
S_C : begin 
 pd_o<=0;
 if(data_i==C) 
   next_state<=S_CC; 
 else 
 next_state<=S_RST; 
 end
S_CC : begin 
 pd_o<=0;
 if(data_i==B) 
 next_state<=S_CCB; 
 else 
 next_state<=S_C; 
 end
S_CCB : begin 
pd_o<=0;
 if(data_i==C) 
 next_state<=S_CCBC; 
 else 
 next_state<=S_RST; 
 end
S_CCBC : begin 
pd_o<=0;
 if(data_i==C)
 next_state<=S_CCBCC; 
 else 
 next_state<=S_RST; 
 end
 S_CCBCC : begin 
 if(data_i==B) begin
 next_state<=S_RST; pd_o<=1; end 
 else begin
 next_state<=S_C; pd_o<=0; end
 end
endcase  
end 
end 
always @(next_state) begin
state<=next_state;
end
endmodule
