# ALU Calculator

This project implements a simple Arithmetic Logic Unit (ALU) calculator using Verilog. The ALU supports basic arithmetic and logical operations.

## How to simulate

To simulate the ALU calculator, you can use a Verilog simulator such as Icarus Verilog. Follow these steps:

Run the commands in a terminal:

Access the folder where the files are located:

```bash
cd alu-calculator
```

Compile the Verilog files:

```bash
iverilog -o simulation alu.v tb_alu.v
```

Run the simulation:

```bash
vvp simulation
```

View the waveform (if using a waveform viewer like GTKWave):

```bash
gtkwave waves.vcd
```