CC = gcc
CFLAGS = -Wall -Wextra -g -O2
AVXFLAGS = -mavx512f

TARGETS = dot_product mat_vec

all: $(TARGETS)
	make $(TARGETS)

dot_product: dotproduct.c
	$(CC) $(CFLAGS) -o $@ dotproduct.c $(AVXFLAGS)

mat_vec: mat_vec.c
	$(CC) $(CFLAGS) -o $@ mat_vec.c $(AVXFLAGS)

clean:
	rm -f $(TARGETS)
