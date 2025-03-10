#include <stdio.h>
#include <x86intrin.h>
#include <stdlib.h>
#include <time.h>

double CLOCK() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (t.tv_sec * 1000)+(t.tv_nsec*1e-6);
}

// matrix-vector multiplication with AVX512 instruction set
void matvec_avx512(const float *a, const float *x, float *res, int len_a, int len_x) {
    // Initialize result array
    for(int i = 0; i < N; ++i) {
        res[i] = 0.0f;
    }

    // Process each row of the matrix
    for (int i = 0; i < len_a; ++i) {
        __m512 a_vec, x_vec, sum_vec;
        sum_vec = _mm512_setzero_ps(); // initialize sum vector to zero
        

        // Use dot product for each row of the matrix
        for (int j = 0; j < len_x; j += 16) {
            // Load 16 elements of the matrix row
            a_vec = _mm512_loadu_ps(&a[i * N + j]);
            x_vec = _mm512_loadu_ps(&x[j]);
            sum_vec = _mm512_fmadd_ps(a_vec, x_vec, sum_vec);
        }
        
        // horizontal add the 16 floats in sum vector
        res[i] = _mm512_reduce_add_ps(sum_vec);
    }
}

// matrix-vector multiplication
void matvec(const float *a, const float *x, float *res, int M, int N) {
    // Initialize result array
    for(int i = 0; i < N; ++i) {
        res[i] = 0.0f;
    }

    // Iterate over each row of the matrix
    for (int i = 0; i < M; ++i) {
        float sum = 0.0f;  // Initialize the sum for each row
        // Perform dot product of row i of A with vector x
        for (int j = 0; j < N; ++j) {
            sum += a[i * N + j] * x[j];
        }
        res[i] = sum;  // Store the result in y
    }
}

void print_vector(const float *v, int len) {
    for(int i = 0; i < len; i++) {
        printf("%f ", v[i]);
        if (i % 16 == 0) printf("\n");
    }
    printf("\n");
}

int main() {
    #define M 512 // 32 * 16 fp
    #define N 16  // 16 fp vector
    double start, finish, total;
    int i;
    float a[M], x[N];
    float res[N];
    size_t m_len = sizeof(a)/sizeof(a[0]);
    size_t x_len = sizeof(x)/sizeof(x[0]);
    // size_t len = sizeof(a) / sizeof(a[0]);

    for (i=0; i< M; i++) {
        a[i] = (float) i;
    }

    for(j=0; j< N; j++) {
        x[j] = (float) j;
    }

    start = CLOCK();
    matvec_avx512f(a, x, res, m_len, x_len);
    finish = CLOCK();

    total = finish-start;
    printf("Dot product result\n"); /* prevent dead code elimination */
    print_vector(res, N);
    printf("The total time for matrix multiplication with AVX = %f ms\n", total);

    start = CLOCK();
    matvec(a, x, res, m_len, x_len);
    finish = CLOCK();
    total = finish-start;

    printf("Dot product result\n"); /* prevent dead code elimination */
    print_vector(res, N);
    printf("The total time for matrix multiplication without AVX = %f ms\n", total);
    return 0;
}