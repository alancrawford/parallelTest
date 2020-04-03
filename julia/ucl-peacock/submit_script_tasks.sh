source ~/.bash_profile

#$ -l tmem=1G
#$ -l h_vmem=1G
#$ -l h_rt=1:0:0
#$ -S /bin/bash
#$ -j y
#$ -wd ~/sgelogs
#$ -N JuliaTASKStest
#$ -t 1-12
#$ -e JuliaTASKStest.err
#$ -o JuliaTASKStest.out

awk '{ for (i=0; i < $2; ++i) { print $1} }' $PE_HOSTFILE > hosts_tasks

echo "calling julia now on:"

cat $PE_HOSTFILE
cat hosts_tasks

julia11 --depwarn=no --machine-file hosts_tasks -L ../incl.jl sge.jl > JuliaTASKStest.log

echo "I am done."