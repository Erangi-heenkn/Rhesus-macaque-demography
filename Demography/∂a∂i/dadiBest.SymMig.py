import dadi
#import pandas as pd
import numpy as np
import argparse

from dadi import Numerics, PhiManip, Integration, Spectrum
parser = argparse.ArgumentParser(description='Information about number of sliding windows and step size')
parser.add_argument('-outFile', dest = 'outFile', action='store', nargs = 1, type = str, help = 'path to output file')
args = parser.parse_args()
#inFile = args.inFile[0]
outFile = args.outFile[0]

def sym_mig_size(params, ns, pts):
    """
    Split with symmetric migration, then size change with symmetric migration.

    nu1a: Size of population 1 after split.
    nu2a: Size of population 2 after split.
    T1: Time in the past of split (in units of 2*Na generations)
    nusym_mig_size1b: Size of population 1 after time interval.
    nu2b: Size of population 2 after time interval.
    T2: Time of population size change.
    m: Migration rate between populations (2*Na*m)
    """
    nu1a, nu2a, nu1b, nu2b, m, T1, T2 = params

    xx = Numerics.default_grid(pts)

    phi = PhiManip.phi_1D(xx)
    phi = PhiManip.phi_1D_to_2D(xx, phi)

    phi = Integration.two_pops(phi, xx, T1, nu1a, nu2a, m12=m, m21=m)

    phi = Integration.two_pops(phi, xx, T2, nu1b, nu2b, m12=m, m21=m)

    fs = Spectrum.from_phi(phi, ns, (xx,xx))
    return fs


# Load the data
data = dadi.Spectrum.from_file('/scratch/eheenken/Rhesus_macaque/preliminary_analyses/sfs/easySFS/output/dadi/pop1-pop2.sfs')
ns = data.sample_sizes
pts_l = [50,60,70]



p0 = [1, 1, 1, 1, 0.01, 0.5, 0.5]
upper_bound = [100, 100, 100, 100, 0.1, 10, 10]
lower_bound = [0.01, 0.01, 0.01, 0.01, 0.001, 0.01, 0.001]
p0 = dadi.Misc.perturb_params(p0, fold=2, upper_bound=upper_bound,
                              lower_bound=lower_bound)

func =sym_mig_size
func_ex = dadi.Numerics.make_extrap_log_func(func)
popt = dadi.Inference.optimize(p0, data, func_ex, pts_l, 
                          lower_bound=lower_bound,
                          upper_bound=upper_bound,
                          verbose=len(p0), maxiter=300)



# Calculate the best-fit model AFS.
model = func_ex(popt, ns, pts_l)
# Likelihood of the data given the model AFS.
ll_model = dadi.Inference.ll_multinom(model, data)
print('Maximum log composite likelihood: {0}'.format(ll_model))
# The optimal value of theta given the model.
theta = dadi.Inference.optimal_sfs_scaling(model, data)
print('Optimal value of theta: {0}'.format(theta))



with open(outFile, "a") as f:
	f.write(str(p0[0]) + "\t" + str(p0[1]) + "\t" + str(p0[2]) + "\t" + str(p0[3]) + "\t" + str(p0[4]) + "\t" + str(p0[5]) + "\t" +str(p0[6]) + "\t"  + str(popt[0]) + "\t" + str(popt[1]) + "\t" + str(popt[2]) + "\t" + str(popt[3]) + "\t" + str(popt[4]) + "\t"  + str(popt[5]) + "\t" + str(popt[6])  + "\t"  +str(theta) + "\t" + str(ll_model) + "\n")
