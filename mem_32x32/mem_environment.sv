class mem_environment extends uvm_env;
 `uvm_component_utils(mem_environment)

 mem_agent mem_agnt;

 function new(string name = "mem_environment", uvm_component parent);
   super.new(name,parent);
 endfunction

 function void build_phase(uvm_phase phase);
   super.build_phase(phase);
   mem_agnt=mem_agent::type_id::create("mem_agnt",this);
 endfunction
 
endclass
