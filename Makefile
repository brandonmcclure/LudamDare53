ifeq ($(OS),Windows_NT)
	SHELL := pwsh.exe
else
	SHELL := pwsh
endif

.SHELLFLAGS := -NoProfile -Command

getcommitid: 
	$(eval COMMITID = $(shell git log -1 --pretty=format:"%H"))
getbranchname:
	$(eval BRANCH_NAME = $(shell (git branch --show-current ) -replace '/','.'))


.PHONY: all clean test lint act
all: build

REGISTRY_NAME := 
REPOSITORY_NAME := bmcclure89/
IMAGE_NAME := ludamdare53
TAG := :latest
ELIXIR_SOURCE_PATH := game/
CD_TO_ELIXIR_SOURCE_PATH := cd $(ELIXIR_SOURCE_PATH);

# Run Options
RUN_PORTS := -p 3000:3000

build: getcommitid getbranchname
	$(CD_TO_ELIXIR_SOURCE_PATH)docker build -t $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME)$(TAG) -t $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME):$(BRANCH_NAME) -t $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME):$(BRANCH_NAME)_$(COMMITID) .


run: build
	docker run -d $(RUN_PORTS) $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME)$(TAG)

run_it:
	docker run -it $(RUN_PORTS) $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME)$(TAG)

package:
	$$PackageFileName = "$$("$(IMAGE_NAME)" -replace "/","_").tar"; docker save $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME)$(TAG) -o $$PackageFileName

size:
	docker inspect -f "{{ .Size }}" $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME)$(TAG)
	docker history $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME)$(TAG)

publish:
	docker login; docker push $(REGISTRY_NAME)$(REPOSITORY_NAME)$(IMAGE_NAME)$(TAG); docker logout
int: lint_makefile
lint_makefile:
	docker run -v $${PWD}:/tmp/lint -e ENABLE_LINTERS=MAKEFILE_CHECKMAKE oxsecurity/megalinter-ci_light:v6.10.0

# elixir/mix
elixir_clean:
	$(CD_TO_ELIXIR_SOURCE_PATH)mix ecto.drop
elixir_migrate:
	$(CD_TO_ELIXIR_SOURCE_PATH)mix ecto.migrate
elixir_deps:
	$(CD_TO_ELIXIR_SOURCE_PATH)mix deps.get
	$(CD_TO_ELIXIR_SOURCE_PATH)mix ecto.create
elixir_run: elixir_deps
	$(CD_TO_ELIXIR_SOURCE_PATH)mix phx.server
elixir_runi:
	Remove-Alias -Name iex -force; $(CD_TO_ELIXIR_SOURCE_PATH)iex -S mix phx.server
elixir_test: elixir_deps
	$(CD_TO_ELIXIR_SOURCE_PATH)mix test
elixir_test_coverage:
	$(CD_TO_ELIXIR_SOURCE_PATH)$$env:MIX_ENV=test mix do coveralls.json
elixir_test_coverage_web:
	$(CD_TO_ELIXIR_SOURCE_PATH)$$env:MIX_ENV=test coveralls.html
elixir_lint:
	$(CD_TO_ELIXIR_SOURCE_PATH)mix format
