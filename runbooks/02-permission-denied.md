###symptoms
-service fails or retuen 403/500
-logs show " permission denied" 
-Application cannot read required files


##Initial checls
-systemctl status <service>
journalctl -u <service> --since "10 minurtes ago"


###Diagnosis
-Identify the exact path mentioned in logs
-checls permissions:
ls -ld <path>
-confirm service  runtime user:
ps aux |grep <service>

##Root cause
-Directory/file permission prevent service user from accessing required path

## Fix
-Restorte least-privilege permission (avoid 777)
-restart service and retest endpoint

##Prevention
-Standard permission baselines
-Deployments should set ownership/permission explicity
-change control for permission changes

