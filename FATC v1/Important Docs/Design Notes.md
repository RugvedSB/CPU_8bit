# FATC v1(Fundamental Arithmetic & Control CPU) – Design Notes

## 1. Architecture Overview

FATC v1 is an 8-bit CPU designed using a datapath + control unit architecture.

- Control Unit: FSM-based controller
- Datapath: Registers + ALU + Result register
- Output width: 16-bit result

---

## 2. Control Unit FSM

State sequence:

IDLE → LOAD_A → LOAD_B → EXECUTE → WRITE → IDLE

Signal behavior:

- LOAD_A  : enable register A
- LOAD_B  : enable register B
- WRITE   : enable result register

Operation latency = 5 clock cycles from start pulse.

---

## 3. ALU Operations

| Opcode | Operation |
|--------|-----------|
| 00     | ADD       |
| 01     | SUB       |
| 10     | MUL       |
| others | DEFAULT 0 |

Flags:
- CF : Carry Flag
- ZF : Zero Flag

---

## 4. Timing Characteristics

- Clock period: 10 ns
- Setup slack: Positive
- Hold slack: Positive
- No timing violations observed after synthesis.

---

## 5. Design Decisions

- Unsigned arithmetic used in Version 1 for simplicity.
- Combinational ALU with registered outputs.
- FSM kept minimal for deterministic execution.
- Architecture kept synthesis-friendly for ASIC flow.

---

## 6. Future Improvements (Version 2)

- Signed arithmetic support
- Basic instruction set (ISA)
- Program memory
- Extended flags


