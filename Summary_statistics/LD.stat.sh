#!/bin/bash
#SBATCH -c 1
#SBATCH -N 1            # number of nodes
#SBATCH -n 1            # number of "tasks" (default: 1 core per task)
#SBATCH -p general
#SBATCH -q public
#SBATCH -t 7-00:00:00   # time in d-hh:mm:ss
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err
#SBATCH --job-name=LD.India.1mb
#SBATCH --mem=100G

ml plink/1.90


#for Chinese population
cd /scratch/Rhesus_macaque/demography/LD_stats/chr-based/populations/China/1mb-based 

for chr in {1..20}; do
    plink --vcf ../chr${chr}.vcf.gz \
          --r2 \
          --ld-window 99999 \
          --ld-window-kb 1000 \
          --ld-window-r2 0 \
          --out chr${chr}_ch.1mb
done


#For Indian population
cd /scratch/Rhesus_macaque/demography/LD_stats/chr-based/populations/India/1mb-based 

for chr in {1..20}; do
    plink --vcf ../chr${chr}.vcf.gz \
          --r2 \
          --ld-window 99999 \
          --ld-window-kb 1000 \
          --ld-window-r2 0 \
          --out chr${chr}_In.1mb
done
