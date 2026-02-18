## 📌 Project Specifications

### 🧠 Design Information
- Project Name: **F.A.T.C (Fundamental Arithmetic & Control)**
- Design Type: 8-bit CPU (Datapath + FSM Control)
- HDL: Verilog
- Arithmetic Type: Unsigned
- Output Width: 16-bit result
- Supported Operations:
  - ADD
  - SUB
  - MUL

---

### ⚙️ Technology & PDK
- Process Technology: **130 nm**
- PDK: SKY130 (SkyWater 130nm Open PDK)
- Standard Cell Library: `sky130_fd_sc_hd`

---

### 🧩 Architecture Details
- Control Unit: FSM-based controller
- Datapath Components:
  - Register A (8-bit)
  - Register B (8-bit)
  - ALU
  - Result Register (16-bit)
- Flags:
  - CF (Carry Flag)
  - ZF (Zero Flag)

---

### ⏱ Timing Specifications
- Clock Port: `clk`
- Clock Period: 10 ns (100 MHz)
- Setup Slack: Positive
- Hold Slack: Positive
- Timing Violations: None

---

### 🔬 Synthesis Statistics
- Number of Standard Cells: ~570
- Flip-Flops (DFFs): 35
- Chip Area: ~5496 µm²
- Number of Wires: 561
- Number of Wire Bits: 591

---

### 🏗 ASIC Flow
- RTL Design → Functional Simulation
- Logic Synthesis (Yosys)
- Static Timing Analysis (STA)
- Floorplanning
- Placement & Routing (OpenROAD)
- Final Layout (GDSII Generated)

---

### 🛠 Tools Used
- Verilog HDL
- OpenLane Flow
- Yosys
- OpenROAD
- Magic VLSI
- SKY130 PDK
