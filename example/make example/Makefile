TERRAFORM_IMAGE=ttnd/terraform:custom-mongo
TERRAFORM_CUSTOM=ttnd/terraform:kubectl-custom
RUN_TERRAFORM  =sudo docker run -i --rm -v $(PWD):/work  $(TERRAFORM_IMAGE)


env-%: # Check for specific environment variables
	@ if [ "${${*}}" = "" ]; then echo "Environment variable $* not set"; exit 1;fi

.env:
	@ if [ ! "${AWS_SECRET_ACCESS_KEY}" = "" ]; then echo "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" > .env-auth; echo  "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" >> .env-auth;fi

init: .env env-WORKSPACE
	$(RUN_TERRAFORM) init
	$(RUN_TERRAFORM) workspace new $(WORKSPACE) 2>/dev/null; true # ignore if workspace already exists
	$(RUN_TERRAFORM) workspace "select" $(WORKSPACE)
.PHONY: init

shell: .env env-WORKSPACE
	docker run -it --rm  -v $(PWD):/work --entrypoint "/bin/bash" $(TERRAFORM_CUSTOM)
.PHONY: shell

apply: .env env-WORKSPACE
	$(RUN_TERRAFORM) apply .terraform-plan-$(WORKSPACE)
	$(RUN_TERRAFORM) output > ~/terraform.output
.PHONY: apply
 
plan: .env env-WORKSPACE
	$(RUN_TERRAFORM) plan -out=.terraform-plan-$(WORKSPACE)
.PHONY: plan

.PHONY: happly

destroy: .env env-WORKSPACE
	$(RUN_TERRAFORM) destroy
.PHONY: destroy

refresh: .env env-WORKSPACE
	$(RUN_TERRAFORM) refresh
.PHONY: refresh