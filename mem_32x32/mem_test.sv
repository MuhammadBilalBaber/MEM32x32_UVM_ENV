class mem_test extends uvm_test;
  `uvm_component_utils(mem_test)

  mem_environment mem_env;
  mem_bringup_sequence mem_bringup_seq;


  function new(string name="mem_test",uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mem_env = mem_environment::type_id::create("mem_env",this);
    mem_bringup_seq = mem_bringup_sequence::type_id::create("mem_bringup_seq",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
     mem_bringup_seq.start(mem_env.mem_agnt.mem_seqr);
     #50us;
    phase.drop_objection(this);
  endtask


endclass
