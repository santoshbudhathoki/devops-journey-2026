####Runbook: DNS Broken

##Symptoms
-Internet appears down
-IP connectivity works but hostnames fail
-Application fail to resolve domains

##Initial Checks
-test Ip connectivity:
ping 8.8.8.8

-Test DNS resolution:
ping google.com
dig google.com



##Diagnosis
-If IP work but DNS fails -> DNS Issue
-Check resolver configuration:
cat /etc/resolv.conf
resolvectl status


###Root cause
-Incorrect or missing DNS resolver configuration


##Fix

-Restore correct nameserver configurtation
-Restart reslver service if needed

##Verification
-Hostname resolution works
-dig returns valid records


####Prevention
-Managed resolver configuration
-Monitoring DNS resolution
-Avoid manual edits without change control
