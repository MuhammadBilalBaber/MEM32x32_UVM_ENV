This project implements a UVM (Universal Verification Methodology) environment to verify the functionality of a 32x32 memory module. The memory under test is organized as 32 words, each 32 bits wide. The environment is designed to perform directed and randomized read/write operations to ensure the correctness of memory behavior under different scenarios.

The UVM testbench is composed of the following components:

=> Sequence & Sequencer – Generates randomized and directed read/write transactions.

=> Driver – Converts sequence items into pin-level signals and drives them to the DUT.

=> Monitor – Passively observes DUT signals and forwards transaction-level data to analysis components.

=> Environment – Connects all agents, monitors, and the scoreboard.

The primary verification objectives are:

=> Validate correct write operations at all valid addresses.

=> Validate correct read operations at all valid addresses.

=> check the functinality for full and half full operation.

=> Check data integrity when performing multiple write-read sequences.

Ensure random and edge-case scenarios (e.g., boundary addresses, back-to-back reads/writes) are properly handled.

This UVM environment provides a reusable and scalable framework, allowing easy extension to more complex memory models or integration in larger SoC verification projects.


<img width="374" height="350" alt="image" src="https://github.com/user-attachments/assets/ee2d9d8e-b9d4-42f0-86a5-41e7b71cdaa6" />
