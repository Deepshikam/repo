class agent extends uvm_agent;
  `uvm_component_utils(agent)
  function new(string name = "agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  monitor mon;
  driver drv;
  seqr s0;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = monitor::type_id::create("mon", this);
    if(get_is_active() == UVM_ACTIVE)begin
      drv = driver::type_id::create("drv", this);
      s0 = seqr::type_id::create("s0", this);
    end
  endfunction 
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(get_is_active() == UVM_ACTIVE)begin
      drv.seq_item_port.connect(s0.seq_item_export);
    end
  endfunction
endclass
