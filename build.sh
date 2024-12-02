#!/bin/bash

# Set up output directories
mkdir -p bin/Debug_Secuencial bin/Debug_Paralelo bin/Release

# Compiler and flags
CXX="g++"
CXXFLAGS="-std=c++11 -Wall -fexceptions -fopenmp"
INCLUDES="-Iinclude"
SRC="src/Main.cpp src/math_MonteCarloSequential.cpp src/math_MonteCarloParallel.cpp"

# Build Debug_Secuencial
echo "Building Debug_Secuencial..."
$CXX $CXXFLAGS -g -pg -DSECUENCIAL $INCLUDES $SRC -o bin/Debug_Secuencial/MonteCarloSecuencial
if [ $? -ne 0 ]; then
  echo "Failed to build Debug_Secuencial."
  exit 1
fi

# Build Debug_Paralelo
echo "Building Debug_Paralelo..."
$CXX $CXXFLAGS -g -pg -DPARALELO $INCLUDES $SRC -o bin/Debug_Paralelo/MonteCarloParalelo
if [ $? -ne 0 ]; then
  echo "Failed to build Debug_Paralelo."
  exit 1
fi

# Build Release
echo "Building Release..."
$CXX $CXXFLAGS -O2 -s $INCLUDES $SRC -o bin/Release/MonteCarlo
if [ $? -ne 0 ]; then
  echo "Failed to build Release."
  exit 1
fi

echo "Build completed successfully."
