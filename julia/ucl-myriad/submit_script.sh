#!/bin/bash -l

echo "starting qsub script file"
source ~/.bash_profile
date

# Load any modules here
module unload compilers
module load compilers/gnu/4.9.2
module load knitro/12.0.0/gnu-4.9.2

# here's the SGE directives
# ------------------------------------------
#$ -pe mpi 4
#$ -N JuliaInParallel_Test 	# <- name of the job in the qstat output
#$ -o timer.out 			# direct output stream to here
#$ -e timer.err 			# <- name of the stderr file.
#$ -cwd  					# <- write to current working directory

echo "calling julia now:"

julia10 --depwarn=no --machinefile $PE_HOSTFILE -L ../incl.jl sge.jl > results_test.log



# https://www.rc.ucl.ac.uk/docs/Example_Jobscripts/

# #!/bin/bash -l

# Batch script to run a serial array job under SGE.

# Request ten minutes of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=0:10:0

# Request 1 gigabyte of RAM (must be an integer followed by M, G, or T)
# #$ -l mem=1G

# Request 15 gigabyte of TMPDIR space (default is 10 GB)
# #$ -l tmpfs=15G

# Set up the job array.  In this instance we have requested 10000 tasks
# numbered 1 to 10000.
# #$ -t 1-10000

# Set the name of the job.
# #$ -N MyArrayJob

# Set the working directory to somewhere in your scratch space. 
# Replace "<your_UCL_id>" with your UCL user ID :)
# #$ -wd /home/<your_UCL_id>/Scratch/output

# Run the application.

# echo "$JOB_NAME $SGE_TASK_ID"


