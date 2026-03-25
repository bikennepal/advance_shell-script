# Create a shell script that checks if a website(e.g: google.com is rechable or not using curl or ping command). print a success or failure
#!/bin/bash

WEBSITE="https://www.learnxops.com"
DOMAIN="learnxops.com"

# check webiste availability using curl 

if curl -Is "$WEBSITE" --max-time 5 | head -n 1 | grep -q "200\|300\|302"; then
    echo "Success $WEBSITE is reachable using curl!"
else
    echo "⚠️ Curl check failed, trying ping..."
    # Check website availability using ping
    if ping -c 2 -W 2 -t 5 "$DOMAIN" > /dev/null 2>&1; then
        echo "✅ Success: $DOMAIN is reachable via ping!"
    else
        echo "❌ Failure: $WEBSITE is not reachable via curl or ping."
    fi
fi
