# Automate user account creation – Write a script that takes the username as an argument, checks, if the user exists, gives the message “user already exists“ else creates a new user, adds it to a “devops“ group, and sets up a default home directory.

# Enter a user to be created as an argument


if [ $# -eq 0 ]; then
    echo "ERROR: No Username Provided."
    echo "Usage: sudo ./script.sh <Username>"
    exit 1 
fi

USERNAME="$1"
GROUP="devops"

##Check if user already exists

if id "$USERNAME" &>/dev/null; then
    echo "User: Already exists"
else
    #Create the Group if it's exists
    if ! getent group "$GROUP" > /dev/null; then
       echo "Creating a userGroup '$GROUP'...."
       sudo groupadd "$GROUP"
    fi
    # Create user with home directory and add to group 
      echo "Creating user '$USERNAME'... "
      sudo useradd -m -s /bin/bash -G "$GROUP" "$USERNAME"

# Set a default password (optional, force change on first login)
    echo "$USERNAME:Changeme123" | sudo chpasswd 
    sudo passwd --expire "$USERNAME"
    echo "✅ User '$USERNAME' created successfully and added to group '$GROUP'."
    echo "ℹ️ Default password: ChangeMe123 (User must change it on first login)"
fi 

