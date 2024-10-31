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
