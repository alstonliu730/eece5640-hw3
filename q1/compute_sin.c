#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <math.h>
#include <time.h>

double CLOCK() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (t.tv_sec * 1000) + (t.tv_nsec*1e-6);
}

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
    float x = 1.047197;
    int n = 50;
    double total, start, finish;
    
    // float sine function
    start = CLOCK();
    float result1 = fsin(x, n);
    finish = CLOCK();
    total = finish - start;

    // print floating point result
    printf("Floating Point Sin\n");
    printf("fsin result: %f\n", result1);
    printf("Time elapsed: %lfms\n", total);

    double x1 = 1.047197;

    // double sine function
    start = CLOCK();
    double result2 = dsin(x1, n);
    finish = CLOCK();
    total = finish - start;

    // print floating point result
    printf("Double Precision FP Sin\n");
    printf("dsin result: %lf\n", result2);
    printf("Time elapsed: %lfms\n", total);
}