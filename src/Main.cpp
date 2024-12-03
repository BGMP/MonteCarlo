////////////////////////////////////////////////////////////////////////////////
//
// Main (Generic)
//
// Desc: Main.cpp
// Main program.
//
// 14/10/2024 (BGM)
// File inception.
//
////////////////////////////////////////////////////////////////////////////////

#include "../include/Main.h"
#include "../include/math_MonteCarloSequential.h"
#include "../include/math_MonteCarloParallel.h"

////////////////////////////////////////////////////////////////////////////////
// Macros:
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Types:
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Prototypes:
////////////////////////////////////////////////////////////////////////////////

int main(long argc, char* argv[]);

////////////////////////////////////////////////////////////////////////////////
// Globals:
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Procedures:
////////////////////////////////////////////////////////////////////////////////

int main(long argc, char* argv[]) {
    int num_iterations = (argc > 1) ? std::atol(argv[1]) : N;

    std::cout << "=== Algoritmo Monte Carlo para Cálculo de PI ===" << std::endl;
    std::cout << "- Puntos: " << num_iterations << " (N)" << std::endl;

    #ifdef SECUENCIAL

    std::cout << "- Método: SECUENCIAL" << std::endl;

    // Time measurement for Sequential Monte Carlo PI Calculation
    auto startSeq = std::chrono::high_resolution_clock::now();
    double piSequential = runSequentialMonteCarloPICalculation(num_iterations);
    auto endSeq = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsedSeq = endSeq - startSeq;

    std::cout << "- Aproximación de PI: " << piSequential << std::endl;
    std::cout << "- Tiempo de Ejecución: " << elapsedSeq.count() << " segundos" << std::endl;

    std::cout << "---" << std::endl;

    #endif

    #ifdef PARALELO

    std::cout << "- Método: PARALELA" << std::endl;

    int num_threads = (argc > 2) ? std::atoi(argv[2]) : NUM_THREADS;

    std::cout << "- Hebras: " << num_threads << " (NUM_THREADS)" << std::endl;

    // Time measurement for Parallel Monte Carlo PI Calculation
    auto startPar = std::chrono::high_resolution_clock::now();
    double piParallel = runParallelMonteCarloPICalculation(num_iterations, num_threads);
    auto endPar = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsedPar = endPar - startPar;

    std::cout << "- Aproximación de PI: " << piParallel << std::endl;
    std::cout << "- Tiempo de Ejecución: " << elapsedPar.count() << " segundos" << std::endl;

    #endif

    return 0;
}
