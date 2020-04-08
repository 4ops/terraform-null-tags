.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: backup clean commit ctrl-z fmt tag test validate

export TF_IN_AUTOMATION=1
export TF_INPUT=0

eol := \n
q := \"
qq := $(q)$(q)
bl := {$(eol)
br := $(eol)}
s := Append your own tag

tag: fmt backup
	@unset TAG
	@export TAG=$$(echo "$(name)" | sed 's/.*/\L&/; s/[a-z]*/\u&/g; s/_//g')
	@echo "$$TAG"
	@test -n "$$TAG" || exit 1
	@sed "/^.*$(s).*/i $$TAG = var.$(name) != $(qq) ? var.$(name) : join($(qq), [lookup(var.tags, $(q)$(name)$(q), $(qq)), lookup(var.tags, $(q)$$TAG$(q), $(qq))]),$(eol)" -i main.tf
	@sed "/^.*$(s).*/i variable $(name) $(bl)  default = $(qq)$(br)$(eol)" -i variables.tf
	@sed "/^.*$(s).*/i output $(name) $(bl)  value = lookup(local.tags, $(q)$$TAG$(q), $(qq))$(br)$(eol)" -i outputs.tf
	@terraform fmt -list=false
	@git status --short 2> /dev/null

fmt:
	@terraform fmt -recursive

validate: fmt
	@terraform init -backend=false -lock=false
	@terraform validate

test: validate
	@export NAME=$${NAME:-simple}
	@terraform init
	@terraform plan -out=plan.tfplan -var-file=test-vars/$${NAME}.tfvars
	@terraform apply -refresh=false plan.tfplan
	@rm -f plan.tfplan

backup:
	@unset TS
	@export TS="$$(date +%s).backup"
	@mkdir "$$TS" || exit 1
	@cp main.tf variables.tf outputs.tf "$$TS"
	@git status --short 2> /dev/null

ctrl-z:
	@unset TS
	@export TS=$$(find . -type d -name '*.backup' | sort | tail -1)
	@test -d "$$TS" && test -f "$$TS/main.tf" && test -f "$$TS/variables.tf" && test -f "$$TS/outputs.tf" || exit 1
	@cp -f "$$TS/main.tf" main.tf
	@cp -f "$$TS/variables.tf" variables.tf
	@cp -f "$$TS/outputs.tf" outputs.tf
	@rm -rf "$$TS"
	@git status --short 2> /dev/null

clean:
	@find . -depth -type d -a '(' \
		-name '.terraform' \
		-o \
		-name '*.backup' \
	')' -exec rm -rf '{}' +
	@find . -depth -type f -a '(' \
		-name '*.log' \
		-o \
		-name '*.tfstate' \
		-o \
		-name '*.tfstate.*' \
		-o \
		-name '*.tfplan' \
		-o \
		-name '*.backup' \
	')' -exec rm -rf '{}' +

commit: validate clean
	@export COMMIT_MESSAGE="$(message)"
	@test -n "$$COMMIT_MESSAGE" || exit 1
	@git add .
	@git commit -m "$$COMMIT_MESSAGE"
