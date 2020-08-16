ci: compile lint test

compile:
	elinter -b

lint:
	elinter -l

test:
	elinter -t --ert-runner

tag:
	$(eval TAG := $(filter-out $@,$(MAKECMDGOALS)))
	sed -i "s/;; Version: [0-9]\+.[0-9]\+.[0-9]\+/;; Version: $(TAG)/g" lsp-dart.el
	git add lsp-dart.el
	git commit -m "Bump lsp-dart: $(TAG)"
	git tag $(TAG)
	git push origin HEAD
	git push origin --tags

# Allow args to make commands
%:
	@:

.PHONY : ci compile lint test tag
