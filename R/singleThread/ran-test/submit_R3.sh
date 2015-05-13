#!/bin/bash

echo "starting qsub script file"
source ~/.bash_profile
date 

# here's the SGE directives
# ------------------------------------------
#$ -q batch.q   # <- the name of the Q you want to submit to
#$ -pe openmpi 4  #  <- load the openmpi parallel env w/ 6 slots
#$ -S /bin/bash   # <- run the job under bash
#$ -N exp-test # <- name of the job in the qstat output
#$ -o exp.out # <- name of the output file.
#$ -j y
#$ -cwd

echo "loaded modules"
module load sge/2011.11
module load openmpi/gcc/64/1.4.5
module load r/3.1.3
module list

echo "Got $NSLOTS slots"
echo "jobid $JOB_ID"

echo "LD_LIBRARY_PATH"
echo $LD_LIBRARY_PATH

echo "your hostfile:"
cat $PE_HOSTFILE

echo "calling mpirun now"
mpirun -np $NSLOTS ~/R/x86_64-unknown-linux-gnu-library/3.1/snow/RMPISNOW --no-save -q < exp.r > exp.Rout


