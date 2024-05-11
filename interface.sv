interface counter_intf(input logic clk);
  logic rst;
  logic up_down;
  logic [3:0] count;
  
  clocking cb @(posedge clk);
    default input #1 output #1;
    	output up_down;
    	output rst;
    input [3:0] count;
  endclocking
  
endinterface