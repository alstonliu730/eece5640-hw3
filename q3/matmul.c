#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>
      
#define LOOPS 10       
#define N 512   // Matrix Size (divisible by p)
#define G 4     // Grid Size
#define P 64    // Number of processors (must be p ^ 3)

typedef struct {
    int *row_idx;       // start index of each row
    int *col_idx;       // column index of each element
    double *values;     // Value array
    int nnz;            // # of nonzeros
} CSR;

double CLOCK() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (t.tv_sec * 1000) + (t.tv_nsec*1e-6);
}

int main(){
    double a[N][N]; /* input matrix */
    double b[N][N]; /* input matrix */
    double c[N][N]; /* result matrix */
    int i,j,k,l, num_zeros;
    int blockSize = N / G;
    double start, finish, total;

    /* initialize a dense matrix */
    for(i=0; i<N; i++){    
        for(j=0; j<N; j++){
            a[i][j] = (double)(i+j);
            b[i][j] = (double)(i-j);
        }
    }
    
    printf("starting dense matrix multiply \n");
    start = CLOCK();
    #pragma omp parallel num_threads(P)
    {
        int tid = omp_get_thread_num();
        int i = tid / (G * G);
        int j = (tid / G) % G;
        int k = tid % G;

        double A_local[blockSize][blockSize];
        double B_local[blockSize][blockSize];
        double C_local[blockSize][blockSize];

        // Load submatrices for A and B
        for (int x = 0; x < blockSize; x++) {
            for (int y = 0; y < blockSize; y++) {
                A_local[x][y] = a[i * blockSize + x][k * blockSize + y];
                B_local[x][y] = b[k * blockSize + x][j * blockSize + y];
            }
        }

        // Local computation of C
        for (int x = 0; x < blockSize; x++) {
            for (int y = 0; y < blockSize; y++) {
                for (int z = 0; z < blockSize; z++) {
                    C_local[x][y] += A_local[x][z] * B_local[z][y];
                }
            }
        }

        //aggregate results to C
        #pragma omp critical
        {
            for (int x = 0; x < blockSize; x++) {
                for (int y = 0; y < blockSize; y++) {
                    c[i * blockSize + x][j * blockSize + y] += C_local[x][y];
                }
            }
        }
    }

    finish = CLOCK();

    total = finish-start;
    printf("a result: %g \n", c[7][8]); /* prevent dead code elimination */
    printf("The total time for matrix multiplication with dense matrices = %f ms\n", total);

    /* initialize a sparse matrix */
    num_zeros = 0; 
    for(i=0; i<N; i++){    
        for(j=0; j<N; j++){
            if ((i<j)&&(i%2>0)) {
                a[i][j] = (double)(i+j);
                b[i][j] = (double)(i-j);
            } else { 
                num_zeros++;
                a[i][j] = 0.0;
                b[i][j] = 0.0;
            }
        }
    }
    printf("starting sparse matrix multiply \n");
    start = CLOCK();
    #pragma omp parallel for simd private(j, k) shared(a, b, c)
    for(i = 0; i < N; i++) {
        for(j=0; j < N; j++) {
            for(k = 0; k < N; k++) {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    finish = CLOCK();
    total = finish-start;
    printf("a result: %g\n", c[7][8]); /* prevent dead code elimination */
    printf("The total time for matrix multiplication with sparse matrices = %f ms\n", total);
    printf("The sparsity of the a and b matrices = %f \n", (float)num_zeros/(float)(N*N));
    return 0;
}

