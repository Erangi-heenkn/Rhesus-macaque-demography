import sys
import pandas as pd
import math
import os
import numpy as np
import msprime
import tskit
import argparse

#parsing user given constants
parser = argparse.ArgumentParser(description='Information about length of region and sample size')
parser.add_argument('-region', dest = 'region', action='store', nargs = 1, type = int, help = 'Region')
parser.add_argument('-num_replicates', dest = 'num_replicates', action='store', nargs = 1, type = int, help = 'Number of replicates')
parser.add_argument('-outPath', dest = 'outPath', action='store', nargs = 1, type = str, help = 'path to output files (suffixes will be added)')

args = parser.parse_args()
region = args.region[0]
num_replicates = args.num_replicates[0]
outPath = args.outPath[0]

chr_lens = { 1:41753676, 2:48761417, 3:43688107, 4:43005059, 5:52258878, 6:47563425, 7:35407775, 8:37683605, 9:31507273, 10:16668489, 11:25766378, 12:32949379, 13:26613310, 14:25869161, 15:25264277, 16:10601794, 17:29059995, 18:20830232, 19:3135291, 20:15401882}

N_anc = 64722.5
N_Ch_Current = 219782.5
N_In_Current = 14091
N_Ch_size = 76024.5
N_In_size = 270071.5
T_split = 139371# generations ago
Ts_Chinese = 71781
Ts_Indian = 8814
mu = 5.8e-9
recomb_rate = 5e-9

def rhesus_sizeM4_1_change(seq_len, num_replicates):
    demography = msprime.Demography()
    demography.add_population(name="Chinese", initial_size=N_Ch_Current)
    demography.add_population(name="Indian", initial_size=N_In_Current)
    demography.add_population(name="Ancestral", initial_size=N_anc)

# add events
    demography.add_population_parameters_change(time=Ts_Chinese, initial_size=N_Ch_size, growth_rate=0, population="Chinese")
    demography.add_population_parameters_change(time=Ts_Indian, initial_size=N_In_size, growth_rate=0, population="Indian")
    demography.set_migration_rate(source="Chinese", dest="Indian", rate=6.63e-06)
    demography.set_migration_rate(source="Indian", dest="Chinese", rate=1.46e-05)
    demography.add_population_split(time=T_split, derived=["Chinese","Indian"], ancestral="Ancestral")
    demography.sort_events()

    ancestry_reps = msprime.sim_ancestry(
        {"Chinese": 10, "Indian": 10},
        demography=demography,
        sequence_length=seq_len,
        recombination_rate=recomb_rate,
        num_replicates=num_replicates
    )

    for ts in ancestry_reps:
        mutated_ts = msprime.sim_mutations(ts, rate=mu)
        yield mutated_ts

ts_list = []
for replicate_index, ts in enumerate(rhesus_sizeM4_1_change(chr_lens[region], num_replicates)):
    ts_list.append(ts)

fst_list = []
for rep, ts in enumerate(ts_list):
    sfs = ts.allele_frequency_spectrum(sample_sets=[[x for x in range(0, 20)], [x for x in range(20, 40)]])
    np.savetxt(outPath + "/chromosome" + str(region) + "_rep" + str(rep) + ".sfs", sfs)
    ts.dump(outPath + "/chromosome" + str(region) + "_rep" + str(rep) + ".ts")
    out = open(outPath + "/chromosome" + str(region) + "_rep" + str(rep) + ".vcf", "w")
    tskit.TreeSequence.write_vcf(ts, out)

    fst = ts.Fst(sample_sets=[
        ts.samples(population=0),
        ts.samples(population=1)
    ])
    fst_list.append(fst)
    print(f"Chromosome {region}, replicate {rep}: Fst = {fst:.4f}")

# Save all FSTs after loop
np.savetxt(outPath + f"/chromosome{region}_FST_per_rep.txt", fst_list)
print(f"Mean Fst across replicates: {np.mean(fst_list):.4f}")
#fst = ts.Fst(sample_sets=[ts.samples(population=0), ts.samples(population=1)])
#print(fst)


#Pi=ts.divergence(sample_sets=[ts.samples(population=0), ts.samples(population=1)])
#print(Pi)

