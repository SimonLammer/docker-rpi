NAMESPACE=simonlammer
IMAGE_PREFIX=rpi-

I=none
IMAGE=$(NAMESPACE)/$(IMAGE_PREFIX)$(I)
CURDIR_ESCAPED=$(shell echo '$(CURDIR)' | sed 's/\//\\\//g')

help:
	@echo "Usage:"
	@echo "    make [build | push | run] I=<image>"
	@echo "    make help"

check-image:
	@if [ $(I) = "none" ]; then \
		echo "You need to specify an image! (make <command> I=<image>)"; \
		echo ""; \
		false; \
	elif [ ! -d $(I) ]; then \
		echo "Image $(I) not found."; \
		echo ""; \
		false; \
	else \
		echo "Image: $(I)"; \
	fi

build: check-image
	docker build -t $(IMAGE) $(I)

push: build
	docker login
	docker push $(IMAGE)

run: build
	docker run --name test $(shell ls -d $(I)/*/ | sed -E 's/^(.*)\/(.*)\/$$/-v $(CURDIR_ESCAPED)\/\1\/\2:\/\2/') -d $(IMAGE)
