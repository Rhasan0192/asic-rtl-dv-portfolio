.PHONY: compile run gui clean

TOP = tb_nand_uvm_style

RTL = ../rtl/nand_gate.sv

TB = \
../tb/nand_if.sv \
../tb/nand_pkg.sv \
../tb/tb_nand_uvm_style.sv

compile:
	vlib work
	vlog -sv +incdir+../tb $(RTL) $(TB)

run:
	vsim -c $(TOP) -do "run -all; quit"

gui:
	vsim -voptargs=+acc $(TOP) -do "log -r /*; run -all"

clean:
	del /Q transcript vsim.wlf 2>nul