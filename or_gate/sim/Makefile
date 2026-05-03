TOP = tb_or_unified

compile:
	vlib work
	vlog -sv ../rtl/or_gate.sv ../tb/tb_or_unified.sv

run:
	vsim -c $(TOP) -do "run -all; quit"

gui:
	vsim -voptargs=+acc $(TOP) -do "log -r /*; do wave.do; run -all"