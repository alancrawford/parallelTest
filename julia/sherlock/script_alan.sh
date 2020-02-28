#!/bin/bash 

echo "starting qsub script file"
source ~/.bashrc
date

# here's the SGE directives
# ------------------------------------------
#$ -q main.q 			# <- Name of the Queue
#$ -pe impi_tight 16 	# <- Parallel Environment - impi is the other option q -spl 
#$ -S /bin/bash   		# <- run the job under bash
#$ -V  
#$ -N ParaJulia_Test 	# <- name of the job in the qstat output
#$ -o timer.out 		# direct output stream to here
#$ -e timer.err 		# <- name of the stderr file.
#$ -cwd  				# <- write to current working directory

echo "here are your hosts"

cat $PE_HOSTFILE

echo "calling julia now:"

julia --machinefile $PE_HOSTFILE -L ../incl.jl sge.jl > results_test.log
