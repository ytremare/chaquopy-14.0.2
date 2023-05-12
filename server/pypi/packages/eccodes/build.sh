#!/bin/bash
set -eu
ls -lrt
echo "====================================================================="
echo "====================================================================="
echo "=============§§§§§§§§§§§ $PREFIX §§§§§§§§§§§§§§§§§§§§§§============="
echo "====================================================================="
pwd
ECCODES_SRCDIR=$(pwd)
echo $ECCODES_SRCDIR
rm -f CMakeCache.txt  # For rerunning with build-wheel.py --no-unpack.
cd ../../
echo "=================?????????????????????????????======================="
echo "====================================================================="

ls -lrt 
#mkdir -p ecbuild
#cd ecbuild
pwd                  
echo "======================================================================================================="
echo "=================================           Start cmake                        ========================"
echo "=======================================================================================================" 
#cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON  
cmake /$ECCODES_SRCDIR -C /home/ytrem/miniconda3/chaquopy-tremare_eccodes/server/pypi/packages/eccodes/TryRunResults.cmake -DDISABLE_OS_CHECK=ON -DENABLE_AEC=OFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DENABLE_FORTRAN=OFF -DCOMPILE_TESTS=NO -DCMAKE_INSTALL_PREFIX=install-eccodes 
echo "======================================================================================================="
echo "======================================================================================================="
echo "=====================      cmake ends      ignore  ctest    ==========================================="
echo "======================================================================================================="
echo "======================================================================================================="
#ctest
#make | grep  'grib_accessor_class_data_sh_packed'

make -j $(nproc) 
echo "=====================      Fin Installation ECCODES      ================================"
make install
