// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "package.sv"

module top();
  import uvm_pkg::*;
  import counter_pkg::*;
  
  reg clk;
  counter_intf intf(clk);
  always #5 clk = ~clk;
  
  counter uut(.clk(clk), .rst(intf.clk), .up_down(intf.up_down), .count(intf.count));
  
  initial begin 
    clk <=0;
    uvm_config_db #(virtual counter_intf)::set(null, "uvm_test_top", "count_vif", intf);
    run_test("test");
  end
  
  initial begin
    $dumpvars;
    $dumpfile("dump.vcd");
  end
endmodule
