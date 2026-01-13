# PWM Verilog Module

This project implements a simple PWM (Pulse Width Modulation) module using Verilog. The module generates a PWM signal based on a given duty cycle.

## How to simulate

To simulate the PWM module, you can use a Verilog simulator such as Icarus Verilog. Follow these steps:
Run the commands in a terminal:

Access the folder where the files are located:

```bash
cd pwm
```

Compile the Verilog files:

```bash
iverilog -o simulation pwm.v tb_pwm.v
```

Run the simulation:

```bash
vvp simulation
```

View the waveform (if using a waveform viewer like GTKWave):

```bash
gtkwave waves.vcd
```