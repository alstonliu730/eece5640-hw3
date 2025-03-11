#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <omp.h>
#include <x86intrin.h>

static const uint32_t BLOCKSIZE = 32;

static void do_block(const uint32_t n, const uint32_t si, const uint32_t sj, const uint32_t sk, const double *A, const double*B, double *C) {
    const uint32_t UNROLL = 4;

    for( uint32_t i = si; i < si + BLOCKSIZE; i += UNROLL * 8)
    {
        for( uint32_t j = sj; j < sj + BLOCKSIZE; ++j)
        {
            __m512d c[UNROLL];
            for( uint32_t r = 0; r < UNROLL; r++)
            {
                c[r] = _mm512_load_pd(C + i + r * 8 + j * n); //[ UNROLL];
            }

            for( uint32_t k = sk; k < sk + BLOCKSIZE; k++ )
            {
                __m512d bb = _mm512_broadcastsd_pd(_mm_load_sd(B + j * n + k));
                for( uint32_t r = 0; r < UNROLL; r++)
                {
                    c[r] = _mm512_fmadd_pd(_mm512_load_pd(A + n * k + r * 8 + i), bb, c[r]);
                }
            }
            for( uint32_t r = 0; r < UNROLL; r++)
            {
                _mm512_store_pd(C + i + r * 8 + j * n, c[r]);
            }
        }
    }
}

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



void dgemm_openmp(const uint32_t n, const double* A, const double* B, double* C) {
    #pragma omp parallel for
    for( uint32_t sj = 0; sj < n; sj += BLOCKSIZE )
    {
        for( uint32_t si = 0; si < n; si += BLOCKSIZE )
        {
            for( uint32_t sk = 0; sk < n; sk += BLOCKSIZE )
            {
                do_block(n, si, sj, sk, A, B, C);
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

    // Initialize matrix values (example)
    for (int i = 0; i < m * k; i++) {
        A[i] = i + 1;
    }
    for (int i = 0; i < k * n; i++) {
        B[i] = i + 1;
    }

    // Perform matrix multiplication using openMP brute-force
    start = CLOCK();
    dgemm_openmp(N, A, B, res1);
    finish = CLOCK();
    total = finish - start;

    // Print the result matrix 1
    printf("Mat Mul OpenMP\n");
    printf("Result 1: %g\n", res1[N-1][N-1]);
    printf("Time Elapsed: %lfms\n", total);

    // Free allocated memory
    free(A);
    free(B);
    free(res1);

    return 0;
}
