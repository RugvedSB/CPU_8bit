# F.A.T.C – Fundamental Arithmetic & Control  
### 8-bit CPU | RTL-to-GDS ASIC Project

🚀 **F.A.T.C** is an 8-bit CPU designed from scratch using Verilog HDL and implemented through a complete **ASIC design flow**, starting from RTL design and ending with final GDSII layout generation.

This project demonstrates practical understanding of digital design, verification, synthesis, static timing analysis, and physical design.

---

## 📌 Project Overview

The goal of this project was to design a small CPU architecture and take it through a **full silicon implementation flow**.

### Architecture Highlights
- Datapath + Control Unit based design
- FSM-driven control logic
- 8-bit input datapath
- 16-bit result output
- Arithmetic operations:
  - ADD
  - SUB
  - MUL
- Carry Flag (CF) and Zero Flag (ZF)

---

## 🧱 Design Architecture

### Top Level



---

## 🧪 Verification

- System-level self-checking testbench
- Reference model based checking
- Directed + random test cases
- Cycle-accurate FSM timing validation

Simulation confirms correct operation sequencing and output generation.

---

## ⚙️ ASIC Implementation Flow

This project was implemented using an open-source RTL-to-GDS flow.

### Flow Steps
1. RTL Design (Verilog)
2. Functional Simulation
3. Logic Synthesis
4. Static Timing Analysis (STA)
5. Floorplanning
6. Placement
7. Clock Tree Synthesis
8. Routing
9. Final GDSII Generation

---

## 🛠 Tools Used

- Verilog HDL
- OpenLane
- Yosys (Synthesis)
- OpenROAD (Physical Design)
- Magic VLSI (Layout Visualization)
- SKY130 PDK

---

## 📊 Synthesis Summary

- Standard Cells: ~570
- Flip-Flops: 35
- Timing Status:
  - Setup Slack: Positive
  - Hold Slack: Positive
- Timing Violations: None

---

## 🧩 Directory Structure



---

## 🖼 Layout

The final ASIC layout was successfully generated and viewed using Magic VLSI.

<img width="967" height="912" alt="Screenshot 2026-02-15 123543" src="https://github.com/user-attachments/assets/e5ae4d85-5271-439b-bfef-901d84239469" />


---

## 📚 Key Learnings

- FSM-based CPU control design
- Writing synthesizable RTL
- Timing-aware digital design
- Understanding RTL → Gates → Physical Layout transformation
- ASIC physical design fundamentals

---

## 🚀 Future Improvements (Version 2)

- Signed arithmetic support
- Instruction set (basic ISA)
- Program memory integration
- Pipeline enhancements
- Improved flag logic

---

## 👨‍💻 Author

Designed and implemented as a learning project to gain hands-on experience in RTL Design and ASIC Physical Design flow.

---

## ⭐ If you found this project interesting, feel free to star the repository!

