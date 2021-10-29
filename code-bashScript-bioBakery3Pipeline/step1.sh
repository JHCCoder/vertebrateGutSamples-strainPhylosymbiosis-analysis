#!/bin/bash
mkdir -p sams
mkdir -p bowtie2
mkdir -p profiles
for f in reads-petromyzon/*
do
    echo "Running metaphlan 3.0 on ${f}"
    bn=$(basename ${f%.fastq.gz})
    metaphlan $f --input_type fastq -s sams/${bn}.sam.bz2 --bowtie2out bowtie2/${bn}.bowtie2.bz2 -o profiles/${bn}_profile.tsv 
done
