# execute makefiles in all subdirectories
# from https://stackoverflow.com/a/17845120/2467963
SUBDIRS := $(wildcard */.)

all: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)
