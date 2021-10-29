#PBS -N step2_loop_13114_missingSamples_1_07202021
#PBS -S /bin/bash
#PBS -m bae
#PBS -M jhc103@ucsd.edu
#PBS -e localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.err
#PBS -o localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.log
#PBS -l nodes=1:ppn=16
#PBS -l mem=64gb
#PBS -l walltime=48:00:00
###
# Resource utilization: It took 6 minutes to process 5 samples with each samples about 9-10 mb large. We can expect about 1 min/samples processing time. 
###
wd='/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged'
pathFile='/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged/paths_for_step2_missingSamples_13114_1.txt'
cd $wd
source activate mpa3-py37

mkdir -p ${wd}/consensus_markers
while read -r file; do
  sample2markers.py -i $file -o ${wd}/consensus_markers --nproc 16
done < $pathFile
