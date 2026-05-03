#  AND Gate RTL Design + Verification (SystemVerilog + QuestaSim)

##  Overview
This project implements a **parameterized AND gate** in SystemVerilog and verifies it using a structured verification environment.

The verification approach includes:
- Directed testing  
- Constrained-random testing  
- Assertion-Based Verification (SVA)  

The simulation flow is automated using **Makefile + QuestaSim**, following an industry-style RTL verification methodology.



## Project Structure
```text
and_gate/
│
├── rtl/
│   └── and_gate.sv              # Parameterized RTL design
│
├── tb/
│   ├── tb_and_direct.sv         # Directed testbench
│   ├── tb_and_random.sv         # Random testbench
│   └── tb_and_assert.sv         # Assertion-based testbench
│
├── sim/
│   ├── Makefile                 # Build + run automation
│   ├── wave.do                  # Waveform configuration
│
├── results/                     # Simulation logs (optional)
└── README.md
```

## Truth Table

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

---
## Design Description
- Parameterized AND Gate RTL
- Supports scalable bit-width (1-bit to N-bit)
- Fully combinational design
- Reusable RTL component


##  Verification Methodology
### 1. Directed Testbench
- Covers all possible input combinations
- Ensures basic functional correctness
- Uses self-checking logic

### 2. Random Testbench
- Uses $urandom for stimulus generation
- Improves functional coverage
- Includes PASS/FAIL counters
- Detects unexpected corner cases

### 3. Assertion-Based Testbench (SVA) 
- Clocked assertions using @(posedge clk) 
- Automatically checks correctness of DUT 
- Flags violations using $error 
- Industry-standard verification practice

---


## Simulation Flow

```bash
make compile   # Compile RTL + TB
#Run Individual Tests
make run_direct
make run_random
make run_assert
#GUI Mode
make gui_direct 
make gui_random
make gui_assert
```

## 📊 Sample Output

```text
======= Random Test =======
✔ PASS: a=3 b=5 y=1
✔ PASS: a=7 b=2 y=2
✔ PASS: a=F b=1 y=1
✔ PASS: a=2 b=4 y=0
----------------------------------
PASS=20 FAIL=0
Random test completed
```

##  Learning Outcome

This project demonstrates:

- SystemVerilog RTL design
- Verification methodology (directed + random + SVA)
- Basic assertion-based verification
- Structuring a mini DV environment
- Industrial simulation flow using Makefile automation  
- Debugging using waveforms in QuestaSim  

##  Tools Used

- SystemVerilog  
- QuestaSim 2024.1  
- VS Code  
- Makefile  
- Git & GitHub 