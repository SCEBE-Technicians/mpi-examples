#!/bin/bash -l
#SBATCH --export=ALL
#SBATCH -o hello-world.output
#SBATCH -J mpi-test
#SBATCH --time=0-1
#SBATCH --mem=1024
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH -p himem

# module load mpi/openmpi

mpirun hello-world
