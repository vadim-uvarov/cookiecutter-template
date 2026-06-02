# Python web-app cookiecutter

A [cookiecutter](https://cookiecutter.readthedocs.io/) template that scaffolds a web app
with a Python backend, pre-wired with tooling, git hooks, GitHub Actions CI/CD, and
placeholder Terraform for `prod`.

## What you get

- `uv`-managed Python 3.13 project with a `src/` layout
- Dev tooling configured in `pyproject.toml`: **ruff**, **mypy**, **pytest**, **commitizen**
- Git hooks (`.pre-commit-config.yaml`): lint + type-check on commit, commit-message check,
  tests on push
- GitHub Actions: PR checks, main pipeline (lint/test/check → version bump + tag → deploy
  to prod), and a manual "deploy to prod" button that runs from any branch
- Placeholder Terraform stack for `prod`
- `scripts/bootstrap-tfstate.sh` — provisions the S3 backend bucket (S3-native locking) for
  Terraform remote state
- `Makefile` task runner, `LICENSE`, `.gitignore`, `CLAUDE.md`

## Prerequisites

- [`uv`](https://docs.astral.sh/uv/) (provides `uvx`)

## Usage

```sh
# from a local checkout of this template
uvx cookiecutter /path/to/this/template

# or straight from a git host
uvx cookiecutter gh:your-org/your-template-repo
```

You will be prompted for:

| Variable              | Description                                              |
| --------------------- | -------------------------------------------------------- |
| `project_name`        | Human-readable project name                              |
| `project_description` | One-line description                                     |
| `project_slug`        | Directory / package base name (auto-derived, editable)   |
| `package_name`        | Python package name (auto-derived from slug)             |
| `author_name`         | Used in `LICENSE` and `pyproject.toml`                   |
| `license`             | `MIT`, `Apache-2.0`, or `Proprietary`                    |
| `python_version`      | Pinned Python version                                    |
| `aws_region`          | AWS region for the Terraform backend and bootstrap script |

## After generating

```sh
cd <project_slug>
make install   # uv sync
make hooks     # install git hooks
make lint test
```

## Deploy setup (Terraform remote state)

The `prod` stack uses an S3 backend with S3-native locking. The bucket name embeds the AWS
account ID, so it is passed at `terraform init` time rather than hardcoded.

1. Create the state bucket once per AWS account: `./scripts/bootstrap-tfstate.sh`
   (it prints the bucket name).
2. Set the deploy variables on the `prod` GitHub Environment — run
   `./scripts/setup-deploy-vars.sh` (uses the `gh` CLI and prompts for each value), or set
   them manually:
   - `AWS_ROLE_ARN` — IAM role assumed via GitHub OIDC by `aws-actions/configure-aws-credentials`
   - `AWS_REGION` — same region as `aws_region`
   - `TF_STATE_BUCKET` — the bucket printed by the bootstrap script

The deploy jobs request `id-token: write` for OIDC; no long-lived AWS keys are needed.
