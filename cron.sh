# Set up a cron job that runs a script to back up (zip/tar) a directory daily.

#!/bin/bash

#Directory to backup and backup location
SOURCE_DIRCTORY="/path/to/directory"
BACKUP_DIRECTORY="path/to/backup"

TIMESTAMP=$(date +"%Y-%M-%D-%H-%M-%S")
BACKUP_FILE="$BACKUP_DIRECTORY/BACKUP_$TIMESTAMP.tar.gz"

#Create a directory if there is no directory

mkdir -p "BACKUP_DIR"

#Create the backup archive

tar -czf "$BACKUP_FILE" "$SOURCE_DIRECTORY"

#Print the success Message

echo "Create backup succesfully"


#############################
Now setup the cron job

create a script and add in to crontab -e

0 2 * * *  /path/to/bachup.sh >> /var/log/backup.log 2>&1

