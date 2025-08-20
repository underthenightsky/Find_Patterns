# Detect "11" Sequence using FSM (Verilog)

## 📌 Project Overview
This project implements a **Finite State Machine (FSM)** in Verilog to detect the sequence **"11"** in a serial input stream of bits.  
The FSM is modeled as a **Mealy machine**, where the output depends on both the current state and the input.

### Example:
- **Input Stream**: `1 0 1 1 0 1 1 1`  
- **Output**:      `0 0 0 1 0 0 1 1`  

Whenever two consecutive `1`s are detected, the output `detected` goes high.

---

## 🧩 FSM Design
### States:
- **S0** → No `1` detected yet  
- **S1** → Last input was `1`  
- **S2** → Sequence `11` detected (output asserted)  

### State Diagram:
  S0 --(1)--> S1
 S1 --(1)--> S2 (detected=1)
 S1 --(0)--> S0
 S2 --(1)--> S2 (detected=1, allows overlapping)
 S2 --(0)--> S0
 ---
 ## 📂 Files
- `find_pattern.v` → Verilog source code for the FSM  
- `find_pattern_tb.v` → Testbench to simulate the design  

---

## ▶️ Simulation
1. Compile the design and testbench using your Verilog simulator (e.g., **Icarus Verilog**, **ModelSim**, or **Vivado**).
2. Run the simulation and generate a waveform (`.vcd`) file.
3. Open the waveform in **GTKWave** (or another viewer) to visualize inputs and outputs.
