#$ -l tmem=1G
#$ -l h_vmem=1G
#$ -l h_rt=1:0:0
#$ -S /bin/bash
#$ -j y
#$ -N JuliaTASKStest
#$ -t 1-12
#$ -e JuliaTASKStest.err
#$ -o JuliaTASKStest.out

#awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > hosts_tasks

echo "calling julia now on:"

cat $PE_HOSTFILE
#cat hosts_tasks

/share/apps/econ/acapp/julia-binary/1.1.0/bin/julia --depwarn=no --machine-file $PE_HOSTFILE -L ../incl.jl sge.jl > JuliaTASKStest.log

echo "I am done."