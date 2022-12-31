COMMIT_ID_HASH ?= $(shell git rev-parse HEAD)
VERSION_BRANCH ?= $(shell git symbolic-ref --short HEAD)
APP     ?= mail-service
IMAGE   ?= $(APP):$(COMMIT_ID_HASH)
VERSION ?= $(VERSION_BRANCH)-$(COMMIT_ID_HASH)
MY_HUB_DOCKER ?= diyset
.DEFAULT_GOAL := list

.PHONY: list
clean:
	@echo "Clean All Container"
	- docker rm -f $($DB_IMAGE)
	- docker rm -f $(DB_IMAGE_TEST)
	- docker rm -f $(APP)
list:
	@echo "Make sure u set specific target dude !!"
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
maven-verify:
	- mvn clean verify -Dmaven.test.skip
run-spring-boot:
	- mvn spring-boot:run
docker-build-embed-tomcat:
	- docker build -f docker/Dockerfile -t $(APP):embed-$(VERSION) .
docker-push:
	- docker tag $(APP):embed-$(VERSION) $(MY_HUB_DOCKER)/$(APP):embed-$(VERSION)
docker-push-latest:
	- make docker-build-embed-tomcat
	- docker tag $(APP):embed-$(VERSION) $(MY_HUB_DOCKER)/$(APP):$(VERSION_BRANCH)-latest
	- docker push $(MY_HUB_DOCKER)/$(APP):$(VERSION_BRANCH)-latest