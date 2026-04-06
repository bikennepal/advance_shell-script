# Use awk or sed in a script to process a log file and extract only error messages.
#!/bin/bash
# Define log file path

LOG_FILE="/var/log/syslog" #change it to your actual log path
OUT_PUT_FILE="error_message.log"


##check if Log Files exists 
if [ ! -f "LOG_FILE" ]; then
    echo "Error: no '$LOG_FILE' found"
    exit 1
fi

# Extract error messages using awk

awk 'error|ERROR|Error/ {print}' "$LOG_FILE" > "$OUT_PUT_FILE"

# Alternatively, use sed:
sed -n '/error\|ERROR\|Error/p' "$LOG_FILE" > "$OUTPUT_FILE"

echo "✅ Extracted error messages saved to '$OUTPUT_FILE'."
