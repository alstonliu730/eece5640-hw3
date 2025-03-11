#include <stdio.h>
#include <x86intrin.h>
#include <stdlib.h>
#include <time.h>

#define NUM_ELEM(n) (n * 16) // returns # of elements given the # of rows

double CLOCK() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (t.tv_sec * 1000)+(t.tv_nsec*1e-6);
}

// matrix-vector multiplication with AVX512 instruction set
void matvec_avx512f(const float *a, const float *x, float *res, int len_a, int len_x) {
    // Process each row of the matrix
    __m512 a_vec, x_vec, sum_vec;
    for (int i = 0; i < len_a; i++) {
        sum_vec = _mm512_setzero_ps(); // initialize sum vector to zero

        // Use dot product for each row of the matrix
        for (int j = 0; j + 16 <= len_x; j += 16) {
            // Load 16 elements of the matrix row
            a_vec = _mm512_loadu_ps(&a[i * len_x + j]);
            x_vec = _mm512_loadu_ps(&x[j]);
            sum_vec = _mm512_fmadd_ps(a_vec, x_vec, sum_vec);
        }

        // horizontal add the 16 floats in sum vector
        res[i] = _mm512_reduce_add_ps(sum_vec);
    }
}

// matrix-vector multiplication
void matvec(const float *a, const float *x, float *res, int len_a, int len_x) {
    // Iterate over each row of the matrix
    for (int i = 0; i < len_a; i++) {
        float sum = 0.0f;  // Initialize the sum for each row
        // Perform dot product of row i of A with vector x
        for (int j = 0; j < len_x; ++j) {
            sum += a[i * len_x + j] * x[j];
        }
        res[i] = sum;  // Store the result in y
    }
}

void print_vector(const float *v, int len) {
    for(int i = 0; i < len; i++) {
        if (i % 16 == 0)
            printf("\n");
        printf("%f ", v[i]);
    }
    printf("\n");
}

int main() {
    #define M 32 // # of AVX vectors in matrix
    #define N 1  // vector

    double start, finish, total;
    int i,j;
    float a[NUM_ELEM(M)], x[NUM_ELEM(N)];
    float res[NUM_ELEM(N)];
    size_t a_len = M; // # of rows
    size_t x_len = sizeof(x)/sizeof(x[0]);
    // size_t len = sizeof(a) / sizeof(a[0]);

    for (i=0; i< NUM_ELEM(M); i++) {
        a[i] = (float) i;
    }

    for(j=0; j< NUM_ELEM(N); j++) {
        x[j] = 1.0f;
    }

    // Initialize result array
    for(int i = 0; i < NUM_ELEM(N); ++i) {
        res[i] = 0.0f;
    }

    start = CLOCK();
    matvec_avx512f(a, x, res, a_len, x_len);
    finish = CLOCK();

    total = finish-start;
    printf("Mat-vec result\n"); /* prevent dead code elimination */
    print_vector(res, NUM_ELEM(N));
    printf("The total time for matrix multiplication with AVX = %f ms\n", total);
    
    // reinitialize result array
    for(int i = 0; i < NUM_ELEM(N); ++i) {
        res[i] = 0.0f;
    }

    start = CLOCK();    
    matvec(a, x, res, a_len, x_len);
    finish = CLOCK();
    total = finish-start;

    printf("Mat-vec result\n"); /* prevent dead code elimination */
    print_vector(res, NUM_ELEM(N));
    printf("The total time for matrix multiplication without AVX = %f ms\n", total);
    return 0;
}
