# 4-Way Traffic Light Controller

## About the Project
This project involves designing and implementing a 4-way traffic light controller with three lights (red, yellow, and green) for each direction. The traffic light system is designed using Verilog and simulated using Vivado. The synthesis is performed using Libero v9.1, including Synplify for synthesis and ModelSim for simulation. The hardware implementation is done on an Actel ProASIC3E FPGA with a custom PCB featuring 12 LEDs representing the traffic lights for four directions.

## Features
1. **Clock Generation**:
   - A 1Hz clock is created using a 40MHz clock with clock enable, which is used as the main clock to control the traffic lights.

2. **Modes of Operation**:
   - **Mode A (Normal Mode)**: Standard traffic light operation.
   - **Mode B (Yellow Blinking Mode)**: Used when there is not much traffic on the road. The yellow signal light blinks alternately.

3. **Finite State Machine (FSM)**:
   - The traffic light controller is implemented using an FSM with a total of 11 states. The signal starts from the east direction and transitions through the states as follows:
     - **S0**: All 12 signals are red.
     - **S1**: East green, rest red.
     - **S2**: East yellow, rest red.
     - **S3**: North green, rest red.
     - **S4**: North yellow, rest red.
     - **S5**: West green, rest red.
     - **S6**: West yellow, rest red.
     - **S7**: South green, rest red.
     - **S8**: South yellow, rest red.
     - **S9**: All directions yellow (blinking mode).
     - **S10**: All directions off (blinking mode).

4. **Light Assignments**:
   - If any light (red, yellow, or green) is on, it is assigned a value of 1.
   - If a light is off (as used in state S10), it is assigned a value of 0.

5. **Timing Durations**:
   - Red light: 5 seconds.
   - Yellow light: 2 seconds.
   - Green light: 2 seconds.
   - Yellow blinking mode: On and off for 2 seconds each.

## Code Description
The Verilog code consists of 12 separate light outputs (3 for each direction: EAST, NORTH, WEST, SOUTH) for red, yellow, and green lights.

### Inputs
- **reset**: Active high reset that starts back to S0 state if 1.
- **mode_select**: 1 for yellow blinking mode, else 0 for normal mode.
- **clock**: 40MHz clock.

### Outputs
- **east_green, east_yellow, east_red**
- **north_green, north_yellow, north_red**
- **west_green, west_yellow, west_red**
- **south_green, south_yellow, south_red**


### Simulation and Synthesis
- **Simulation**: Conducted using Vivado 2023.2.
- **Synthesis**: Performed using Libero v9.1.
- **Implementation**: Deployed on Actel ProASIC3E FPGA with custom PCB for LED representation.

## Usage
1. **Reset**: To initialize the system, set `p_reset` to 1.
2. **Mode Selection**: Set `mode_select` to 0 for normal operation or 1 for yellow blinking mode.
3. **Clock**: Provide a 40MHz clock signal to the `clk` input.

---
![FPGA IMPLEMENTATION](https://drive.google.com/file/d/1Yjt9XYuChTWxGTmxkCaUSf5qdlRXEGUA/view?usp=sharing " ")

## Video Link
- Link : https://drive.google.com/file/d/12gFK8LWi4xLRS8w0YIiXtJnnLKBB2iQB/view?usp=sharing
