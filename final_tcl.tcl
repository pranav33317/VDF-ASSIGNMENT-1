# shebang for TCL Script
#!/usr/bin/env tclsh

# Prompt the user to enter the filename
puts "Enter the Verilog file name:"

#flushing the stdout file , so that there isnt any delay in printing the message

flush stdout

# Get the filename from user input
set fileName [gets stdin]

# Check if the file name is empty
if {[string length $fileName] == 0} {
    puts "No file name provided. Exiting."
    exit 1
}

# Debugging: Print the filename to ensure it's correct
puts "Processing file: $fileName"

# Ensure the file exists before trying to open it
if {[file isfile $fileName] == 0} {
    puts "File not found!"
    exit 1
}

# Initialize counters for keywords
# making an associatve array / dictionary with key-value pairs for each keyword
array set counts {
    always 0
    initial 0
    begin 0
    end 0
}

# Open the file in read mode
set file [open $fileName "r"]

# Define the keywords to count
# create a TCL array of all 4 keywords
set keywords [list "always" "initial" "begin" "end"]

# Read the file line by line
while {[gets $file line] >= 0} {
     # [gets $file line] returns the number of characters each line has , when it reached end of file , it returns -1
    # Remove the part of the line after a comment
    set line [lindex [split $line "//"] 0]
    # Trim extra spaces
    set line [string trim $line]
    # Skip empty lines after removing comments
    if {[string length $line] == 0} {
        continue
    }

    # Split the line into words considering various delimiters
    # Split on whitespace, parentheses, braces, commas, semicolons, etc. which are all tokens in verilog
    set words [split $line " \t(){}[],;:=@&|`~\'\"#%"]

    # Increment counts for each keyword
    # checking the line which has been split based on delimiters and split off the commented part
    # for every word in the array
    foreach keyword $keywords {
      # iterating over the words that are created after splitting
        foreach word $words {
            # Check for exact match of keywords, case sensitive
            if {[string compare $word $keyword] == 0} {
                #incrementing the value of the corresponding keyword in dictionary
                incr counts($keyword)
            }
        }
    }
}

# Close the file
close $file

# Print results
puts "Occurrences of 'always': $counts(always)"
puts "Occurrences of 'initial': $counts(initial)"
puts "Occurrences of 'begin': $counts(begin)"
puts "Occurrences of 'end': $counts(end)"


