##Runbook: Disk Full

#Sysmptoms
-Commads failing with "No space left on device"
-Applications unable to write logs
-package installing failing


##Initial Checks
-checks disk usage:
df -h
-Identify affected filesystem

##Diagnosis
-Locate high usage directories:
du -sh /*
-Narrow down to specific paths
-Identify files causing spike

## Root Cause
-large file(s) consuming disk space
-Lack of monitoring /cleanup

##Fix
-RFemove or archive unnecessary files
-verify space recovery using df -h


#prevention
-Disk monitoring alerts
-Log rotation
-regular cleanup scripts












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

















## Special Case: Disk Space Not Freed After Deletion

### Symptoms
- File deleted but disk usage unchanged
- df -h still shows high usage

### Diagnosis
- Identify deleted but open files:
  lsof | grep deleted

### Fix
- Restart or stop the process holding the file
- Verify disk space is released

