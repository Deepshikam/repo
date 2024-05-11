class seq extends uvm_sequence #(seq_item);
  
  `uvm_object_utils(seq)
  
  seq_item item;
  
  function new(string name = "seq");
    super.new(name);
  endfunction
  
  virtual task body();
    repeat(10) begin
      item = seq_item::type_id::create("item");
      start_item(item);
      assert(item.randomize());
      finish_item(item);
    end
  endtask
endclass
      
      
