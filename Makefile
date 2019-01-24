IMAGE_NAME:=$(if $(IMAGE_NAME),$(IMAGE_NAME),schroedan/ng)
TAG_NAME:=$(if $(TAG_NAME),$(TAG_NAME),local)
VERSION:=$(if $(VERSION),$(VERSION),1.6)

.PHONY: default
default: lint build

.PHONY: lint
lint:
	@echo "Linting ${VERSION}/Dockerfile"
	@docker run --rm -i hadolint/hadolint < ${VERSION}/Dockerfile

.PHONY: build
build:
	@echo 'Building Docker image ${IMAGE_NAME}:${TAG_NAME}'
	@docker build --force-rm --no-cache --squash --tag ${IMAGE_NAME}:${TAG_NAME} ${VERSION}
