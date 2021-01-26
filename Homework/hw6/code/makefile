CC = gcc
CFLAGS = -g -Wall -Wextra -pedantic

OBJ = Drivers.o SparseMat.o

Driver: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) -lm

%.o: %.c
	$(CC) $(CFLAGS) -c $<

.PHONY: clean

clean:
	rm -f Driver *.o *~
