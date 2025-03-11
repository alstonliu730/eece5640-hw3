CC = gcc
CFLAGS = -Wall -Wextra -g -O2
BLAS_FLAGS = -lopenblas
OMPFLAGS = -fopenmp

TARGETS = matmul matmul_blas

all: $(TARGETS)
	make $(TARGETS)

matmul: matmul.c
	$(CC) $(CFLAGS) -o $@ matmul.c $(OMPFLAGS)

matmul_blas: matmul_blas.c
	$(CC) $(CFLAGS) -o $@ matmul_blas.c $(BLAS_FLAGS)
	
clean:
	rm -f $(TARGETS)
