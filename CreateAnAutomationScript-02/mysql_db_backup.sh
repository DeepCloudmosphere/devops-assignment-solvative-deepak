#!/bin/bash
# -----------------------------------------------------------
# MySQL Backup Script
# Creates a timestamped MySQL database backup
# -----------------------------------------------------------

# === Configuration ===
BACKUP_DIR="/var/backups/mysql"
DATE=$(date +"%Y%m%d_%H%M%S")
MYSQL_USER="root"
MYSQL_PASSWORD="yourpassword"
MYSQL_HOST="localhost"
#DATABASE_NAME="solvativedb"
DATABASE_NAME="mysql"

# === Script logic ===
mkdir -p "$BACKUP_DIR"

BACKUP_FILE="$BACKUP_DIR/${DATABASE_NAME}_backup_${DATE}.sql.gz"

echo "Starting backup for database: $DATABASE_NAME"

# Perform backup
mysqldump -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$DATABASE_NAME" | gzip > "$BACKUP_FILE"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful! File saved at: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi

# Optional: Delete backups older than 7 days
find "$BACKUP_DIR" -type f -name "*.gz" -mtime +7 -exec rm {} \;

echo "Old backups (older than 7 days) removed."

