<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works |
SIMPLE AND GATE that recieves two 8-bit inputs "a" and "b" and outputs the 8-bit answer "Y"
 Y = a & b 
 


## How to test |
Update docs with use information including the "|" symbol after the double hashed sections

ensure all inputs/output pins assigned in "project.v"

make sure "project.v" instantiates TOP file of personal design using dot notation to link input and output signals to TOP verilog file.

add your "project.v" MODULE NAME to the "tb.v"

update "Makefile" with project source names and testbench sources if changed

update yaml with required information and source file names. (pinout names are from TOP verilog file, NOT "project.v")

choose values for inputs a(ui_in) b(uio_in) and expected output Y(uo_out) that correspond to the python testbench "test.py"
20 in binary (8-bit) is 00010100
30 in binary (8-bit) is 00011110
(20 & 30) in 8-bit binary equals 00010100, which is 20 in decimal

AS SEEN IN "test.py"
 # Set the input values you want to test
    dut.ui_in.value = 20
    dut.uio_in.value = 30
    
    # The following assersion is just an example of how to check the output values.
    # Change it to match the actual expected output of your module:
    assert dut.uo_out.value == 20
    
## External hardware |
 NONE

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
