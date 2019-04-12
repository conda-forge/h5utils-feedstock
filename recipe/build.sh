#!/bin/bash

if [[ ${mpi} != "nompi" ]]; then
    CC=${PREFIX}/bin/mpicc
    CXX=${PREFIX}/bin/mpicxx
fi

# Default optimization (-O2) works fine in the test, but when the package
# is installed onto Ubuntu 16.04 (GLIBC 2.23) the h5topng program seg faults.
# Disabling optimization fixes it. Could be a compiler bug, but I wasn't able
# to reproduce it in a way that didn't involve conda
./configure CPPFLAGS="${CPPFLAGS} -O0" --prefix="${PREFIX}"
make
make install
