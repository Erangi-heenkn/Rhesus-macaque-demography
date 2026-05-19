

This repository contains the scripts and associated files for to the following manuscript.

**Inferring the demographic history of Chinese and Indian rhesus macaque (Macaca mulatta) populations from PacBio HiFi long-read sequencing data**

Erangi J. Heenkenda, Cyril J. Versoza, John W. Terbot II, Vivak Soni, Gabriella J. Spatola, Susanne P. Pfeifer, Jeffrey D. Jensen


**Demography**

```txt
>>>MSMC2
this folder contains files used to run MSMC2 demograpgic inference
- vcf2mulithetsep-v0.04.pl and README-vcf2multihetsep.txt: for input file preparation from Terbot et al.2025
- MSMC2.sh - script to run MSMC2 using the preared input files from perl script
```

```txt
>>>StairwayPlot2
this folder contains files used to run Stairway Plot2 demograpgic inference
-Chinese_fold.blueprint and Indian_fold.blueprint:
- StairwayPlot.sh -script to run the analysis
```

```txt
>>>fastsimcoal2
this folder contains files used to run fastsimcoal2 demograpgic inference
- estimation_files/: this folder contains .est and .tpl files detailing the models tested and the initial parameter ranges during parameter estimation
-
-
-
```

```txt
>>>DADI
this folder contains files used to run ∂a∂i demograpgic inference
- 2D SFS are Optimize_Functions.py, Models_2D.py and dadi_Run_2D_set.py : files to run the Portik pipeline
- PortickPipeline.Results_Summary_Extended.csv and PortickPipeline.Results_short_Extended.csv: results from Portick pipeline
- dadiBest.SymMig.py and best.fit.dadi.sh: Rerun dadi on the bestfit model from Portick pipeline; results in dadi_empirical_parameters.txt
- rhesus.dadi_bestFit_msprime.py:  python script for simulating the best fitting dadi model in msprime
```

```txt
>>>alternate_mu.rate
this folder contains files used to run fastsimcoal2 demograpgic inference using the alternative mutation rate of 1.49e-8
-
-
-
```

**Population_structure**
```txt
this folder contains scripts used to run PCA and admixture analyses
```

**summary_statistics**
```txt
this folder contains example scripts used to generate summary stats (SFS,FSTand LD) from emprirical and simulated data
```
