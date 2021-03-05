PYTHON ?= python
GALAXY ?= ansible-galaxy


help: Makefile
	@echo
	@echo " Choose a command run in Oxygen:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo


## config: Install dependencies.
config:
	$(PYTHON) -m pip install ansible==7.1.0
	$(PYTHON) -m pip install ansible-lint==6.10.2


## lint: Lint ansible files.
lint:
	ansible-lint -v


## prod: Configure the server.
prod:
	@echo "\n>> ============= Run ============= <<"
	ansible-playbook prod-playbook.yml --ask-vault-pass


## helium: Deploy Helium application.
helium:
	@echo "\n>> ============= Run ============= <<"
	ansible-playbook helium-playbook.yml --ask-vault-pass


.PHONY: help prod lint config helium
