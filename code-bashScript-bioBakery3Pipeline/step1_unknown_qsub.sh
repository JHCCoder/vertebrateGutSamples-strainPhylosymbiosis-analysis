#PBS -N step1_unknown_running_metaphlan_5_18_2021
#PBS -S /bin/bash
#PBS -m bae
#PBS -M jhc103@ucsd.edu
#PBS -e localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.err
#PBS -o localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.log
#PBS -l nodes=2:ppn=5
#PBS -l mem=10gb
#PBS -l walltime=24:00:00
wd='/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged'
inputd='/projects/vertebrate_assembly/raw-seq/01-r1-r2-combined-after-host-filter'
mkdir -p ${wd}/sams_unknown
mkdir -p ${wd}/bowtie2_unknown
mkdir -p ${wd}/profiles_unknown
cd $wd
source activate mpa3-py37
for f in $inputd/*
do
    echo "Running metaphlan 3.0 on ${f}"
    bn=$(basename ${f%.fastq.gz})
    metaphlan $f --nproc 10 --input_type fastq -s sams_unknown/${bn}.sam.bz2 --bowtie2out bowtie2_unknown/${bn}.bowtie2.bz2 -o profiles_unknown/${bn}_profile.tsv 
done
