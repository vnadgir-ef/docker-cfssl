default: build

NAME=docker-cfssl
REGISTRY=quay.io/vnadgir_ef/

build:
	docker build --force-rm -t $(NAME) .

push:
	docker tag $(NAME) $(REGISTRY)$(NAME):$(VERSION)
	docker push $(REGISTRY)$(NAME):$(VERSION)
