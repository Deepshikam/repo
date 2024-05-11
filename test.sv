class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  seq s0;
  environment env;
  
  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction 
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    s0 = seq::type_id::create("seq");
    env = environment::type_id::create("env");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    s0.start(env.a0.s0);
    phase.drop_objection(this);
  endtask
endclass
