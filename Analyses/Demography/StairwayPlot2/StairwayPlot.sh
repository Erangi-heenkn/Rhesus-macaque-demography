#!/bin/bash
#SBATCH -N 1            # number of nodes
#SBATCH -c 1            # number of cores
#SBATCH -t 01-04:00:00   # time in d-hh:mm:ss
#SBATCH -p general          # partition
#SBATCH -q public       # QOS
#SBATCH -o slurm.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err # file to save job's STDERR (%j = JobId)


cd ~/stairway-plot-v2/stairway_plot_v2.1.3

java -cp stairway_plot_es Stairbuilder Chinese_fold.blueprint
bash Chinese_fold.blueprint.sh

java -cp stairway_plot_es Stairbuilder Indian_fold.blueprint
bash Indian_fold.blueprint.sh
