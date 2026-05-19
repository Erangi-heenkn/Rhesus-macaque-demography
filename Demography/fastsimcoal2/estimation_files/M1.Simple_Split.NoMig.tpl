//Parameters for the coalescence simulation program : fsimcoal2.exe
2 samples to simulate :
//Population effective sizes (number of genes)
NCHCUR$
NINCUR$
//Samples sizes and samples age
20
20
//Growth rates  : negative growth implies population expansion
0
0
//Number of migration matrices : 0 implies no migration between demes
0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
2  historical event
TDIV$ 1 0 1 NANC$ 0 0 absoluteResize //Both subpopulations are merged in pop0 (China)
TDIV$ 1 1 0 0 0 0 //Indian population is killed
//Number of independent loci [chromosome]
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per generation recombination and mutation rates and optional parameters
FREQ  1   5e-9   5.8e-9  OUTEXP
