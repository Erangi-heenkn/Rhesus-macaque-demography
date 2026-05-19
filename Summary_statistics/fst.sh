##################################### Fst #############################################
#!/bin/bash
#SBATCH -N 1        	# number of nodes
#SBATCH -c 8        	# number of cores
#SBATCH -t 01-00:00:00   # time in d-hh:mm:ss
#SBATCH -p general  	# partition
#SBATCH -q public   	# QOS
#SBATCH -o slurm.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err # file to save job's STDERR (%j = JobId)

ml vcftools 

# for empirical data
vcftools --vcf ../../autosomal_GT.demography.accessible.vcf \
--weir-fst-pop Chinese.pop.txt --weir-fst-pop Indian.pop.txt --out fst.rhesus.demog
