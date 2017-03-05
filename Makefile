dirs := dir1/ dir2/

srctree := .

obj := $(srctree)

export srctree

include ./Makefile.lib

build := -f ./Makefile.build obj

$(subdirs) : FORCE
	echo in top $(srctree)
	echo $(MAKELEVEL)
	echo $(subdirs)
	$(Q)$(MAKE) $(build)=$@

FORCE :

