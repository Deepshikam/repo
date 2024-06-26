class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  function new(stirng name = "monitor", uvm_component parent);
    super.new(name, parent);
  endfunction 
  
  virtual counter_intf vif;
  uvm_analysis_port #(seq_item) mon_analysis_port;
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db # (virtual counter_intf)::get(this, "", "vif", vif))
      `uvm_fatal("MON", "could not get vif")
      mon_analysis_port = new("mon_analysis_port", this);
  endfunction 
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin @(vif.cb);
      if(!vif.rst)begin
        seq_item item = seq_item::type_if::create("item");
        item.rst = vif.rst;
        item.up_down = vif.up_down;
        item.count = vif.cb.count;
        mon_analysis_port.write(item);
      end
    end
  endtask
endclass

        
