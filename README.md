

This repository contains the scripts and associated files for to the following manuscript.
 and 
**Inferring the demographic history of Chinese and Indian rhesus macaque (Macaca mulatta) populations from PacBio HiFi long-read sequencing data**

Erangi J. Heenkenda, Cyril J. Versoza, John W. Terbot II, Vivak Soni, Gabriella J. Spatola, Susanne P. Pfeifer, Jeffrey D. Jensen


**Demography**
    
```txt
>>>DADI
this folder contains files used to run dadi inference
- File to run the Portik pipeline on 2D SFS are Optimize_Functions.py, Models_2D.py and dadi_Run_2D_set.py
- Results from Portick pipeline files are PortickPipeline.Results_Summary_Extended.csv and PortickPipeline.Results_short_Extended.csv
- Rerun dadi on the bestfit model from Portick pipeline: scripts to run are dadiBest.SymMig.py and best.fit.dadi.sh; results in dadi_empirical_parameters.txt
