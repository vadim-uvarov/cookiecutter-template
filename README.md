# Python web-app cookiecutter

A [cookiecutter](https://cookiecutter.readthedocs.io/) template that scaffolds a web app
with a Python backend, pre-wired with tooling, git hooks, GitHub Actions CI/CD, and
placeholder Terraform for `prod` / `preprod`.

## What you get

- `uv`-managed Python 3.13 project with a `src/` layout
- Dev tooling configured in `pyproject.toml`: **ruff**, **mypy**, **pytest**, **commitizen**
- Git hooks (`.pre-commit-config.yaml`): lint + type-check on commit, commit-message check,
  tests on push
- GitHub Actions: PR checks, main pipeline (lint/test/check → version bump + tag → deploy
  to prod), and a manual "deploy to preprod" button
- Placeholder Terraform stacks for `prod` and `preprod`
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

## After generating

```sh
cd <project_slug>
make install   # uv sync
make hooks     # install git hooks
make lint test
```
