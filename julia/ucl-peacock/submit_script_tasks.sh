#!/bin/bash -l
#$ -l tmem=1G
#$ -l h_vmem=1G
#$ -l h_rt=1:0:0
#$ -S /bin/bash
#$ -j y
#$ -N MyTESTJOBNAME
#$ -t 1-12
#$ -e MyTEST_rasks.err
#$ -o MyTEST_rasks.out

awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > hosts

echo "calling julia now on:"

cat $PE_HOSTFILE
cat hosts

julia11 --depwarn=no --machine-file hosts -L ../incl.jl sge.jl > results_test_tasks.log

echo "I am done."