.DEFAULT_GOAL := test    

PYTHON   := python2.7
PIP      := pip
PYLINT   := pylint
COVERAGE := coverage
PYDOC    := pydoc
AUTOPEP8 := autopep8

.pylintrc:
	$(PYLINT) --disable=locally-disabled --reports=no --generate-rcfile > $@

format:
	$(AUTOPEP8) -i application.py
	$(AUTOPEP8) -i db_create.py
	$(AUTOPEP8) -i db_populate.py
	$(AUTOPEP8) -i tests.py

coverage:
	-$(COVERAGE) run    --branch tests.py >  tests.out 2>&1
	cat tests.out

test:
	python tests.py

versions:
	which make
	make --version
	@echo
	which git
	git --version
	@echo
	which $(PYTHON)
	$(PYTHON) --version
	@echo
	which $(PIP)
	$(PIP) --version
	@echo
	which $(PYLINT)
	$(PYLINT) --version
	@echo
	which $(COVERAGE)
	$(COVERAGE) --version
	@echo
	-which $(PYDOC)
	-$(PYDOC) --version
	@echo
	which $(AUTOPEP8)
	$(AUTOPEP8) --version
	@echo
	$(PIP) list
