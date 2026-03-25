# Basic Networking Commands
curl – Transfer Data to/from a Server

curl <URL>

# Common Use Cases:

Test APIs
Download files
Post form data

# Useful Flags:

-I: Fetch headers only 
-X: Specify request method (GET, POST, PUT, DELETE)
-d: Send data

# example 
curl -X POST -d "name=sandip" https://example.com/api


# wget – Non-Interactive Download Utility

wget <URL>

# we have more on wget use man page for more 

# ss -an | grep 80

