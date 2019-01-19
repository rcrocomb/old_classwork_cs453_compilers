# Author: Robert Crocombe
#

CC = gcc
CXX = g++
FLEX = flex

# -O2 optimize a bit: usually -O3 is not so great for gcc
# -Wall turn on all warnings
# -MMD autobuild dependencies: leave out system headers
# -MF the name of the dependency file to use.
COMMON_FLAGS = -g2 -march=pentium3 -Wall
#COMMON_FLAGS = -O2 -march=pentium3 -Wall
CCFLAGS = $(COMMON_FLAGS)
CXXFLAGS = $(COMMON_FLAGS) 
FLEXOPTS = 
INCLUDES = -I.
LIBRARIES = -lfl

# What we're generating

MAIN_SOURCE = array_info.cpp\
	      data_info.cpp\
	      field_info.cpp\
	      function_info.cpp\
	      label_info.cpp\
	      main.cpp\
	      parser_data.cpp\
	      parser_utils.cpp\
	      semantics_bouncer.cpp\
	      set_map.cpp\
	      symbol_table.cpp\
	      variable_info.cpp\
	      three_code.cpp\
	      codelist.cpp

C_SOURCE = lex.yy.c
FLEXFILE = scanner.l

SOURCE = $(MAIN_SOURCE) $(C_SOURCE)

# here's what we want to make
MAINFILE = compile

# here's how we make it
.SUFFIXES: .cpp .c .o

.c.o:
	$(CC) $(INCLUDES) $(CCFLAGS) -c $*.c -o $*.o
	$(CC) -MM $(CCFLAGS) $*.c > $*.d
	@mv -f $*.d $*.d.tmp
	@sed -e 's|.*:|$*.o:|' < $*.d.tmp > $*.d
	@sed -e 's/.*://' -e 's/\\$$//' < $*.d.tmp | fmt -1 | \
	  sed -e 's/^ *//' -e 's/$$/:/' >> $*.d
	@rm -rf $*.d.tmp
.cpp.o:
	$(CXX) $(INCLUDES) $(CXXFLAGS) -c $*.cpp -o $*.o
	$(CXX) -MM $(CXXFLAGS) $*.cpp > $*.d
	@mv -f $*.d $*.d.tmp
	@sed -e 's|.*:|$*.o:|' < $*.d.tmp > $*.d
	@sed -e 's/.*://' -e 's/\\$$//' < $*.d.tmp | fmt -1 | \
	  sed -e 's/^ *//' -e 's/$$/:/' >> $*.d
	@rm -rf $*.d.tmp

# the targets

CXX_OBJECTS = $(MAIN_SOURCE:.cpp=.o)
C_OBJECTS = $(C_SOURCE:.c=.o)

OBJECTS = $(CXX_OBJECTS) $(C_OBJECTS)

$(MAINFILE):	$(OBJECTS)
		$(CXX) $(INCLUDES) $(CXXFLAGS) $(OBJECTS) -o $@ $(LIBRARIES)

-include $(OBJECTS:.o=.d)

lex.yy.c: $(FLEXFILE)
	 $(FLEX) $(FLEXOPTS) $(FLEXFILE)

.PHONY: clean
clean:
	rm -f $(OBJECTS) $(MAINFILE) *.d

.PHONY: mrproper
mrproper:
	rm -f $(OBJECTS) $(MAINFILE) lex.yy.c *.d
