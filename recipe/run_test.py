import os
import subprocess
import h5py
import numpy as np

fn = 'test.h5'
png = 'test.png'

with h5py.File(fn, 'w') as f:
    f['test'] = np.zeros(5)

# Use an explicit path to the colormap to avoid possible invalid colormap error
cm = os.path.join(os.environ.get('PREFIX'), 'share/h5utils/colormaps/gray')

subprocess.check_call('h5topng -v -c {} test.h5'.format(cm), shell=True)

assert os.path.exists(os.path.join('.', png))
