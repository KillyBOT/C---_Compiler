ifeq ($(DEBUG),true)
	CC = gcc -g
else
	CC = gcc
endif

LIBS = -lm -lpthread

DEPS = y.tab.h

OBJ = y.tab.o lex.yy.o main.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) $(LIBS)

CMMM_Compiler: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

lex.yy.c: y.tab.h
	flex cmmmParser.l

y.tab.c: cmmmParser.y
	bison -y -d cmmmParser.y

y.tab.h: cmmmParser.y
	bison -y -d cmmmParser.y

clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm *.o

run: CMMM_Compiler
	./CMMM_Compiler simpleEval.cmmm
