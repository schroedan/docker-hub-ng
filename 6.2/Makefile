DOCKER_IMAGE:=schroedan/ng
DOCKER_TAG=6.2.4

.PHONY: default
default: lint build

.PHONY: lint
lint:
	@echo 'Linting Dockerfile'
	@docker run --rm -i hadolint/hadolint < Dockerfile
	@echo 'Successfully linted Dockerfile'

.PHONY: build
build:
	@echo 'Building ${DOCKER_IMAGE}:${DOCKER_TAG}'
	@docker build --squash -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
