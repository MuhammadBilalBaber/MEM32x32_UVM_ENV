# vcs -R -verilog mem_32x32.v -sverilog mem_if.sv mem_seq_item.sv mem_bringup_sequence.sv mem_sequencer.sv mem_driver.sv mem_monitor.sv mem_agent.sv mem_environment.sv mem_test.sv mem_top_tb.sv
vcs -R -sverilog +acc \
    mem_32x32.v \
    mem_if.sv \
    mem_seq_item.sv \
    mem_bringup_sequence.sv \
    mem_sequencer.sv \
    mem_driver.sv \
    mem_monitor.sv \
    mem_agent.sv \
    mem_environment.sv \
    mem_test.sv \
    mem_top_tb.sv \
    +incdir+. \
    +define+UVM_NO_DEPRECATED \
    +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    -ntb_opts uvm-1.2 -debug_access+all
    
