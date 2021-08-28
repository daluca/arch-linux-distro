PYTHON_VERSION = python3.9
PYTHON = $(VENV_BIN)/$(PYTHON_VERSION)
VENV = venv
VENV_BIN = $(VENV)/bin
ANSIBLE = $(PYTHON) $(VENV_BIN)/ansible-playbook
PLAYBOOK = distro.yml

.PHONY = help clean freeze

help:
	@echo "commands: help, run, venv, clean"

run: venv
	@$(ANSIBLE) $(PLAYBOOK) $(PLAYBOOK_ARGS)

check: venv
	@$(ANSIBLE) $(PLAYBOOK) --check $(PLAYBOOK_ARGS)

venv: requirements.txt
	@test -d $(VENV) || $(PYTHON_VERSION) -m venv $(VENV)
	@$(PYTHON) -m pip install --upgrade pip setuptools
	@$(PYTHON) -m pip install --upgrade --requirement requirements.txt

clean:
	@rm -rf $(VENV) requirements-hardcoded.txt
