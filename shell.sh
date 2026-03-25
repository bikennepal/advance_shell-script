echo "This is my first code in shell"
echo $?
echo #$
command > output.log 2>&1
# in modern shell supported script we use 
# command &> output.log
# what is 'AWK' command in linux and how to use effectively?
The awk command is a powerful pattern-scanning and text-processing language built into Linux/Unix systems, 
commonly used for manipulating data and generating reports [1]. It is particularly effective at handling column-oriented data and operates on a line-by-line basis [1, 2]. 
# AWK syntax
# awk 'pattern { action }' filename
awk '{print $1, $3}' filename : Prints the first and third fields (columns) of every line [2].
awk '/error/ {print $0}' filename: print the line that contains error
# =============================================
What is the default permission of a file when created in linux ?
what are the types of variable in linux?
What is Crontab and give one example?
minutes, hour, dayof month, month, week"