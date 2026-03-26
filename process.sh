# To check linux process 
# Quick Tips

# Use ps aux | grep <name> to filter specific processes.
# Use top -n 1 -b > output.txt to capture a snapshot to a file.
# Always try SIGTERM before using SIGKILL.
# Combine with watch for continuous monitoring:
# watch -n 2 ps aux | grep node

# Create a script that lists all running processes and writes the output to a file named process_list.txt.

#!/bin/bash

#Define an Outputfile
Outputfile="process_list.txt"
#List all the process running and redirect to the above file
ps aux >"$Outputfile"
#print a successfull message
echo "all process list has benn redirected to file"