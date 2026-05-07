# NAND Gate UVM-Style Verification Environment (SystemVerilog + QuestaSim)

## Overview

This project implements a parameterized **NAND gate** in SystemVerilog and verifies it using a **UVM-style layered testbench architecture**.

The verification environment is built using:

- Transaction-based verification
- Generator / Driver / Monitor / Scoreboard architecture
- Mailbox-based communication
- Interface-based DUT connectivity
- Randomized stimulus generation
- Self-checking scoreboard
- Makefile automation
- QuestaSim simulation flow

This project demonstrates how a simple RTL module can be verified using an industry-style scalable verification methodology.

---

## Project Structure

```text
nand_gate/
│
├── rtl/
│   └── nand_gate.sv
│
├── tb/
│   ├── nand_if.sv
│   ├── nand_pkg.sv
│   ├── nand_txn.sv
│   ├── generator.sv
│   ├── driver.sv
│   ├── monitor.sv
│   ├── scoreboard.sv
│   ├── env.sv
│   └── tb_nand_uvm_style.sv
│
├── sim/
│   ├── Makefile
│   └── wave.do
│
└── README.md
## RTL Design
###Parameterized NAND Gate
```text
module nand_gate #(parameter WIDTH = 4)(
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    output logic [WIDTH-1:0] y
);

    assign y = ~(a & b);

endmodule
```
---
##Verification Architecture

The verification environment follows a layered UVM-style flow:
```text
Generator
    ↓
Driver
    ↓
   DUT
    ↓
Monitor
    ↓
Scoreboard
```
---
## Verification Components
### Transaction (nand_txn)

Represents randomized DUT stimulus.

- Randomized inputs
- Output storage
- Display utility

### Generator

Creates randomized transactions and sends them to the driver using a mailbox.

### Driver

Applies transactions to the DUT through a virtual interface.

### Monitor

Observes DUT activity and forwards captured transactions to the scoreboard.

### Scoreboard

Performs self-checking verification using a reference model.

Expected output:
```text
y = ~(a & b)
```
### Environment (env)

Connects all verification components together.

## Simulation Flow

### Compile

```bash
make compile
```

### Run Simulation

```bash
make run
```

### Run GUI + Waveforms

```bash
make gui
```

### Clean Generated Files

```bash
make clean
```

---

## Sample Simulation Output

```text
[PASS] a=b b=d y=6
[PASS] a=1 b=f y=e
[PASS] a=c b=9 y=7
[PASS] a=7 b=9 y=e
[PASS] a=1 b=b y=e
[PASS] a=8 b=3 y=f
[PASS] a=3 b=0 y=f
[PASS] a=7 b=7 y=8
[PASS] a=3 b=c y=f
[PASS] a=7 b=d y=a
[PASS] a=9 b=9 y=6
Simulation completed
```

---

## Features Implemented

- Parameterized RTL design
- Random stimulus generation
- Self-checking scoreboard
- Mailbox-based communication
- Virtual interface connectivity
- UVM-style modular architecture
- Makefile automation
- QuestaSim waveform debugging
- Layered verification environment

---

## Tools Used

- SystemVerilog
- QuestaSim 2024.1
- VS Code
- GNU Make
- Git & GitHub

---

## Learning Outcomes

This project demonstrates:

- RTL design using SystemVerilog
- Scalable verification architecture
- Transaction-based verification
- Class-based testbench development
- Verification component communication
- Package/import/include usage
- Industry-style simulation flow
- Randomized verification methodology

---
