#!/usr/bin/env bash
# Log Cleaner Script
# Supports dry-run and retention-based cleanup

set -euo pipefail

LOG_DIR="/var/log"
RETENTION_DAYS=7
DRY_RUN=true


echo "=== Log Cleaner ==="
echo "Target directory: $LOG_DIR"
echo "Retention: $RETENTION_DAYS days"
echo "Dry-run: $DRY_RUN"


FILES=$(find "$LOG_DIR" -type f -name "*.log" -mtime +"$RETENTION_DAYS" 2>/dev/null)

if [ -z "$FILES" ]; then
  echo "No old log files found"
  exit 0
fi

for file in $FILES; do
  if [ "$DRY_RUN" = true ]; then
    echo "[DRY-RUN] Would remove: $file"
  else
    echo "Removing: $file"
    rm -f "$file"
  fi
done



