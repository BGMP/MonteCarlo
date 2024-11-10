# Monte Carlo PI Calculation
This project implements the Monte Carlo method for approximating the value of $\pi$, both in a sequential and parallelized version using OpenMP. The parallel implementation takes advantage of multiple CPU threads to improve performance and reduce computation time.

## Building
For GUI based building, use the Code::Blocks project file.

## Code Explanation
In the main file (`main.cpp`), the flow of execution is conditioned by the `SECUENCIAL` and `PARALELO` macros, which determine which code section will run. The purpose of this approach is to enable direct comparison between the sequential and parallel versions of the $\pi$ calculation. Below is a breakdown of each section:

1. **Sequential Version (`SECUENCIAL`)**:
    - If the `SECUENCIAL` macro is defined, the code runs the $\pi$ calculation using a single processing thread.
    - The execution time is measured using the C++ `chrono` library to determine how long the calculation takes.
    - The estimated value of $\pi$ and the execution time are printed to the console.

2. **Parallel Version (`PARALELO`)**:
    - If the `PARALELO` macro is defined, the $\pi$ calculation is distributed across multiple threads using the `#pragma omp parallel` directive.
    - Just like in the sequential version, the execution time is measured.
    - The estimated value of $\pi$ and the execution time are printed to the console.

## Notes
This project was written as part of the Masters in Computer Science course "Parallel Computing" at the University of the Bío-Bío.

Some of the TeX/PDF files are in Spanish, as the course was taught in Spanish.