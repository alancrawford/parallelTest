#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date

module load sge/2011.11

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe mpich 10  #  <- load the openmpi parallel env w/ $(arg1) slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N mpi-testing # <- name of the job in the qstat output
#$ -o timer.out # direct output stream to here
#$ -e timer.err # <- name of the stderr file.
#$ -wd /data/uctpfos/git/mpitest/julia/sge

echo "calling mpirun now"

/data/uctpfos/git/julia/julia /data/uctpfos/git/mpitest/julia/sge/sge.jl