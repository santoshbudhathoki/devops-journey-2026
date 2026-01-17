#!/usr/bin/env bash

# Health Check Script
# Purpose: Basic system health validation for DevOps operations
# Safe for cron usage

set -euo pipefail
echo "=== Disk Usage ==="

THRESHOLD=80

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "CRITICAL: Disk usage is ${USAGE}%"
  exit 1
else
  echo "OK: Disk usage is ${USAGE}%"
fi

echo
echo "=== CPU Load ==="

LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1 | xargs)

echo "Current load average: $LOAD"


echo
echo "=== Service Status ==="

SERVICE="nginx"

if systemctl is-active --quiet "$SERVICE"; then
  echo "OK: $SERVICE is running"
else
  echo "CRITICAL: $SERVICE is NOT running"
  exit 2
fi


echo
echo "=== DNS Check ==="

if dig google.com +short > /dev/null; then
  echo "OK: DNS resolution works"
else
  echo "CRITICAL: DNS resolution failed"
  exit 3
fi


echo
echo "System health: OK"
exit 0

