<img width="1288" height="232" alt="image" src="https://github.com/user-attachments/assets/1d8bf00a-ff4a-49fe-8fbb-caa5a42ca6cc" />
## 4-Bit Binary Coded Decimal (BCD) Adder

This repository contains a **4-Bit Binary Coded Decimal (BCD) Adder** implemented in Verilog and verified using a modern SystemVerilog testbench. The project demonstrates hardware design principles, BCD correction logic, and interface-based verification methodologies on EDA Playground.

---

## How the Hardware Works

A standard 4-bit binary adder can output values up to 15 (or 19 with a carry-in), but a valid BCD digit cannot exceed 9 ($1001_2$). 

The architecture consists of two main stages:
1. **Initial Binary Addition:** Adds two 4-bit BCD inputs (`A` and `B`) along with a carry-in (`cin`).
2. **Correction Logic:** Detects if the intermediate sum exceeds 9 or if an intermediate carry-out is generated. If either condition is true, the result is invalid in BCD. The hardware automatically adds $6$ ($0110_2$) to skip the six invalid states and outputs the correct BCD sum and a final carry-out (`cout`).



---

## Verification Setup

To mimic real-world ASIC/FPGA verification practices, the testbench does not connect directly to the hardware ports. Instead, it utilizes a **SystemVerilog Interface**. 

The interface encapsulates all the input signals (`A`, `B`, `cin`) and output signals (`Sum`, `cout`) into a single, manageable channel. This decouples the test stimulus from the physical design under test (DUT), making the verification environment modular and scalable.

---

## Simulation and Waveform Results

The verification environment tests the design across various boundary conditions:

* **Standard Addition (No Correction):** * *Inputs:* $A = 4$, $B = 4$, $cin = 0$
  * *Expected Output:* $Sum = 8$, $cout = 0$
  * *Behavior:* The result is $\le 9$, so no correction factor is applied.
* **BCD Correction Enabled:** * *Inputs:* $A = 7$, $B = 6$, $cin = 0$
  * *Expected Output:* $Sum = 3$, $cout = 1$ (representing 13)
  * *Behavior:* The initial binary sum is 13 ($1101_2 > 9$). The detection circuit triggers, adds 6, resulting in a BCD correction.
* **Maximum Boundary Check:** * *Inputs:* $A = 9$, $B = 9$, $cin = 1$
  * *Expected Output:* $Sum = 9$, $cout = 1$ (representing 19)
  * *Behavior:* The system is pushed to its absolute structural limit and correctly handles the maximum possible BCD input.

---

