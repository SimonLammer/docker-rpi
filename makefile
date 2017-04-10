NAMESPACE=simonlammer
IMAGE_PREFIX=rpi-

I=none
IMAGE=$(NAMESPACE)/$(IMAGE_PREFIX)$(I)

help:
	@echo "Usage:"
	@echo "    make [build | push] I=<image>"
	@echo "    make [help | clear-images]"

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

clear-images:
	@echo "clear-images"