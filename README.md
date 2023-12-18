# Overlapping Sequence Detector
A Verilog project that detect and count the number of overlapping "1011" sequences stored in a ROM.

Verilog Modules:

1- 16 * 32 ROM

2- Parallel-in-serial-out (PISO)

3- Finite-state machine

4- Counter

5- Odd checker

6- Testbench

# Block Diagram
![image](https://github.com/AlaaTaha32/Overlapping-Sequence-Detector/assets/154026967/69f01b28-ca99-49f4-8d20-70ddffc6a904)

# Simulation Results
Simulation is run on Modelsim. Data in address 1 with 2 overlapping sequences waveforms:
![image](https://github.com/AlaaTaha32/Overlapping-Sequence-Detector/assets/154026967/a4272dcb-33d6-448f-9b87-4a8b51369398)

The module is reset, then data in address 2 has 0 detected “1011” overlapping sequences.
![image](https://github.com/AlaaTaha32/Overlapping-Sequence-Detector/assets/154026967/c9659dda-ea79-4129-b379-f552010d2ad4)

The module is reset, then data in address 3 has 1 detected “1011” overlapping sequences.
![image](https://github.com/AlaaTaha32/Overlapping-Sequence-Detector/assets/154026967/1db934e6-66b6-4662-879d-3ac658e2b1e0)


