REGISTORY := yowcow/debian-buster-perl5

VERSIONS := 5.10.1 5.16.3
DOCKERFILES := $(foreach ver,$(VERSIONS),$(ver)/Dockerfile)
BUILDTARGETS := $(foreach ver,$(VERSIONS),build-$(ver))

all: $(DOCKERFILES)

build:
	$(MAKE) -j 2 $(BUILDTARGETS)

build-%: %/Dockerfile
	cd $* && docker build -t $(REGISTORY):$* .

debug-%:
	docker run --rm -it $(REGISTORY):$* bash

%/Dockerfile: debian-buster-perl5.Dockerfile
	cat $< | sed -e 's/##PERL_VERSION##/$*/g' > $@

.PHONY: all build build-* debug-*
