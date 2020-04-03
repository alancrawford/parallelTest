#$ -l tmem=1G
#$ -l h_vmem=1G
#$ -l h_rt=1:0:0
#$ -S /bin/bash
#$ -j y
#$ -N JuliaTASKStest
#$ -t 1-12
#$ -wd /cluster/project6/AC_git/parallelTest/julia/ucl-peacock/
#$ -e /home/uctpalc/sgelogs/JuliaTASKStest.err
#$ -o /home/uctpalc/sgelogs/JuliaTASKSItest.out

awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > hosts_tasks

echo "calling julia now on:"

cat $PE_HOSTFILE
cat hosts_tasks

/share/apps/econ/acapp/julia-binary/1.1.0/bin/julia --depwarn=no --machine-file hosts_tasks -L ../incl.jl sge.jl > /home/uctpalc/sgelogs/JuliaTASKStest.log

echo "I am done."