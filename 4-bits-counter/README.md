# 4 bits counter with reset

This project implements a 4-bit counter with reset functionality using VHDL. The counter increments its value on each clock pulse and can be reset to zero when the reset signal is activated.

---

## Files

- `counter.v`: VHDL source code for the 4-bit counter.
- `tb_counter.v`: Testbench for simulating the counter behavior.
- `README.md`: This readme file.

## How simulate

To simulate the 4-bit counter, you can use a VHDL simulator such as ModelSim or GHDL. Follow these steps:

Run the commands in terminal:

Access the folder where the files are located:

```bash
cd 4-bits-counter
```

Compile the VHDL files:

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