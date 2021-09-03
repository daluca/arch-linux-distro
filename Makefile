PYTHON_VERSION = python3.9
PYTHON = $(VENV_BIN)/$(PYTHON_VERSION)
VENV = venv
VENV_BIN = $(VENV)/bin
ANSIBLE = $(PYTHON) $(VENV_BIN)/ansible-playbook
ANSIBLE_GALAXY = $(PYTHON) $(VENV_BIN)/ansible-galaxy
GALAXY_ROLES = roles.galaxy
PLAYBOOK = distro.yml

.PHONY = help clean

help:
	@echo "commands: help, run, check, venv, roles, clean"

run: venv roles
	@$(ANSIBLE) $(PLAYBOOK) $(PLAYBOOK_ARGS)

check: venv roles
	@$(ANSIBLE) $(PLAYBOOK) --check $(PLAYBOOK_ARGS)

venv: requirements.txt
	@test -d $(VENV) || $(PYTHON_VERSION) -m venv $(VENV)
	@$(PYTHON) -m pip install --upgrade pip setuptools
	@$(PYTHON) -m pip install --upgrade --requirement requirements.txt

roles:
	@test -d $(GALAXY_ROLES) || mkdir $(GALAXY_ROLES)
	@$(ANSIBLE_GALAXY) install --roles-path $(GALAXY_ROLES) --role-file requirements.yml
	@touch $(GALAXY_ROLES)/touchfile

clean:
	@rm -rf $(VENV) $(GALAXY_ROLES)
