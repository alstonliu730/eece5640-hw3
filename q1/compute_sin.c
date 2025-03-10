#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>

/**
 * Compute sin(x) using a Taylor Series Expansion using single precision
 */
float fsin(float x, int n) {
    // variables that are shared
    float sum = 0;

    // taylor expansion
    for (int i = 0; i <= n; i++) {
        int j;
        int exp = (2 * i + 1);
        float dividend = 1.0;
        float divisor = 1.0;
        // calculate x^i and factorial
        #pragma omp parallel for reduction(*:dividend, divisor)
        for (j = 0; j < exp; j++) {
            dividend *= x;
            divisor *= (j+1);
        }

        // printf("Dividend for x^%d: %f\n", exp, dividend);

        // summation result
        sum += ((i % 2 == 0) ? (dividend / divisor) : ((-1 * dividend) / divisor));

        // printf("Divisor for %d!: %f\n", exp, divisor);
        // printf("Sum(%d): %f\n", i, sum);
    }

    return sum;
}

/**
 * Compute sin(x) using a Taylor Series Expansion using double precision
 */
double dsin(double x, int n) {
    // variables that are shared
    double sum = 0;

    // taylor expansion
    for (int i = 0; i <= n; i++) {
        int j;
        int exp = (2 * i + 1);
        double dividend = 1.0;
        double divisor = 1.0;
        // calculate x^i and factorial
        #pragma omp parallel for reduction(*:dividend, divisor)
        for (j = 0; j < exp; j++) {
            dividend *= x;
            divisor *= (j+1);
        }

        // printf("Dividend for x^%d: %lf\n", exp, dividend);

        // summation result
        sum += ((i % 2 == 0) ? (dividend / divisor) : ((-1 * dividend) / divisor));

        // printf("Divisor for %d!: %lf\n", exp, divisor);
        // printf("Sum(%d): %lf\n", i, sum);
    }

    return sum;
}

// main function
int main() {
    float x = 1.57079632679; // pi / 2
    float n = 97;

    // float sine function
    float result1 = fsin(x, n);

    // float sine function
    double result2 = dsin((double) x, n);

    // print result
    printf("fsin: %f\n", result1);
    printf("dsin: %lf\n", result2);
}