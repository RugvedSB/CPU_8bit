# 🚀 F.A.T.C v2 — Fundamental Arithmetic & Control (Enhanced Version)

**8-bit CPU | Full RTL-to-GDSII ASIC Implementation**

FATCv2 is a significantly enhanced version of the original FATC CPU, designed to improve architectural depth, RTL quality, and implementation complexity while executing a complete RTL-to-GDSII ASIC flow.

This version reflects a transition from a basic CPU design to a **more realistic and synthesis-intensive hardware system**.

---

## 📌 Project Overview

The goal of FATCv2 was to:

- Improve RTL modularity and scalability  
- Strengthen datapath and control integration  
- Increase design complexity to better reflect real ASIC designs  
- Execute a clean and timing-correct RTL-to-GDS flow  

---

## 🧠 Architecture Highlights

- Datapath + FSM-based Control Unit  
- Enhanced control complexity and signal routing  
- 8-bit input datapath  
- 16-bit result output  

### 🔧 Supported Operations

- ADD  
- SUB  
- MUL  
- OR
- NOR
- AND
- NAND
- XOR

### 🚩 Flags

- Carry Flag (CF)  
- Zero Flag (ZF)  

---

## 🧱 Design Architecture

### 🔹 Key Components

- Register A (8-bit)  
- Register B (8-bit)  
- ALU  
- Result Register (16-bit)  
- FSM-based Control Unit  

---

## 🧪 Verification

- System-level self-checking testbench  
- Directed test cases  
- Timing-aware validation  
- FSM cycle verification  

Simulation confirms correct functionality and sequencing.

---

## ⚙️ ASIC Implementation Flow

1. RTL Design (Verilog)  
2. Functional Simulation  
3. Logic Synthesis (Yosys)  
4. Static Timing Analysis (Setup & Hold clean)  
5. Floorplanning  
6. Placement  
7. Clock Tree Synthesis  
8. Routing  
9. Final GDSII Generation  

---

## 🛠 Tools Used

- Verilog HDL  
- OpenLane  
- Yosys  
- OpenROAD  
- Magic VLSI  
- SKY130 PDK  

---

## 📊 Synthesis & Design Summary (FATCv2)

- **Total Standard Cells:** **8718**  
- **Flip-Flops:** ~2100+  
- **Wire Count:** 8700  
- **Wire Bits:** 8724  

### ⏱ Timing Status

- Setup Slack: Positive  
- Hold Slack: Positive  
- Timing Violations: None  

---

## 🆚 Comparison with FATCv1

| Feature | FATCv1 | FATCv2 |
|--------|--------|--------|
| Standard Cells | ~570 | **8718** |
| Flip-Flops | 35 | **~2100+** |
| Complexity | Basic CPU | **High complexity design** |
| Implementation Depth | Introductory | **Advanced RTL + PD understanding** |

---

## 🖼 Layout

The final ASIC layout was successfully generated and visualized using Magic VLSI.

*(Attach your .mag or GDS screenshot here)*

---

## 🔄 Key Improvements

- Significant increase in design complexity  
- More realistic synthesis characteristics  
- Better understanding of large-scale netlists  
- Improved RTL structuring and control logic  

---

## 🧠 Key Learnings

- Impact of RTL decisions on synthesis size and routing  
- Handling large netlists and high cell counts  
- Debugging timing vs functional behavior  
- Bridging frontend RTL with backend physical design