

This repository contains the scripts and associated files for to the following manuscript.
 and 
**Inferring the demographic history of Chinese and Indian rhesus macaque (Macaca mulatta) populations from PacBio HiFi long-read sequencing data**

Erangi J. Heenkenda, Cyril J. Versoza, John W. Terbot II, Vivak Soni, Gabriella J. Spatola, Susanne P. Pfeifer, Jeffrey D. Jensen


**Demography**
    
```txt
>>>DADI
this folder contains files used to run ∂a∂i demograpgic inference
- 2D SFS are Optimize_Functions.py, Models_2D.py and dadi_Run_2D_set.py : files to run the Portik pipeline
- PortickPipeline.Results_Summary_Extended.csv and PortickPipeline.Results_short_Extended.csv: results from Portick pipeline
- dadiBest.SymMig.py and best.fit.dadi.sh: Rerun dadi on the bestfit model from Portick pipeline; results in dadi_empirical_parameters.txt
- rhesus.dadi_bestFit_msprime.py:  python script for simulating the best fitting dadi model in msprime
```
