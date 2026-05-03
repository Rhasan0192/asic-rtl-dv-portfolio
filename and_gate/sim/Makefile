.PHONY: compile run_direct run_random run_assert regress gui_direct gui_random gui_assert
# Top-level testbenches
TB_DIRECT = tb_and_direct
TB_RANDOM = tb_and_random
TB_ASSERT = tb_and_assert

# Files
RTL = ../rtl/and_gate.sv
TB  = ../tb/*.sv

# -----------------------------------
# Compile
# -----------------------------------
compile:
	vlib work
	vlog -sv $(RTL) $(TB)

# -----------------------------------
# Run individual tests (CLI)
# -----------------------------------
run_direct:
	vsim -c $(TB_DIRECT) -do "run -all; quit"

run_random:
	vsim -c $(TB_RANDOM) -do "run -all; quit"

run_assert:
	vsim -c $(TB_ASSERT) -do "run -all; quit"

# -----------------------------------
# GUI mode (waveform debugging)
# -----------------------------------
gui_direct:
	vsim -voptargs=+acc $(TB_DIRECT) -do "log -r /*; do wave.do; run -all"

gui_random:
	vsim -voptargs=+acc $(TB_RANDOM) -do "log -r /*; do wave.do; run -all"

gui_assert:
	vsim -voptargs=+acc $(TB_ASSERT) -do "log -r /*; do wave.do; run -all"

# -----------------------------------
# Regression (run all tests)
# -----------------------------------
regress: compile run_direct run_random run_assert