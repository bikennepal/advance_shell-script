# To check linux process 
Quick Tips

Use ps aux | grep <name> to filter specific processes.
Use top -n 1 -b > output.txt to capture a snapshot to a file.
Always try SIGTERM before using SIGKILL.
Combine with watch for continuous monitoring:
watch -n 2 ps aux | grep node

