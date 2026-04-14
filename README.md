# 🚀 CPU_8bit Projects

**RTL → GDSII Implementations of Custom CPU Architectures**

This repository contains multiple versions of a custom-designed **8-bit CPU**, developed using **Verilog HDL** and implemented through a complete **ASIC RTL-to-GDSII flow** using the **SKY130 PDK**.

Each version represents a step forward in design complexity, verification quality, and physical implementation.

---

## 🧠 Project Evolution

### 🔹 FATC_v1 — Fundamental Arithmetic & Control (Completed)

- First complete RTL → GDS implementation  
- FSM-controlled datapath CPU  
- Functional verification + timing clean design  
- ~570 standard cells synthesized  

---

### 🔹 FATC_v2 — Enhanced CPU Implementation (Completed ✅)

- Improved RTL architecture and modular design  
- Refined control logic and datapath integration  
- Full ASIC flow executed with successful GDSII generation  
- Better design stability and implementation understanding  

---

## ⚙️ ASIC Design Flow

All versions follow a complete open-source ASIC flow:

1. RTL Design (Verilog)  
2. Functional Simulation  
3. Logic Synthesis (Yosys)  
3. Static Timing Analysis  
4. Floorplanning  
5. Placement & Routing (OpenROAD)  
6. GDSII Generation  
7. Layout Visualization
