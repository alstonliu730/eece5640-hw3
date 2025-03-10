CC = gcc
CFLAGS = -Wall -Wextra -g -O2
MPFLAGS = -fopenmp

TARGETS = compute_sin

all: $(TARGETS)
	make $(TARGETS)

compute_sin: compute_sin.c compute_sin.h
	$(CC) $(CFLAGS) -o $@ compute_sin.c $(MPFLAGS)