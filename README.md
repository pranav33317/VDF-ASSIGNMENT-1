FOR SHELL FILE:
Write a Shell script designed to analyze a given Verilog file and ascertain the count of
occurrences for specific Verilog keywords:
a. task
b. function
c. module
d. endmodule
If a line is a comment (starts with //), then you should not count these keywords contained in
this line. Example following lines should not be counted:
// function is easy to implement
// starting the module
// ending .....

Use the shell commands only in the code. Do not use any other program (such as TCL script)
inside your code.
Words not matching exactly (example multitask, functioning, etc.) should not be counted.

for .tcl file:
Write a TCL script designed to analyze a given Verilog file and ascertain the count of
occurrences for specific Verilog keywords:
a. always
b. initial
c. begin
d. end
If a line is a comment (starts with // ), then you should not count these keywords contained in
this line. Example following lines should not be counted:

// always do your homework
// initialize your design
// ending .....
Do not use any system calls (such as grep etc.) in this code.
Words not matching exactly (example initialize, beginning, bend etc.) should not be counted.
