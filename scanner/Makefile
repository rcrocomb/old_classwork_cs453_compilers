# Author: Robert Crocombe
#
# Hey, this doesn't suck too bad.

# autobuild dependencies using gcc
DEPENDS = .depends

CC = gcc
FLEX = flex

# -O2 optimize a bit: usually -O3 is not so great for gcc
# -Wall turn on all warnings
# -MMD autobuild dependencies: leave out system headers
# -MF the name of the dependency file to use.
CCFLAGS = -g2 -march=pentium3 -Wall -MMD -MF $(DEPENDS)
FLEXOPTS =
INCLUDES = -I.
LIBRARIES = -lfl

# What we're generating

MAIN_SOURCE = lex.yy.c main.c print.c
FLEXFILE = scanner.l

SOURCE = $(MAIN_SOURCE)

# here's what we want to make
MAINFILE = parse

# here's how we make it
.SUFFIXES: .c .o

.c.o:
	$(CC) $(INCLUDES) $(CCFLAGS) -c $<

# the targets

OBJECTS = $(SOURCE:.c=.o)

$(MAINFILE):	$(OBJECTS)
		$(CC) $(INCLUDES) $(CCFLAGS) $(OBJECTS) -o $@ $(LIBRARIES)

lex.yy.c: $(FLEXFILE)
	 $(FLEX) $(FLEXOPTS) $(FLEXFILE)

# I'm not sure if good things happen the first time we do this.
#
# I mean, we generate the file if it's missing, but *after* it should
# have been #included, I think.  Drat it.
#
# Actually, no: it seems to work decently despite the warning: things
# are built okay, and if you do a touch tokens.h or whatever it does
# the necessary recompilations.  I think I'm good to go.
.depends:
	 touch $(DEPENDS)

.PHONY: clean
clean:
	rm -f $(OBJECTS) $(MAINFILE)
	touch $(DEPENDS)

.PHONY: mrproper
mrproper:
	rm -f $(OBJECTS) $(MAINFILE) $(DEPENDS) lex.yy.c
	touch $(DEPENDS)

# hey wow, include dependency info
include $(DEPENDS)
