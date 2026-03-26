# Create a script that monitors CPU and memory usage every 5 seconds and logs the results to a file.

#create a file to get the cpu and memory output
LOGFILE="biken.log"

echo "Monitoring CPU and MEM usage ... and log will be saved in $LOGFILE"
echo "TimeStamp | CPU (%) | MEM (%)" > "$LOGFILE"

#Infinite Loop to log system usage every 5 seconds 

while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    #Get the CPU usage
    CPU_USAGE=$(top -bn1 | grep "CPU(s)" | awk '{print $2 + $4}')
    #Get the Mem usage
    MEM_USAGE=$(vm_stat | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')

    #Write data to the log file
    echo "$TIMESTAMP | $CPU_USAGE | $MEM_USAGE" >> "$LOGFILE"
    #Wait for 5 seconds 
    sleep 5 
done 
# To run the script in background use nohup ./script.sh


