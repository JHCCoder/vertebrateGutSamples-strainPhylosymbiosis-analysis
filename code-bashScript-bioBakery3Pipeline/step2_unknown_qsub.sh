#PBS -N step2_running_sample2markers_unknown_5_20_2021
#PBS -S /bin/bash
#PBS -m bae
#PBS -M jhc103@ucsd.edu
#PBS -e localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.err
#PBS -o localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.log
#PBS -l nodes=2:ppn=5
#PBS -l mem=15gb
#PBS -l walltime=48:00:00
wd='/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged'
cd $wd
source activate mpa3-py37

mkdir -p ${wd}/consensus_markers
sample2markers.py -i ${wd}/sams_unknown/*.sam.bz2 -o ${wd}/consensus_markers_unknown --nproc 10


