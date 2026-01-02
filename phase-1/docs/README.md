# Phase 1 — Build a Production-Style Linux Foundation

## Goal
Build a reliable, repeatable Linux foundation that simulates how real servers are operated: users, permissions, SSH, services, logs, firewall basics, and structured troubleshooting.

## Deliverables
- A documented baseline server hardening + usability setup (non-destructive, lab safe)
- SSH configured for safe remote admin (key-based)
- UFW firewall configured with documented rules
- Basic service management evidence (systemd)
- Logging and troubleshooting workflow (journalctl, system logs)
- A Phase 1 journal entry with what broke and how you fixed it

## Evidence (what will be in this repo)
- Notes: `phase-1/docs/`
- Scripts (only if needed): `phase-1/scripts/`
- Proof outputs/screenshots: `phase-1/evidence/` (text files are fine)

## Exit criteria
Phase 1 is complete only when:
- You can SSH into the machine using keys (no passwords)
- Firewall rules are applied and documented
- You can demonstrate service start/stop/status and log inspection
- All steps are reproducible from documentation in this repo

