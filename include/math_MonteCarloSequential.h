////////////////////////////////////////////////////////////////////////////////
//
// MonteCarlo (Generic)
//
// Desc: math_MonteCarloSequential.h
// Monte Carlo Sequential header.
//
// 14/10/2024 (BGM)
// File inception.
//
////////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <random>
#include <omp.h>
#include <chrono>

////////////////////////////////////////////////////////////////////////////////
// Macros:
////////////////////////////////////////////////////////////////////////////////

#define CIRCLE_MULTIPLIER 4.0

////////////////////////////////////////////////////////////////////////////////
// Types:
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Prototypes:
////////////////////////////////////////////////////////////////////////////////

extern double runSequentialMonteCarloPICalculation(long n);

////////////////////////////////////////////////////////////////////////////////
// Globals:
////////////////////////////////////////////////////////////////////////////////
