CC = gcc
CFLAGS = -Wall -Wextra -g -O2
OMPFLAGS = -fopenmp

TARGETS = matmul

all: $(TARGETS)
	make $(TARGETS)

matmul: matmul.c
	$(CC) $(CFLAGS) -o $@ matmul.c $(OMPFLAGS)

clean:
	rm -f $(TARGETS)
