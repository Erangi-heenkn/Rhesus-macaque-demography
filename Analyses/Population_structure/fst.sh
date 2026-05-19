##################################### Fst #############################################

ml vcftools 

vcftools --vcf ../../autosomal_GT.demography.accessible.vcf \
--weir-fst-pop Chinese.pop.txt --weir-fst-pop Indian.pop.txt --out fst.rhesus.demog
