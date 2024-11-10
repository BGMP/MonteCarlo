////////////////////////////////////////////////////////////////////////////////
//
// MonteCarlo (Generic)
//
// Desc: math_MonteCarloParallel.cpp
// Parallel implementation of the Monte Carlo method.
//
// 14/10/2024 (BGM)
// File inception.
//
////////////////////////////////////////////////////////////////////////////////

#include "../include/math_MonteCarloParallel.h"
#include <omp.h>
#include <random>

////////////////////////////////////////////////////////////////////////////////
// Macros:
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Types:
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Prototypes:
////////////////////////////////////////////////////////////////////////////////

double runParallelMonteCarloPICalculation(int n, int num_threads);

////////////////////////////////////////////////////////////////////////////////
// Globals:
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Procedures:
////////////////////////////////////////////////////////////////////////////////

double runParallelMonteCarloPICalculation(int n, int num_threads) {
    double step, pi, sum[num_threads];

	pi = 0.0;
	step = 1.0 / (double) n;
	omp_set_num_threads(num_threads);

    #pragma omp parallel
	{
		double x;
		int id, i;

		id = omp_get_thread_num();

		for (i = id, sum[id] = 0.0; i < n; i = i + num_threads) {
			x = (i + 0.5) * step;
			sum[id] += 4.0 / (1.0 + x * x);
		}
	}

	for (int i = 0; i < num_threads; i++) {
		pi += sum[i] * step;
	}

	return pi;
}
