sbatch -n 10 -p htc -c 1 -N 1 -q public -t 4:00:00 \ 
--job-name PCA_demographic \ 
-o /scratch/Rhesus_macaque/pca/slurm.%j.out \ 
-e /scratch/Rhesus_macaque/pca/slurm.%j.err \
--wrap "module load mamba/latest; module load plink/1.9.0; \ 
plink --vcf /scratch/Rhesus_macaque/autosomal_GT.demography.accessible.vcf* \ 
--make-bed \
--out /scratch/Rhesus_macaque/autosomal_GT.demography.accessible" 

# PCA: 
Plink --bfile autosomal_GT.demography.accessible --out pca_demographic --pca 20
