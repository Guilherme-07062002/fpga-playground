# Traffic Light Controller

This project implements a simple traffic light controller using Verilog. The controller manages the red, yellow, and green lights in a typical traffic light sequence.

## How to simulate

To simulate the traffic light controller, you can use a Verilog simulator such as Icarus Verilog. Follow these steps:
Run the commands in a terminal:

Access the folder where the files are located:

```bash
cd traffic_light
```

Compile the Verilog files:

```bash
iverilog -o simulation traffic_light.v tb_traffic_light.v
```

Run the simulation:

```bash
vvp simulation
```

View the waveform (if using a waveform viewer like GTKWave):

```bash
gtkwave waves.vcd
```