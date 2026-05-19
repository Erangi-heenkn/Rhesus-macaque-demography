################################ Admixture ##########################################
#!/bin/bash
#SBATCH -N 1        	# number of nodes
#SBATCH -c 8        	# number of cores
#SBATCH -t 01-00:00:00   # time in d-hh:mm:ss
#SBATCH -p general  	# partition
#SBATCH -q public   	# QOS
#SBATCH -o slurm.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err # file to save job's STDERR (%j = JobId)
 
 
module load admixture/1.3.0
 
cd /scratch/eheenken/Rhesus_macaque/preliminary_analyses/admix
 
for K in {1..5}; do
 admixture --cv autosomal_GT.demography.accessible.bed $K | tee log${K}.out
done
