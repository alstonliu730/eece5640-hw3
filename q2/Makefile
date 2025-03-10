CC = gcc
CFLAGS = -Wall -Wextra -g -O2
AVXFLAGS = -mavx512f

TARGETS = dot_product

all: $(TARGETS)
	make $(TARGETS)

dot_product: dotproduct.c
	$(CC) $(CFLAGS) -o $@ dotproduct.c $(AVXFLAGS)

clean:
	rm -f $(TARGETS)
