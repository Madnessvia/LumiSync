# LumiSync - FPGA Powered Ambient Lighting for Monitors
This repository contains the work for ECE532 at University of Toronto 2025W1
The project is based on Digilent Nexys Video board
Detailed report and presentation slides can be found in ```doc```
A video demo can be found at https://www.youtube.com/watch?v=ZBh9cPyp7LM

## Repository Content
```C
LumiSync
├── README.md
├── doc
├── golden              // golden bitstream and elf
├── hw
│   ├── hw.board
│   │   └── nexys_video // board file
│   ├── hw.hw
│   ├── hw.ip_user_files
│   ├── hw.ipdefs
│   │   ├── IPout       // custom IP
│   │   └── repo        // external IP added to Vivado
│   ├── hw.srcs
│   │   ├── constrs_1   // constraints
│   │   ├── sim_2       // testbench
│   │   └── sources_1
│   │       ├── bd      // block diagram
│   │       ├── imports
│   │       └── new     // verilog modules
│   └── hw.xpr          // Vivado project
├── sw
│   ├── display_ctrl
│   ├── dynclk
│   ├── intc
│   ├── timer_ps
│   ├── video_capture
│   ├── video_demo.c    // main software
│   └── video_demo.h
```

### Instructions
- Open `hw.xpr` with `Vivado 2020.1`
- Click **Generate Bitstream** from the **Flow Navigator** on the left panel
- Select **File->Export->Export Hardware** to generate a `.xsa` file
- Launch `Vitis 2020.1`, create a new **Platform Project** using the `.xsa` file, build the project
- Create a new **Application Project** with **Empty** template
- Copy all files from `sw` in this repo to `src` in the **Application Project**, build the project
- Program the bitstream and run the application

*For more detailed tutorials on Xilinx EDA tools, visit https://docs.amd.com/*