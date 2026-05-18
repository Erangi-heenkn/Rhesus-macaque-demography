#!/bin/bash
#SBATCH -c 1
#SBATCH -N 1            # number of nodes
#SBATCH -n 1            # number of "tasks" (default: 1 core per task)
#SBATCH -p general
#SBATCH -t 01-00:00:00   # time in d-hh:mm:ss
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err
#SBATCH --job-name=dadi.best.fit

cd /scratch/eheenken/Rhesus_macaque/demography/DADI/bestfit.dadi

module load mamba/latest
source activate dadiENV

for i in $(seq 1 100); do
/home/eheenken/.conda/envs/dadiENV/bin/python3 new.dadiBest.Asym.py -outFile ./best.fit.Asym.size2.txt
done


