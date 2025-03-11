#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

#define N 256
#define N_2 (N * N)

double CLOCK() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (t.tv_sec * 1000) + (t.tv_nsec*1e-6);
}

void matmul_omp(float *m1, float *m2, float *m3) {
    int i,j,k;
    #pragma omp parallel for simd private(j, k) shared(m1, m2, m3)
    for(i = 0; i < N; i++) {
        for(j=0; j < N; j++) {
            for(k = 0; k < N; k++) {
                m3[i * N + j] += m1[i * N + k] * m2[k * N + j];
            }
        }
    }
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

    // Perform matrix multiplication using openMP brute-force
    start = CLOCK();
    matmul_omp(A, B, res1);
    finish = CLOCK();
    total = finish - start;

    // Print the result matrix 1
    printf("Mat Mul OpenMP\n");
    printf("Result 1: %g\n", res1[(N-1) * N + (N-1)]);
    printf("Time Elapsed: %lfms\n", total);

    // Free allocated memory
    free(A);
    free(B);
    free(res1);

    return 0;
}
