

This repository contains the scripts and associated files for the following manuscript.

**Inferring the demographic history of Chinese and Indian rhesus macaque (*Macaca mulatta*) populations from PacBio HiFi long-read sequencing data**

Erangi J. Heenkenda, Cyril J. Versoza, John W. Terbot II, Vivak Soni, Gabriella J. Spatola, Susanne P. Pfeifer, Jeffrey D. Jensen


**Demography**

```txt
>>>MSMC2
This folder contains files used to run MSMC2 demographic inference
- vcf2mulithetsep-v0.04.pl and README-vcf2multihetsep.txt: for input file preparation from Terbot et al.2025
- MSMC2.sh: script to run MSMC2 using the prepared input files from the Perl script
- input.gen.sh: script for running the Perl script that generates MSMC2 input files
- msmc2.run.sh: script to run MSMC2 on the generated input file using the above Perl script
```

```txt
>>>StairwayPlot2
This folder contains files used to run Stairway Plot2 demographic inference
- Chinese_fold.blueprint and Indian_fold.blueprint: input files for the Stairway Plot2
- StairwayPlot.sh: script to run the Stairway Plot2
```

```txt
>>>fastsimcoal2
This folder contains files used to run fastsimcoal2 demographic inference
- estimation_files/: this folder contains .est and .tpl files that detail the models tested and the initial
  parameter ranges used during parameter estimation
- fsc.M4.1.msprime.py: Python script for simulating the best fitting fastsimcoal2 model in msprime
```

```txt
>>>∂a∂i
This folder contains files used to run ∂a∂i demographic inference
- Optimize_Functions.py, Models_2D.py and dadi_Run_2D_set.py: files to run the Portik pipeline
- PortickPipeline.Results_Summary_Extended.csv and PortickPipeline.Results_short_Extended.csv: results from the Portick pipeline
- dadiBest.SymMig.py and best.fit.dadi.sh: Rerun ∂a∂i on the bestfit model from Portick pipeline;
  results in dadi_empirical_parameters.txt
- rhesus.dadi_bestFit_msprime.py: Python script for simulating the best fitting ∂a∂i model in msprime
```

```txt
>>>alternate_mu.rate
This folder contains files used to run fastsimcoal2 demographic inference using the alternative mutation rate of 1.49e-8
- best.fit.fsc.est and best.fit.fsc.tpl: input files using the best fit model from previous fastsimcoal2 runs
- msprime.alt.mu.py: Python script for simulating the best fitting fastsimcoal2 model with alternative muration rate in msprime
```

**Population_structure**
```txt
This folder contains scripts used to run PCA and admixture analyses
```

**Summary_statistics**
```txt
This folder contains example scripts used to generate summary stats (SFS,FSTand LD) from emprirical and simulated data
```
