# Runbook: Disk Full

## Symptoms
- Commands fail with "No space left on device"
- Services unable to write logs
- Package installs or updates fail

## Initial Checks
- Identify affected filesystem:
  df -h

## Diagnosis
- Locate high-usage directories:
  du -sh /*
- Narrow down to user or application paths
- Identify large or unexpected files

## Root Cause
- Excessive disk usage caused by large files or unrotated logs

## Fix
- Remove or archive unnecessary files
- Re-check disk usage:
  df -h

## Prevention
- Disk usage monitoring and alerts
- Log rotation
- Regular cleanup automation

