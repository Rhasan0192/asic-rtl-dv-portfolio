TOP = tb_and_gate

RTL = ../rtl/and_gate.sv
TB  = ../tb/tb_and_gate.sv

compile:
	vlib work
	vlog -sv $(RTL) $(TB)

run:
	vsim -c $(TOP) -do "log -r /*; run -all; quit"

gui:
	vsim -voptargs=+acc $(TOP) -do "log -r /*; do wave.do;run -all;