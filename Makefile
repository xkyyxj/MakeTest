dirs := dir1/ dir2/

all :

srctree := .

obj := $(srctree)

export srctree

include ./Makefile.lib

build := -f ./Makefile.build obj

#必须加上这么一个总目标才行，如果不加的话就会导致只能递归进入的一个子目录
#第二个子目录会被忽略
#加上这么一个目标之后就像是Makefile.build一样了
all : $(subdirs) 

$(subdirs) :
	echo in top $(srctree)
	echo $(MAKELEVEL)
	echo $(subdirs)
	$(Q)$(MAKE) $(build)=$@

.PHONY : $(subdirs) all
