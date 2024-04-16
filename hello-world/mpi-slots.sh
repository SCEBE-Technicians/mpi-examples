#!/bin/bash -l
#SBATCH --export=ALL
#SBATCH -o job-%j.output
#SBATCH -J 
#SBATCH --mail-user=your.email@example.com
#SBATCH --mail-type ALL
#SBATCH --time=0-1
#SBATCH --mem=1024
#SBATCH --nodes=2
#SBATCH --ntasks=16

module load mpi/openmpi

if ! command -v mpirun ; then
    echo "No mpirun command found, ensure that a version of MPI is installed and available in PATH" >&2
    exit 1
fi

RESULTS_DIR="$(pwd)/output"
echo "Your results will be stored in: $RESULTS_DIR"
mkdir -p "$RESULTS_DIR"

echo "Executing job commands, current working directory is $(pwd)"

echo "Hello!" > $RESULTS_DIR/test.output
echo "This is an example job. It was allocated $SLURM_NTASKS slot(s) across $SLURM_JOB_NUM_NODES node(s). The master process ran on `hostname -s` (as `whoami`)." >> $RESULTS_DIR/test.output
mpirun \
    /bin/bash -c \
    'echo "This process was executed on `hostname -s` with rank $OMPI_COMM_WORLD_RANK."' \
    >> $RESULTS_DIR/test.output

echo "Output file has been generated, please check $RESULTS_DIR/test.output"
