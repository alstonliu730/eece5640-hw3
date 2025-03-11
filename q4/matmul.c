#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cblas.h>
#include <omp.h>

#define N 256

double CLOCK() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (t.tv_sec * 1000) + (t.tv_nsec*1e-6);
}

void matmul_omp(float *m1, float *m2, float *m3) {
    int i,j,k;
    #pragma omp parallel for simd private(j, k) shared(a, b, c)
    for(i = 0; i < N; i++) {
        for(j=0; j < N; j++) {
            for(k = 0; k < N; k++) {
                m3[i][j] += m1[i][k] * m2[k][j];
            }
        }
    }
}

int main() {
    // benchmark variables
    double start, finish, total;

    // Allocate memory for matrices
    float *A = (float *)malloc(N * N * sizeof(float));
    float *B = (float *)malloc(N * N * sizeof(float));
    float *res1 = (float *)malloc(N * N * sizeof(float));
    float *res2 = (float *)malloc(N * N * sizeof(float));

    // Initialize matrix values (example)
    for (int i = 0; i < m * k; i++) {
        A[i] = i + 1;
    }
    for (int i = 0; i < k * n; i++) {
        B[i] = i + 1;
    }

    // Perform matrix multiplication using openMP brute-force
    start = CLOCK();
    matmul_omp(A, B, res1);
    finish = CLOCK();
    total = finish - start;

    // Print the result matrix 1
    printf("Mat Mul OpenMP\n");
    printf("Result 1: %g\n", res1[N-1][N-1]);

    // Perform matrix multiplication using cblas_sgemm
    start = CLOCK();
    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1.0f, A, N, B, N, 0.0f, res2, N); 
    finish = CLOCK();
    total = finish - start;
    
    // Print the result matrix 2
    printf("Mut Mul cblas\n");
    printf("Result 2: %g\n", res2[N-1][N-1]);

    // Free allocated memory
    free(A);
    free(B);
    free(C);

    return 0;
}
