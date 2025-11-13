# 🚀 8-bit Synchronous FIFO Design in Verilog

> Modular, simulation-proven, synchronous FIFO memory with full/empty flags — a core building block for high-performance digital systems.

---

## Project Overview

This project delivers a clean, modular 8-bit synchronous FIFO implemented in Verilog HDL. Designed with separate memory and control modules, it ensures scalable, reusable, and maintainable hardware IP suitable for FPGA or ASIC environments. The FIFO supports simultaneous read/write operations controlled by validated full and empty flags, ensuring data integrity in streaming or buffering applications.

---

## Architecture & Modules

The design splits responsibilities into three focused modules:

- **fifo_mem**: Implements an 8x8-bit memory array, handling synchronous writes and reads.
- **fifo_ctrl**: Maintains independent read and write pointers, entry count, and full/empty status flags.
- **fifo_top**: Integrates memory and control modules, providing a clean interface for external use.

This modular structure isolates logic, simplifying testing and future extension.

---

## Key Features

- **Width & Depth**: 8 bits wide, 8 entries deep FIFO buffer
- **Flags**: Full and empty indicators to prevent overflow and underflow
- **Synchronous Clocking**: Single clock operation for simplified timing closure
- **Reset Support**: Synchronous reset clears pointers and flags
- **Robust Testbench**: Automated stimulus applies edge cases, verifying write/read sequences and flag correctness
- **Extensible Design**: Ready for scaling or adaptation to larger widths and depths

---

## File Layout

| Filename      | Role                                    |
|---------------|-----------------------------------------|
| `fifo_mem.v`  | Memory array and synchronous R/W logic |
| `fifo_ctrl.v` | Pointer and status flag control logic  |
| `fifo_top.v`  | Top-level wrapper integrating modules  |
| `fifo_tb.v`   | Comprehensive testbench for verification|

---

## Interface Signals of `fifo_top`

| Signal         | Type   | Description                        |
|----------------|--------|----------------------------------|
| `clk`          | Input  | System clock                     |
| `rst`          | Input  | Active-high synchronous reset   |
| `write_en`     | Input  | Write enable                    |
| `read_en`      | Input  | Read enable                     |
| `data_in[7:0]` | Input  | 8-bit data to write             |
| `data_out[7:0]`| Output | 8-bit data read                 |
| `full`         | Output | FIFO full flag                  |
| `empty`        | Output | FIFO empty flag                 |

---

## Running Simulation

1. Load `fifo_tb.v` into your Verilog simulator (e.g. Vivado).
2. Run the simulation which will:
   - Reset FIFO and initialize signals
   - Write 8 incremental data values to FIFO
   - Pause, then read all values back sequentially
   - Monitor full and empty flags alongside data integrity
3. Verify waveform or console output for correctness.

Typical console output:

Time= 0 | write=0 read=0 data_in=00 data_out=00 full=0 empty=1
...
Time=150 | write=1 read=0 data_in=07 data_out=00 full=1 empty=0
...
Time=230 | write=0 read=1 data_in=07 data_out=00 full=0 empty=0


---

## Design Insights & Extensions

- **Scalability**: Extend by increasing pointer widths and memory size.
- **Parameterization**: Modify modules for generic data widths and depths.
- **Asynchronous Clocks**: Augment to support async FIFO use cases with dual clock domains.
- **Real-World Applications**: Networking buffers, streaming hardware, embedded systems, and more.

---

## About the Author

Chaurasiya Karan — Digital design enthusiast focusing on robust, reusable hardware IP development.  
Connect on [LinkedIn](https://www.linkedin.com/in/chaurasiya-karan-662a0426b/)| 


---

## 📚 References and Learning

- FIFO Concepts and Verilog Examples: Xilinx & Open-Source Repos  
- Verilog Coding Best Practices & Testbench Development  
- Simulation and Debugging Strategies for Digital Hardware

---

_This project demonstrates professional hardware design skills with clear modularity, correctness, and real-world applicability, making it a strong addition to my HDL portfolio._
