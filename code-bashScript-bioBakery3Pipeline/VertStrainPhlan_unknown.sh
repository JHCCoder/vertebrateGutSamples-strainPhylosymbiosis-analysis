#!/bin/bash
#PBS -N metaphlan20210508-fr 
#PBS -S /bin/bash
#PBS -m bae
#PBS -M jhc103@ucsd.edu
#PBS -e localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.err
#PBS -o localhost:${HOME}/cluster_logs/${PBS_JOBNAME}_${PBS_JOBID}.log
#PBS -l nodes=1:ppn=5
#PBS -l mem=10gb
#PBS -l walltime=48:00:00
wd='/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged'
#inputd='/projects/vertebrate_assembly/05-bowtie-filter-host/EMP500-in-vert-proj/'
inputd='/projects/vertebrate_assembly/raw-seq/01-r1-r2-combined-after-host-filter'
mkdir -p ${wd}/sams_unknown
mkdir -p ${wd}/bowtie2_unknown
mkdir -p ${wd}/profiles_unknown

source activate mpa3-py37

for f in ${inputd}/*
do
    echo "Running metaphlan 3.0 on ${f}"
    bn=$(basename ${f%.fastq.gz})
    metaphlan $f --nproc 5 --input_type fastq --unknown_estimation -s ${wd}/sams_unknown/${bn}.sam.bz2 --bowtie2out ${wd}/bowtie2_unknown/${bn}.bowtie2.bz2 -o ${wd}/profiles_unknown/${bn}_profile.tsv 
done

mkdir -p ${wd}/consensus_markers_unknown
sample2markers.py -i ${wd}/sams_unknown/*.sam.bz2 -o ${wd}/consensus_markers_unknown --nproc 5

#mkdir ${wd}/clade_markers
#mkdir ${wd}/output
#extract_markers.py -c s__Eubacterium_rectale -o ${wd}/clade_markers
#strainphlan -s ${wd}/consensus_markers/*.pkl -m ${wd}/clade_markers/s__Eubacterium_rectale.fna -r ${wd}/reference_genomes/*.fna -o output -n 8 -c s__Eubacterium_rectale --phylophlan_mode fast --nproc 4

echo "finished running......................."
