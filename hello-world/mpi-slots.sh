#!/bin/bash -l
#SBATCH --export=ALL
#SBATCH -o job-%j.output
#SBATCH -J 
#SBATCH --mail-user=your.email@example.com
#SBATCH --mail-type ALL
#SBATCH --time=0-1
#SBATCH --mem=1024
#SBATCH --nodes=1
#SBATCH --ntasks=32

# module load mpi/openmpi

mpirun hello-world
