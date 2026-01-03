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


