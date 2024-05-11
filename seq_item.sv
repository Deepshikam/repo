class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)
  rand bit up_down;
  bit [3:0] count;
  
  function new(string name = "seq_item");
    super.new(name);
  endfunction
endclass
