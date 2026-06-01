Please generate a cookiecutter template for a web app with python backend using the following reference. Ask me something that I might have forgotten about or is worth adding to the project.

Input variables:
1. Project name
2. Project desciption

Project structure:

0. README.md
    - project name and description
    - other sections (leave TODO in the body)
        - Project layout
        - Project architecture
        - Local dev and deploy instructions
1. CLAUDE.md - use @./CLAUDE.md
2. Pyproject.toml
	1. Python version
	2. Dev Dependencies: Ruff, mypy, pytest, commitizen
	3. Configs: Ruff, mypy, pytest, commitizen
3. .python-version (for pyenv)
4. Git commit hooks
	1. Lint, test, adherence of commit messages to commitizen standard.
5. Terraform files for prod and preprod that do nothing except for print a message
6. CI/CD 
	1. for master: lint, test, check that commit messages adhere to the project commitizen config, bump project version and create git tag using commitizen, deploy to prod
	2. for pull request: lint, test, check that commit messages adhere to the project commitizen config, have a button to deploy to preprod
7. .gitignore with common ignore
8. Project structure (put .gitkeep in the folder if there are no files inside)
	1. src 
	2. tests
	3. scripts
	4. terraform
	5. .github/workflows