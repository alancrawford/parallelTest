#!/bin/bash -l
#$ -S /bin/bash
#$ -l h_rt=1:0:0
#$ -l mem=4G
#$ -l tmpfs=4G
#$ -pe mpi 4
#$ -t 1
#$ -N testfile
#$ -wd /home/uctpalc/Git/parallelTest/julia/ucl-myriad/
#$ -o /home/uctpalc/Scratch/tmpsave/test.out
#$ -e /home/uctpalc/Scratch/tmpsave/test.err
#$ -A Economics

# Load any modules here
module unload compilers
module load compilers/gnu/4.9.2
module load knitro/12.0.0/gnu-4.9.2

awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > hosts

echo "calling julia now on:"

cat $PE_HOSTFILE
cat hosts

/shared/ucl/apps/julia/1.0.0/bin/julia --depwarn=no --machine-file hosts -L ../incl.jl sge.jl > results_test.log

echo "I am done."