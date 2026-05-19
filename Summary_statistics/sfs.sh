#!/bin/bash
#SBATCH -N 1        	# number of nodes
#SBATCH -c 10        	# number of cores
#SBATCH -t 00-04:00:00   # time in d-hh:mm:ss
#SBATCH -p highmem      	# partition
#SBATCH -q public   	# QOS
#SBATCH -o slurm.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err # file to save job's STDERR (%j = JobId)
 
 
cd /scratch/eheenken/Rhesus_macaque/preliminary_analyses/sfs/easySFS
 
#./easySFS.py -i ../../../../autosomal_GT.demography.accessible.vcf -p pops_file.txt #--preview -a
#--proj 20,20
 
./easySFS.py -i ../../../../autosomal_GT.demography.accessible.vcf -p pops_file.txt -a \ --proj 20,20 -f
