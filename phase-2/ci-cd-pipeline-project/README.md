# Phase 2 – CI/CD Pipeline Project

This project is part of the **DevOps Journey 2026** roadmap.

Phase 2 focuses on building a **production-style Continuous Integration (CI) pipeline**
using GitHub Actions, enforcing code quality, automated testing, and Docker image
build verification for a Python Flask application.

## Objectives

The goals of this phase are to:

- Implement a reliable CI pipeline triggered on pull requests and main branch updates
- Enforce code quality using linting and automated tests
- Build and validate a Docker image as part of CI
- Apply consistent image versioning using application version and commit SHA
- Capture and store build metadata as CI 



## Repository Structure

phase-2/ci-cd-pipeline-project/
├── app/ # Flask application source
├── tests/ # Pytest-based test suite
├── docs/ # Failure cases and CI incident documentation
├── .github/workflows/
│ └── phase2-ci.yml # GitHub Actions CI pipeline
├── Dockerfile # Application container definition
├── .dockerignore # Docker build optimizations
├── requirements.txt # Python dependencies
├── VERSION # Application version
└── README.md # Project documentation








The application is a minimal Flask service exposing two endpoints:

- `/health` – Health check endpoint used for CI and runtime validation
- `/version` – Returns the application version from the VERSION file

These endpoints are intentionally simple to allow focus on CI/CD mechanics
rather than application complexity.

## /health endpoint

The `/health` endpoint is a simple health check used to verify that the application is running.

- Returns HTTP 200
- Response body: `ok`
- Used by tests, CI pipelines, and monitoring tools
.



## CI Pipeline Overview

The CI pipeline is implemented using **GitHub Actions** and runs automatically on:

- Pull requests affecting the Phase 2 project
- Pushes to the `main` branch

The pipeline performs the following stages:
Pipeline Stages
md
Copy code
1. **Checkout source code**
2. **Set up Python runtime**
3. **Install dependencies**
4. **Lint code using Ruff**
5. **Run automated tests with Pytest**
6. **Build Docker image**
7. **Tag Docker image using VERSION and commit SHA**
8. **Generate and upload build metadata artifacts**



## Docker Image Versioning Strategy

Docker images are tagged using the following format:

phase2-app:<VERSION>-<SHORT_SHA>

vbnet
Copy code

Where:
- `VERSION` is read from the VERSION file
- `SHORT_SHA` is the first 7 characters of the Git commit SHA

Example:
phase2-app:0.1.0-9390ca7

diff
Copy code

This approach ensures:
- Traceability between code and image
- Reproducible builds
- Clear audit history



## Build Artifacts

The CI pipeline uploads build metadata as artifacts, including:

- `VERSION` – Application version used for the build
- `image-tags.txt` – Generated Docker image tags
- `build-info.txt` – Build timestamp and commit information

Artifacts can be downloaded from the GitHub Actions workflow run for audit and debugging purposes.

## Failure Handling

This phase intentionally includes CI failure simulations to practice
real-world troubleshooting.

Documented failure scenarios include:
- Linting failures
- Test failures
- Pipeline execution errors

Each failure is documented in the `docs/` directory with:
- Symptom
- Root cause
- Fix
- Prevention strategy


## Exit Criteria

Phase 2 is considered complete when:

- CI pipeline runs automatically on pull requests
- Linting failures block merges
- Test failures block merges
- Docker image builds successfully in CI
- Docker image is versioned using VERSION and commit SHA
- Build metadata artifacts are available for download
- All changes are merged via pull requests only



