# # Useful Commands:
# Show Installed Packages
# dpkg -l           # Debian/Ubuntu
# rpm -qa           # RHEL/CentOS

# # Show Package Info
# apt show <package>

# yum info <package>

# # Clean Cache

# sudo apt clean
# sudo yum clean all

# Write a script that installs multiple packages at once (e.g., git, vim, curl). The script should check if each package is already installed before attempting installation.

#!/bin/bash 

# Define list of packages to install 
PACKAGES=("git" "vim" "curl")

# Looped through each element to check wherther it's installed on not 

for PACKAGE in "${PACKAGES[@]}"; do
    if dpkg -l | grep -qw "$PACKAGE"; then
        echo "all $PACKAGE installed"
    else 
        echo "install all $PACKAGE now"
        sudo apt-get install -y "$PACKAGE" && \
        echo " $PACKAGE installed successfully:" || \
        echo " $PACKAGE failed to install"
    fi
done



