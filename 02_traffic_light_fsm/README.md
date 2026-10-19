# Traffic Light FSM — Mission 01

## Project Overview
A three-state Moore FSM implemented in Verilog and verified using Vivado simulation.

## State Transition
GREEN → YELLOW → RED → GREEN

## Design
- State register with asynchronous active-low reset
- Combinational next-state logic
- Moore output logic for red, yellow, and green LEDs

## Verification
- Tool: AMD Xilinx Vivado
- Testbench: `traffic_light_fsm_tb.v`
- Verified state transitions: GREEN → YELLOW → RED → GREEN
- LED output checks: PASS
- Final simulation result: `ALL FSM TESTS PASSED`

## Files
- `traffic_light_fsm.v` — FSM RTL design
- `traffic_light_fsm_tb.v` — simulation testbench

## Lessons Learned
- Separating sequential logic from combinational logic
- Implementing a Moore FSM
- Debugging reset initialization in a testbench
- Verifying state transitions using simulation waveforms

## Future Improvements
- Add a counter to control state duration
- Add reset and invalid-state test cases
- Verify LED behavior on an FPGA board

**Scope note:** This project has been verified in simulation. FPGA hardware verification has not yet been claimed.