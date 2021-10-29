#PBS -N step1_running_metaphlan_13881_TZ_7182021
#PBS -S /bin/bash
#PBS -m bae
#PBS -M jhc103@ucsd.edu
#PBS -e localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.err
#PBS -o localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.log
#PBS -l nodes=1:ppn=16
#PBS -l mem=32gb
#PBS -l walltime=32:00:00
###
# Resource utilization: To run metaphlan on five samples we used 1 hr of wall time, 7 gb of vmem and 3 gb of mem. So to process one samples required around 12 mins. 
###

wd='/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged'
inputd='/projects/vertebrate_assembly/raw-seq/03-combine-samples/study13881'
# Set the range to run metaphlan Ustart="C"
start="T"
stop="Z"

mkdir -p ${wd}/sams
mkdir -p ${wd}/bowtie2
mkdir -p ${wd}/profiles
cd $wd
source activate mpa3-py37
for f in $(eval echo $inputd/{$start..$stop}*.gz)
do
    echo "Running metaphlan 3.0 on ${f}"
    bn=$(basename ${f%.fastq.gz})
    metaphlan $f --nproc 16 --input_type fastq -s ${wd}/sams/${bn}.sam.bz2 --bowtie2out ${wd}/bowtie2/${bn}.bowtie2.bz2 -o ${wd}/profiles/${bn}_profile.tsv 
done
