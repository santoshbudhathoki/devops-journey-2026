#Runbook: Service Down

##Sysmptoms
-Service not responding
-systemctl shows failed
-Application unavailable


##Initial Checks
-check service status:
systemctl status <service>
-checks service logs:
journalctl -u <service>


##Diagnosis
-Determine if service failed to start or crashed
-Review error messages in journald
-Validate configuration if applicable

##root cause
-configuration syntax error preventing service startup

##Fix
-Correct configuration
-Restart service:
systemctl restart <service>

##Verification
-confirm service is running
-Test aplication endpoint

##Prevention
-validate configs before restart
-Use config testing commands
-Change control for productgion edits
