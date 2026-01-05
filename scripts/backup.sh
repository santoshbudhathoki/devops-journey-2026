#!/usr/bin/env bash
# Backup Script
# Creates timestamped backups of the repo and verifies success

set -euo pipefail

SOURCE_DIR="$HOME/Desktop/projects/devops-journey-2026"
BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/devops_backup_${TIMESTAMP}.tar.gz"

echo "=== Backup Script ==="
echo "Source: $SOURCE_DIR"
echo "Destination: $BACKUP_FILE"

# Validate source
if [ ! -d "$SOURCE_DIR" ]; then
  echo "CRITICAL: Source directory does not exist: $SOURCE_DIR"
  exit 1
fi

# Ensure backup dir exists
mkdir -p "$BACKUP_DIR"

# Create backup
tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Verify backup exists and is non-empty
if [ -s "$BACKUP_FILE" ]; then
  echo "OK: Backup created successfully"
  ls -lh "$BACKUP_FILE"
  exit 0
else
  echo "CRITICAL: Backup failed or file is empty"
  exit 2
fi

