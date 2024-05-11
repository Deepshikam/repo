class driver extends uvm_driver #(seq_item);
  `uvm_component_utils(driver)
  
  virtual counter_intf vif;
  
  function new(string name = "driver", uvm_component parent);
    super.new(name, parent);
    
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      if(!uvm_config_db #(virtual counter_intf)::get(this, "", "vif", vif);
         `uvm_fatal("DRV", "no vif found");
         
         endfunction
         
         virtual task run_phase(uvm_phase phase);
           super.run_phase(phase);
           forever begin
             seq_item item;
             seq_item_port.get_next_item(item);
             drive(item);
             seq_item_port.item_done();
           end
         endtask
         
         virtual task drive_item(seq_item item);
           @(vif.cb);
           vif.cb.rst <= item.rst;
           vif.cb.up_down <= item.up_down;
         endtask
         endclass
           
