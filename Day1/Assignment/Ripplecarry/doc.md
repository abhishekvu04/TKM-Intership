# ⚡ 4-bit Ripple Carry Adder (Verilog HDL)

## 📌 Overview
This project implements a **4-bit Ripple Carry Adder** using Verilog HDL. It performs binary addition of two 4-bit inputs along with an initial carry-in signal. The architecture is built hierarchically using modular Full Adders connected in series, where the carry bit propagates sequentially from the Least Significant Bit (LSB) to the Most Significant Bit (MSB).



---

## ⚙️ Features
* **4-bit Binary Addition:** Easily handles operations from `0x0` to `0xF`.
* **Carry-In Support:** Allows cascading multiple modules for larger bit-widths.
* **Modular RTL Design:** Utilizes a clean, structural structural style by instantiating 1-bit full adders.
* **Simulation Verified:** Complete with a testbench covering corner test cases (edge handling & overflow).

---

## 🧠 Working Principle
A ripple carry adder is composed of chained 1-bit full adders. Each full adder stage processes its respective bits ($A_i$, $B_i$) and the carry output generated from the previous stage ($C_i$).

The underlying logical expressions used for each stage are:
* **Sum:** $$S = A \oplus B \oplus C_{in}$$
* **Carry:** $$C_{out} = (A \cdot B) + (C_{in} \cdot (A \oplus B))$$

---

## 🔌 Ports Configuration

### Inputs
| Port Name | Bit Width | Description |
| :--- | :---: | :--- |
| `a` | `[3:0]` | First 4-bit binary operand |
| `b` | `[3:0]` | Second 4-bit binary operand |
| `cin` | `[0:0]` | Initial input carry-in bit |

### Outputs
| Port Name | Bit Width | Description |
| :--- | :---: | :--- |
| `s` | `[3:0]` | Final calculated 4-bit Sum vector |
| `cout` | `[0:0]` | Final overflow Carry-out bit |

---

## 🧪 Simulation & Test Cases

The design has been validated against the following verification matrix:

| Case | `a` | `b` | `cin` | Expected `s` | Expected `cout` | Verification Context |
| :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **1** | `0000` | `0000` | `0` | `0000` | `0` | Reset / Baseline Condition |
| **2** | `0010` | `0010` | `0` | `0100` | `0` | Simple Binary Addition |
| **3** | `0010` | `0010` | `1` | `0101` | `0` | Addition with active Carry-In |
| **4** | `1111` | `0001` | `0` | `0000` | `1` | Maximum overflow vector handling |
| **5** | `1111` | `0000` | `1` | `0000` | `1` | Complete cascade carry propagation |

### 📊 Waveform Analysis
* **Ripple Effect:** The carry bit initiates at the LSB position (`fa0`) and ripples sequentially up to the MSB stage (`fa3`).
* **Propagation Delay:** In real hardware simulation, the stable final output at `cout` is bound by the cumulative gate delay of all internal stages.

---

## 🚀 Applications
* Foundational blocks inside Arithmetic Logic Units (**ALUs**).
* Hardwired FPGA arithmetic logic units.
* General low-power digital signal architectures and computer design.
