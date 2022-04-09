PYTHON ?= python


help: Makefile
	@echo
	@echo " Choose a command run in Argon:"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo


## config: Install dependencies.
config:
	$(PYTHON) -m pip install ansible
	$(PYTHON) -m pip install ansible-lint


## lint: Lint ansible files.
lint:
	ansible-lint -v


## run: Configure the server.
run:
	@echo "\n>> ============= Run ============= <<"
	ansible-playbook playbook.yml --ask-vault-pass


.PHONY: help run lint config
