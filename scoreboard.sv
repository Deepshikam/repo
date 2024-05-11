class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  uvm_analysis_imp #(seq_item, scoreboard) m_analysis_imp;
  function new(string name = "scoreboard", uvm_commponent parent);
    super.new(name, parent);
  endfunction 
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_analysis_imp = new("m_analysis_imp", this);
  endfunction
  
  virtual function void write(seq_item item);
    // to check 
  endfunction 
endclass
  
  
