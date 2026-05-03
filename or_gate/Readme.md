#  OR Gate RTL Design + Unified Verification (SystemVerilog + QuestaSim)

##  Overview
This project implements a **parameterized OR gate** in SystemVerilog and verifies it using a **unified verification environment**.

The verification flow integrates:
- Directed testing  
- Constrained-random testing  
- Scoreboard-based checking  
- Assertion-Based Verification (SVA)  
- Functional coverage  

This project reflects a **mini industry-style verification environment**.

---

## Project Structure

or_gate/
- rtl/
  - or_gate.sv
- tb/
  - tb_or_unified.sv
- sim/
  - Makefile
  - wave.do
- results/
- README.md

---

##  RTL Design

```systemverilog
module or_gate #(
    parameter WIDTH = 4
)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] y
);

always_comb begin
    y = a | b;
end

endmodule
```
---
##  Features
- Parameterized width (scalable design)
- Pure combinational logic
- Reusable RTL block

## Verification Architecture
The testbench (tb_or_unified.sv) combines multiple verification techniques:
### Directed Testing
- Covers basic input combinations
- Ensures initial correctness
### Random Testing
- Uses $urandom for stimulus generation
- Improves coverage of input space
### Scoreboard (Reference Model)
- Golden model implemented as function
- Compares DUT output with expected result
### Assertions (SVA)
- Clocked assertions using @(posedge clk)
- Automatically detects mismatches
### Functional Coverage
- Coverpoints on inputs and output
- Cross coverage of a and b
---
##  Simulation Flow
```text
make compile
make run
make gui
```

## Sample Simulation Output
```text
==== OR Gate Unified Verification ====
✔ PASS: a=0 b=0 y=0
✔ PASS: a=0 b=1 y=1
✔ PASS: a=1 b=0 y=1
✔ PASS: a=1 b=1 y=1
✔ PASS: a=3 b=5 y=7
✔ PASS: a=7 b=2 y=7
✔ PASS: a=F b=1 y=F
...
----------------------------------
PASS=24 FAIL=0
✅ TEST PASSED
```
---
## Key Features
- Parameterized RTL design
- Unified verification environment
- Scoreboard-based checking
- Assertion-based verification (SVA)
- Functional coverage integration
- Makefile automation
- PASS/FAIL tracking

## Learning Outcomes
- Writing scalable RTL in SystemVerilog
- Building a unified verification environment
- Implementing scoreboard-based checking
- Using SystemVerilog Assertions (SVA)
- Applying functional coverage concepts
- Automating simulation with Makefile
- Structuring verification like real DV teams
##Tools Used
- SystemVerilog
- QuestaSim 2024.1
- VS Code
- GNU Make
- Git & GitHub
