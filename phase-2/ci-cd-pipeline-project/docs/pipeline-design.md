# Pipeline Design (Phase 2)

## Purpose
This pipeline is the safety gate for the Phase 2 application.
It prevents broken code from reaching main by enforcing the same checks every time:
lint, tests, and a reproducible container build.

## What “Done” Means
A change is allowed to merge only when:
- Ruff passes
- Pytest passes
- Docker image builds successfully
- Build metadata is produced as an artifact (traceability)

## CI vs Build vs Deploy

### CI (Continuous Integration)
CI answers: “Is this change safe to merge?”
In this repo, CI runs on pull requests and is the merge gate.

CI includes:
- dependency install
- ruff lint
- pytest tests

### Build (Artifact creation)
Build answers: “Can we produce a reproducible artifact from this code?”
Here, the build step produces:
- a Docker image (locally in the runner)
- build metadata artifacts (VERSION, image tags, build info)

### Deploy (Not implemented yet)
Deploy answers: “Can we safely release this artifact to an environment?”
Not implemented in Step 9.
Deploy is intentionally separated to avoid a giant workflow and to keep clear boundaries:
- CI protects main
- Build produces traceable artifacts
- Deploy promotes artifacts to environments

## Triggers

### Pull requests
The workflow runs on PRs when changes touch:
- phase-2/ci-cd-pipeline-project/**
- .github/workflows/phase2-ci.yml

Why:
- prevents unrelated folders from triggering builds
- keeps CI focused and cheaper/faster

### Push to main
Runs on push to main for the same paths.
Why:
- ensures main always has a green build history
- catches any issues introduced by merge commits

### Manual trigger (workflow_dispatch)
Allows manual runs for verification and demos.
Why:
- useful for debugging and evidence without needing fake commits

## Working Directory Design
The workflow sets:
- working-directory: phase-2/ci-cd-pipeline-project

Why:
- this repo contains multiple phases/projects
- the CI job must behave like it’s running inside the project root

## Versioning Strategy
Source of truth:
- VERSION file in the project root

Why:
- simple, explicit, and visible in code review
- works locally and in CI consistently

Docker tag format:
- phase2-app:${VERSION}-${SHORT_SHA}

Where:
- VERSION comes from the VERSION file
- SHORT_SHA is a shortened Git commit hash

Why:
- VERSION gives human meaning
- SHORT_SHA gives uniqueness per build
- supports quick rollback by selecting older tags

## Artifacts (Build Metadata)
The pipeline uploads a small artifact bundle (metadata, not binaries):
- VERSION
- image-tags.txt
- build-info.txt

Why:
- traceability: “what version did CI build?”
- evidence for audits/debugging
- helps when a registry push is added later

## Secrets Handling (Design Rule)
This phase does not require secrets yet.
When secrets are needed (registry push, deploy keys, cloud creds):
- store them in GitHub Actions Secrets
- never commit secrets into the repo
- use least privilege tokens
- avoid printing secrets in logs

Examples (future use cases):
- container registry login token
- SSH deploy key
- cloud service principal credentials

## Common Failure Points (and what they mean)

### Install dependencies fails
Meaning:
- requirements.txt incorrect
- package version conflict
- network/availability issue

Fix:
- pin versions, confirm locally, update requirements.txt

### Ruff fails
Meaning:
- code style or quality issue detected
Fix:
- run ruff locally: ruff check .
- fix reported file/line

### Pytest fails
Meaning:
- functionality regression or incorrect test expectation
Fix:
- reproduce locally: pytest -q
- fix app logic or test

### Docker build fails
Meaning:
- Dockerfile incorrect
- missing files in build context
- wrong COPY paths or missing requirements

Fix:
- run build locally: docker build -t test .
- correct Dockerfile or .dockerignore

## Why this design avoids “giant YAML”
Rules used:
- one workflow = one responsibility (CI + build verification)
- deploy is separated (future step)
- versioning is owned by code (VERSION file), not hidden inside YAML
- artifacts capture metadata without making CI a release system

## Result
At the end of this phase, we have:
- PR-gated CI
- repeatable lint + test
- container build verification
- traceable build metadata
- rollback-ready versioning

