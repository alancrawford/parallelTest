#$ -l tmem=1G
#$ -l h_vmem=1G
#$ -l h_rt=1:0:0
#$ -S /bin/bash
#$ -j y
#$ -N JuliaMPItest
#$ -pe mpi 12
#$ -e JuliaMPItest.err
#$ -o JuliaMPItest.out

awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > hosts

echo "calling julia now on:"

cat $PE_HOSTFILE
cat hosts

/share/apps/econ/acapp/julia-binary/1.1.0/bin/julia --depwarn=no --machine-file hosts -L ../incl.jl sge.jl > JuliaMPItest.log

echo "I am done."