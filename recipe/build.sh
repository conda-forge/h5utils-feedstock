#!/bin/bash

if [[ ${mpi} != "nompi" ]]; then
    CC=${PREFIX}/bin/mpicc
    CXX=${PREFIX}/bin/mpicxx
fi

./configure --prefix="${PREFIX}"
make
make install
