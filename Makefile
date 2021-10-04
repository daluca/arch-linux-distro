VENV = .venv
VENV_BIN = $(VENV)/bin
NODE_BIN = node_modules/.bin
PRETTIER =$(NODE_BIN)/prettier

DEPENDENCIES = collections.galaxy roles/jaredhocutt.gnome_extensions

ANSIBLE = $(ANSIBLE_PLAYBOOK) $(ANSIBLE_GALAXY) $(ANSIBLE_LINT)

ANSIBLE_PLAYBOOK = $(VENV_BIN)/ansible-playbook
ANSIBLE_GALAXY = $(VENV_BIN)/ansible-galaxy
ANSIBLE_LINT = $(VENV_BIN)/ansible-lint

.PHONY: help
help:
	@echo commands: help, run, lint, check, format, clean
	@printf "\thelp\t\tprint this message then exit\n"
	@printf "\trun\t\trun the ansible-playbook\n\t\t\t\tARGS to pass arguement to ansible-playbook\n"
	@printf "\tlint\t\tlint ansible-playbook\n"
	@printf "\tcheck\t\tcheck formatting\n"
	@printf "\tformat\t\tapply formatting\n"
	@printf "\tinstall\t\tinstall dev dependencies\n"
	@printf "\tclean\t\tremove temporary files\n"

.PHONY: run
run: .vault_key $(ANSIBLE_PLAYBOOK) $(DEPENDENCIES)
	@pipenv run ansible-playbook --vault-password-file .vault_key playbook.yml $(ARGS)

.PHONY: lint
lint: $(ANSIBLE_LINT)
	@pipenv run ansible-lint --project-dir . -f pep8

.PHONY: check
check: $(PRETTIER)
	@$(PRETTIER) --check .

.PHONY: format
format: $(PRETTIER)
	@$(PRETTIER) --write .

.PHONY: install
install: $(ANSIBLE) $(DEPENDENCIES)
	@echo "all dependencies installed"

collections.galaxy:
	@pipenv run ansible-galaxy collection install --requirements-file roles/requirements.yml

roles/jaredhocutt.gnome_extensions:
	@pipenv run ansible-galaxy role install --role-file roles/requirements.yml

$(ANSIBLE): .venv
	@pipenv install --dev

$(PRETTIER):
	@yarn install --dev

.venv:
	@mkdir .venv

.vault_key:
	@echo "no vault key"

.PHONY: clean
clean:
	@rm -rf .venv/ collections.galaxy/ node_modules/ roles/*.*/
