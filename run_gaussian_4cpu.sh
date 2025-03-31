#!/bin/bash
# Run in the standard partition (queue)
#SBATCH --partition=teaching
#
# Specify project account
#SBATCH --account=teaching
# No. of tasks required (max. of 16)
#SBATCH --ntasks=4 --nodes=1
#SBATCH --time=00:30:00
#SBATCH --job-name=main_assignment4
#SBATCH --output=slurm-%j.out
module purge

module load gaussian/g16    # Load Gaussian module (adjust based on HPC)
/opt/software/script/job_prologue.sh
export GAUSS_SCRDIR=$SLURM_SUBMIT_DIR
g16 Molecule_TETCEN_SP_4cpu.com                      # Run Gaussian calculation for molecule 1
g16 Molecule_PENCEN_SP_4cpu.com                      # Run Gaussian calculation for molecule 2
/opt/software/scripts/job_epilogue.sh
