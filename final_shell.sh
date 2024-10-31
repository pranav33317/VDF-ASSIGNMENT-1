#Shebang for bash script
#!/bin/bash

# Check if the input file is provided
# Checking if number of command line argyments is 1, if not 1 , then print warning and exit
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <verilog_file>"
    exit 1
fi

#the target file is the file at the 1st index
file="$1"


# Ensure the file exists
if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

#Checking if file is readable and a file

if [ ! -r "$file" ]; then
    echo "File is not readable!"
    exit 1
fi

# Initialize counters for all keywords
task_count=0
function_count=0
module_count=0
endmodule_count=0

# Read the file line by line
#IFS is empty string so as to take in all string including whitespaces
while IFS= read -r line; do
     # reading line by line
    # Remove everything after a single-line comment
    line_before_comment=${line%%//*}
    
    # Count the occurrences of keywords
    # for all words , increment all the counters with the count of keywords in the current line
    # cout is found by passing the line before comment to grep -o '\<word\> , the -o flag matched only exact occurences of the word in the line
    # the grep command creates a line for each occurnce of the keyword in the line
     # wc -1 counts the number of lines , which gives the count
    task_count=$((task_count + $(echo "$line_before_comment" | grep -o '\<task\>' | wc -l)))
    function_count=$((function_count + $(echo "$line_before_comment" | grep -o '\<function\>' | wc -l)))
    module_count=$((module_count + $(echo "$line_before_comment" | grep -o '\<module\>' | wc -l)))
    endmodule_count=$((endmodule_count + $(echo "$line_before_comment" | grep -o '\<endmodule\>' | wc -l)))
# the file from which this is begin extracted is the file
done < "$file"

#printing the value of the counters at the end

# Output the results
echo "Occurrences of 'task': $task_count"
echo "Occurrences of 'function': $function_count"
echo "Occurrences of 'module': $module_count"
echo "Occurrences of 'endmodule': $endmodule_count"

