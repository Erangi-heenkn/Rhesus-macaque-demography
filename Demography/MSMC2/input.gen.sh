#!/bin/bash
#SBATCH -c 1
#SBATCH -N 1            # number of nodes
#SBATCH -n 1            # number of "tasks" (default: 1 core per task)
#SBATCH -p general
#SBATCH -q public
#SBATCH -t 2-00:00:00   # time in d-hh:mm:ss
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err
#SBATCH --job-name=MSMC2.input


cd /scratch/Rhesus_macaque/demography/MSMC2/INDIA

perl ../vcf2multihetsep-v0.04.pl "India.vcf" -use "../use_mask/*.use.bed" --fileType=bed -call "../call_mask/*.call.bed" --fileType=bed -out "*.IN.no.sil.msmc.txt" -checkPhased 0 -debug > output.IN.log

cd /scratch/Rhesus_macaque/demography/MSMC2/CHINA

perl ../vcf2multihetsep-v0.04.pl "China.vcf" -use "../use_mask/*.use.bed" --fileType=bed -call "../call_mask/*.call.bed" --fileType=bed -out "*.CH.no.sil.msmc.txt" -checkPhased 0 -debug > output.CH.log

