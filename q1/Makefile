CC = gcc
CFLAGS = -Wall -Wextra -g -O2

TARGETS = compute_sin

all: $(TARGETS)
	make $(TARGETS)

compute_sin: compute_sin.c compute_sin.h
	$(CC) $(CFLAGS) -o $@ compute_sin.c

clean: 
	rm -f $(TARGETS)