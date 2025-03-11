CC = gcc
CFLAGS = -Wall -Wextra -g -O2
BLAS_FLAGS = -I /usr/include/openblas -lopenblas
OMPFLAGS = -fopenmp
AVXFLAGS = -mavx512f

TARGETS = matmul matmul_blas

all: $(TARGETS)
	make $(TARGETS)

matmul: matmul.c
	$(CC) $(CFLAGS) -o $@ matmul.c $(OMPFLAGS) 

matmul_blas: matmul_blas.c
	$(CC) $(CFLAGS) -o $@ matmul.c $(BLAS_FLAGS)
	
clean:
	rm -f $(TARGETS)
