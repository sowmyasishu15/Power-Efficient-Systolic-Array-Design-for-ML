**Power-Efficient Systolic Array for ML Acceleration**

This repository contains the Verilog source code and design documentation for the project focused on creating a power-efficient systolic array for machine learning acceleration.

**Abstract**

Factored Systolic Arrays using Radix-8 Multiplication for Machine Learning Acceleration are often bottlenecked by the accumulator stage. This project addresses this latency by replacing the conventional Ripple Carry Adder with a Radix-4 Carry Save Adder (CSA), eliminating the critical carry propagation delay. The proposed Processing Element was designed in Verilog and implemented on a Xilinx Spartan-3E FPGA, demonstrating significant improvements in performance, area, and power compared to baseline designs.

**System Architecture**

The core of this project is an optimized Processing Element (PE) designed for a Radix-8 Factored Systolic Array (FSA) context. The key innovation is the use of a Radix-4 CSA accumulator to break the performance bottleneck caused by traditional adders.
Detailed Block Diagram of the Proposed PE:

<img width="500" height="500" alt="block diagram" src="https://github.com/user-attachments/assets/38eb1a19-5005-4d16-8dec-b61419e09c80" />

**Implementation and Results**

The design was written in Verilog HDL and functionally verified using a comprehensive testbench in ModelSim. Synthesis and implementation were performed using the Xilinx ISE Design Suite.

**Simulation Waveform:**

The following waveform from ModelSim verifies the correct internal operations of the Radix-8 Booth partial product generation logic.
<img width="620" height="424" alt="simulation waveform" src="https://github.com/user-attachments/assets/bfcd6a9d-8e3a-460b-9a21-f2ae6748a470" />

**Comparative Synthesis Results:**

The proposed PE design (using CSA) was compared against its baseline (using RCA) and other common architectures. The results demonstrate clear superiority in performance and efficiency.
<img width="831" height="529" alt="results table" src="https://github.com/user-attachments/assets/9fafc70b-8ead-45d6-8891-2074f657a350" />

**Key Achievements:**

46.0% faster (lower critical path delay) than the baseline RCA design.

21.1% smaller (fewer Slices utilized) than the baseline.

3.5% lower estimated power consumption.

**Technologies Used**

Hardware Description Language: Verilog

Simulation Tool: ModelSim

Synthesis & Implementation: Xilinx ISE Design Suite 14.7

Target Hardware: Xilinx Spartan-3E FPGA
