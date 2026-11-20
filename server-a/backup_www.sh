#!/bin/bash

SOURCE_PARENT="/var/www"
SOURCE_FOLDER="html"
REMOTE_USER="backupuser"
REMOTE_HOST="<SERVER_B_PRIVATE_IP>"
REMOTE_DIR="/var/backups/server-a"
SSH_KEY="$HOME/.ssh/backup_key"
LOG_FILE="$HOME/backup.log"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="www_backup_${TIMESTAMP}.tar.gz"
TMP_FILE="/tmp/${ARCHIVE_NAME}"

# compress /var/www/html and transfer the archive to Server B
if tar -czf "$TMP_FILE" -C "$SOURCE_PARENT" "$SOURCE_FOLDER" 2>>"$LOG_FILE" && \
   scp -i "$SSH_KEY" -o BatchMode=yes -q "$TMP_FILE" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}/" 2>>"$LOG_FILE"; then
    echo "$(date +"%Y-%m-%d %H:%M:%S") [OK] Backup succeeded: ${ARCHIVE_NAME}" >> "$LOG_FILE"
else
    echo "$(date +"%Y-%m-%d %H:%M:%S") [ERROR] Backup failed: ${ARCHIVE_NAME}" >> "$LOG_FILE"
fi

# remove the temporary archive from Server A
rm -f "$TMP_FILE"
