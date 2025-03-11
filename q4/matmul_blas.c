#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cblas.h>

#define N 256
#define N_2 (N * N)

double CLOCK() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (t.tv_sec * 1000) + (t.tv_nsec*1e-6);
}

int main() {
    // benchmark variables
    double start, finish, total;

    // Allocate memory for matrices
    float *A = (float *)malloc(N_2 * sizeof(float));
    float *B = (float *)malloc(N_2 * sizeof(float));
    float *res1 = (float *)malloc(N_2 * sizeof(float));

    // Initialize matrix values (example)
    for (int i = 0; i < N_2; i++) {
        A[i] = i + 1;
    }
    for (int i = 0; i < N_2; i++) {
        B[i] = i + 1;
    }

    // Perform matrix multiplication using cblas_sgemm
    start = CLOCK();
    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1.0f, A, N, B, N, 0.0f, res1, N); 
    finish = CLOCK();
    total = finish - start;
    
    // Print the result matrix 2
    printf("OpenBLAS MatMul\n");
    printf("Result 1: %g\n", res1[(N-1) * N + (N-1)]);
    printf("Time Elapsed: %lfms\n", total);

    // Free allocated memory
    free(A);
    free(B);
    free(res1);

    return 0;
}
