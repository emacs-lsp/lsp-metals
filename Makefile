SHELL=/usr/bin/env bash

EMACS ?= emacs
EASK ?= eask

test: build compile checkdoc lint

build:
	$(EASK) package
	$(EASK) install

compile:
	@echo "Compiling..."
	$(EASK) compile

checkdoc:
	$(EASK) lint checkdoc

lint:
	@echo "package linting..."
	$(EASK) lint package

clean:
	$(EASK) clean-all

tag:
	$(eval TAG := $(filter-out $@,$(MAKECMDGOALS)))
	sed -i "s/;; Version: [0-9].[0-9].[0-9]/;; Version: $(TAG)/g" lsp-metals.el
	git add lsp-metals.el
	git commit -m "Bump lsp-metals: $(TAG)"
	git tag $(TAG)
	git push origin HEAD
	git push origin --tags

# Allow args to make commands
%:
	@:

.PHONY : test compile checkdoc lint clean tag
