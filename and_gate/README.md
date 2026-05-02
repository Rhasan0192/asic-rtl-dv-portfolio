#  AND Gate RTL Design + Verification (SystemVerilog + QuestaSim)

##  Overview
This project implements a simple **2-input AND gate** in SystemVerilog and verifies it using a **self-checking testbench**.  
The simulation flow is automated using **Makefile + QuestaSim**, following a basic industry-style RTL verification structure.


## Project Structure
```text
and_gate/
│
├── rtl/
│   └── and_gate.sv
│
├── tb/
│   └── tb_and_gate.sv
│
├── sim/
│   ├── Makefile
│   ├── wave.do
│
├── results/
└── README.md
```

### Truth Table

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

---

##  Verification Methodology

The testbench is **self-checking**, meaning:
- Inputs are applied automatically
- Expected output is computed inside the testbench
- DUT output is compared with expected result
- PASS/FAIL messages are printed

---

##  Simulation Flow (I have used VS code and Questasim)

### 1. Compile design (Compiles RTL + testbench)
make compile
### 2. Run Testbench (Runs simulation in CLI mode)
make run
### 3. Run simulation with GUI (Opens QuestaSim GUI with waveforms)
make gui

##  Sample Output

Starting AND gate verification <br>
✔ PASS: a=0 b=0 y=0 <br>
✔ PASS: a=0 b=1 y=0 <br>
✔ PASS: a=1 b=0 y=0 <br>
✔ PASS: a=1 b=1 y=1 <br>
Test completed

##  Learning Outcome

This project demonstrates:

- Basic RTL design in SystemVerilog  
- Verification methodology using self-checking testbench  
- Industrial simulation flow using Makefile automation  
- Debugging using waveforms in QuestaSim  

