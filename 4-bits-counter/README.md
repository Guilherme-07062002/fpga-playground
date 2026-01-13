# 4-bit counter with reset

This project implements a 4-bit counter with reset functionality using Verilog. The counter increments its value on each clock pulse and can be reset to zero when the reset signal is activated.

---

## Files

- `counter.v`: Verilog source code for the 4-bit counter.
- `tb_counter.v`: Testbench for simulating the counter behavior.
- `README.md`: This readme file.

## How to simulate

To simulate the 4-bit counter, you can use a Verilog simulator such as Icarus Verilog. Follow these steps:

Run the commands in a terminal:

Access the folder where the files are located:

```bash
cd 4-bits-counter
```

Compile the Verilog files:

```bash
iverilog -o simulation counter.v tb_counter.v
```

Run the simulation:

```bash
vvp simulation
```

View the waveform (if using a waveform viewer like GTKWave):

```bash
gtkwave waves.vcd
```