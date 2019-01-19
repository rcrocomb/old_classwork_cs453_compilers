CC = gcc
CFLAGS = -O2 -g -Wall

LEX = flex
#LEXOPTS = -CFra -L 

CFILES = main.c print.c

GENCFILES = lex.yy.c			    # machine generated files

HFILES = tokens.h 

OFILES = main.o lex.yy.o print.o

LIBS = -lfl -lm

DEST = parse

$(DEST) : $(OFILES) 
	$(CC) $(CFLAGS) $(OFILES) -o $(DEST) $(LIBS)

lex.yy.c : scanner.l 
	$(LEX) $(LEXOPTS) scanner.l

main.o : main.c  tokens.h

print.o : print.c tokens.h

lex.yy.o : lex.yy.c tokens.h

clean:
	/bin/rm -f *.BAK *.o $(DEST)

realclean:
	/bin/rm -f *.BAK *.o $(DEST) $(GENCFILES) $(GENHFILES)
