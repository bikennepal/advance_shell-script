# Write a script that takes a filename as an argument, checks if it exists, and prints the content of the file accordingly.

fname="$1"

if [ $# -eq 0 ]; then
    echo "ERROR: No Filename Provided"
    echo "USAGE: ./check_file.sh <filename>"
else 
   cat "$fname"
fi 

