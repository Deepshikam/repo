class environment extends uvm_environment;
  
  `uvm_component_utils(environment)
  function new(string name = "environment", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  agent a0;
  scoreboard scbd;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a0 = agent::type_id_create("a0", this);
    scbd = scoreboard::type_id_create("scbd", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    a0.mon.mon_analysis_port.connect(scbd.m_analysis_imp);
  endfunction 
endclass
