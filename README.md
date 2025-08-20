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
