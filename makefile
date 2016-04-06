# MD5_2
EXE=md5mesh

# Main target
all: $(EXE)

CFLG=-O3 -Wall
LIBS=-lglut -lGLU -lGL -lm


CLEAN=rm -f $(EXE) *.o *.a

# Dependicies
md5mesh.o: md5mesh.c md5model.h
md5anim.o: md5anim.c md5model.h



# Create archive
md5.a:md5anim.o
	ar -rcs $@ $^

# Compile rules
.c.o:
	gcc -c $(CFLG) $<
.cpp.o:
	g++ -c $(CFLG) $<

# Link
md5mesh:md5mesh.o md5.a
	gcc -O3 -o $@ $^	$(LIBS)


# Clean
clean:
	$(CLEAN)
