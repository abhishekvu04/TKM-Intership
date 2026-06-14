<img width="1288" height="232" alt="image" src="https://github.com/user-attachments/assets/1d8bf00a-ff4a-49fe-8fbb-caa5a42ca6cc" />
# 4-Bit BCD Adder with SystemVerilog Verification


This repository contains the design and verification of a **4-Bit Binary Coded Decimal (BCD) Adder**. The hardware is implemented in Verilog, and its correctness is verified using a modern SystemVerilog testbench architecture. 

The project serves as a practical demonstration of hardware design, interface-driven verification, and simulation using **EDA Playground**.

---

## 🛠️ How the Hardware Works

A standard 4-bit binary adder can output values up to 15 ($4'b1111$). However, in BCD representation, a single digit can only range from **0 to 9**. Any result greater than 9 is considered invalid.

To handle this, the hardware implements specific correction logic:
1. **Addition:** The system adds two 4-bit BCD numbers (`A` and `B`) along with a carry-in (`cin`).
2. **Detection:** An internal circuit monitors if the intermediate sum exceeds 9 or generates an intermediate carry.
3. **Correction:** If an invalid BCD state or carry is detected, the hardware automatically **adds 6 ($4'b0110$)** to the intermediate result. This adjusts the binary value into the correct BCD sum and generates the appropriate final carry-out (`cout`).

---

## 🏗️ The Verification Setup

To mimic industry-standard verification practices, the testbench does not connect directly to the hardware ports. Instead, it utilizes a **SystemVerilog Interface**. 

* **The Interface:** Groups the inputs (`A`, `B`, `cin`) and outputs (`Sum`, `cout`) into a single virtual channel.
* **The Benefit:** Encapsulating the signals improves code modularity, readability, and scalability, reflecting how real-world, complex SoC verification is handled.

---

## 📊 Simulation & Waveform Results

The SystemVerilog testbench evaluates the design across multiple edge cases to ensure robust operation. The key verification scenarios include:

### 1. Standard Addition (No Correction)
* **Input:** `A = 4`, `B = 4`, `cin = 0`
* **Expected Output:** `Sum = 8`, `cout = 0`
* **Behavior:** The result ($\le 9$) is a valid BCD digit. The correction circuit remains idle.

### 2. BCD Correction Enabled
* **Input:** `A = 7`, `B = 6`, `cin = 0`
* **Expected Output:** `Sum = 3`, `cout = 1` (Representing 13)
* **Behavior:** The raw binary sum is 13. The detection circuit triggers, adds 6 ($13 + 6 = 19$, which in binary is $5'b1\_0011$), resulting in a BCD `Sum` of 3 and a `cout` of 1.

### 3. Maximum Boundary Check
* **Input:** `A = 9`, `B = 9`, `cin = 1`
* **Expected Output:** `Sum = 9`, `cout = 1` (Representing 19)
* **Behavior:** This test exercises the absolute upper limit of the design. The system handles the boundary condition perfectly, correcting the total value of 19 to a BCD `Sum` of 9 and a `cout` of 1.

---

## 🚀 How to Run on EDA Playground

1. Copy the design files (`bcd_adder.v`) and testbench files (`tb_bcd_adder.sv`) from this repository.
2. Go to [EDA Playground](https://www.edaplayground.com/).
3. Paste the respective code into the **Design** and **Testbench** windows.
4. Set the **Tools & Simulators** options:
   * **Simulator:** Select a SystemVerilog-compatible tool (e.g., *Aldec Riviera-PRO* or *Synopsys VCS*).
   * **Open EPWave after run:** Check this box to view the simulation waveforms.
5. Click **Run** to execute the testbench and verify the results.
  * *Expected Output:* $Sum = 9$, $cout = 1$ (representing 19)
  * *Behavior:* The system is pushed to its absolute structural limit and correctly handles the maximum possible BCD input.

---

