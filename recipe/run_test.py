import os
import subprocess
import h5py
import numpy as np

fn = 'test.h5'
png = 'test.png'

with h5py.File(fn, 'w') as f:
    f['test'] = np.zeros(5)

subprocess.check_call('h5topng -v test.h5', shell=True)

assert os.path.exists(os.path.join('.', png))
