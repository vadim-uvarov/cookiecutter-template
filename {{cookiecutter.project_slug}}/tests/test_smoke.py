"""Smoke tests verifying the package imports and exposes basic metadata."""

import {{ cookiecutter.package_name }}


def test_package_imports() -> None:
    """The package imports and exposes a version string."""
    assert isinstance({{ cookiecutter.package_name }}.__version__, str)
    assert {{ cookiecutter.package_name }}.__version__
