SHELL := /bin/bash

# set timeout(in seconds) when downloading from pypi
export UV_HTTP_TIMEOUT=200

########## Local Python Env setup ##########
# require one time setup for uv, install by brew: "brew install uv"

init_venv:
	@echo "Initializing project python environment for this MLP pipeline"
	@if [ -f .python-version ]; then \
		PYTHON_VERSION=$$(cat .python-version); \
		echo "Use the version $$PYTHON_VERSION setting from.python-version file"; \
		uv python install $$PYTHON_VERSION; \
		uv venv --python-preference=managed; \
	else \
		echo "The .python-version file not found, use the default python version"; \
		uv venv --python-preference=system; \
	fi

venv: init_venv
	@echo "Creating virtual environment for this MLP pipeline"

check_venv:
	@if [ ! -f .venv/bin/python ]; then \
		echo "Virtual environment not found. Please run 'make venv' first."; \
		exit 1; \
	fi

build: check_venv
	uv pip install --upgrade build
	uv build --wheel
