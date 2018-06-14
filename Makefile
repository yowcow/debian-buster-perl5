REGISTORY := yowcow/debian-buster-perl5

all: 5.10.1/Dockerfile

build:
	$(MAKE) -j 2 build-5.10.1

build-%: %/Dockerfile
	cd $* && docker build -t $(REGISTORY):$* .

debug-%:
	docker run --rm -it $(REGISTORY):$* bash

%/Dockerfile: debian-buster-perl5.Dockerfile
	cat $< | sed -e 's/##PERL_VERSION##/$*/g' > $@

.PHONY: all build build-* debug-*
