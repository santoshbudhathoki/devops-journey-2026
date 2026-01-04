# Health Check Script Usage

## Purpose
Provides quick validation of system health:
- Disk
- CPU
- Services
- DNS

## How to Run
./scripts/healthcheck.sh

## Exit Codes
0 = All checks passed  
1 = Disk usage critical  
2 = Service not running  
3 = DNS failure  

## Automation
Safe to run via cron or CI pipelines.

