### Runbook: High CPU Usage

## Symptoms
- High load average
- Sluggish system performance
- Monitoring alerts for CPU usage

## Initial Checks
- Check load:
  uptime
- Identify CPU usage:
  top

## Diagnosis
- Identify top CPU-consuming process:
  ps aux --sort=-%cpu | head
- Determine CPU type (user/system/io wait)

## Root Cause
- Runaway or misbehaving process consuming CPU

## Fix
- Gracefully stop or restart offending process
- Avoid killing critical services without analysis

## Verification
- CPU usage returns to normal
- Load average decreases

## Prevention
- Resource limits
- Monitoring and alerts
- Capacity planning

