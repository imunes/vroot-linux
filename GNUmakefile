NAME = imunes/template
TAGS = debian-8 debian-9-min ubuntu-18.04-min debian-9 debian-12-min debian-12 ubuntu-18.04 arm64 latest
clean_TAGS = $(addprefix clean_,$(TAGS))
push_TAGS = $(addprefix push_,$(TAGS))

.PHONY: $(TAGS) $(clean_TAGS) $(push_TAGS)

info:
	@echo	"To print all imunes images: make print"
	@echo	"To build an image use: make name"
	@echo	"To remove an image use: make clean_name"
	@echo	"To push an image use: make push_name"
	@echo	"To build all images use: make build_all"
	@echo	"To remove all images use: make clean_all"
	@echo	"To push all images use: make push_all"

print:
	docker images $(NAME)

$(TAGS):
	./build.sh $@

$(clean_TAGS):
	docker rmi $(NAME):$(patsubst clean_%,%,$@)

$(push_TAGS):
	docker login
	docker push $(NAME):$(patsubst push_%,%,$@)

build_all: $(TAGS)

clean_none:
	docker rmi `docker images | grep '^<none>' | awk '{print $3}'` 2> /dev/null || true
	docker rmi `docker images $(NAME) | grep '<none>' | awk '{print $3}'` 2> /dev/null || true

clean_all: clean_none
	for tag in $(TAGS); do \
		docker rmi $(NAME):$$tag 2> /dev/null || true; \
	done

push_all:
	docker login
	for tag in $(TAGS); do \
		docker push $(NAME):$$tag ; \
	done
