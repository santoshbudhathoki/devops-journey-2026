CI FAILURE CASE: RUFF LINT ERROR (UNUSED VARIABLE)
SYMPTOM

The GitHub Actions workflow failed at the "Lint (ruff)" step.

The CI output showed the following error:

F841 Local variable expected is assigned to but never used

Because of this error, the CI pipeline stopped and the test step did not run.

DIAGNOSIS

The failure occurred during the Ruff linting step.

Ruff checks code quality and enforces Python best practices.
It detected an unused variable inside the test file.

ROOT CAUSE

In tests/test_app.py, the variable expected was assigned a value
but was not used in any assertion.

Ruff treats unused variables as an error, so the CI job failed.

FIX

The test code was updated so that the expected variable is used
in the assertion.

After committing the fix and pushing the change:

Ruff passed

Pytest passed

The CI workflow completed successfully

PREVENTION

Run ruff check . locally before pushing code.
Ensure all variables in tests are actively used.
Treat lint failures as real defects.
Keep CI linting strict to catch issues early.
