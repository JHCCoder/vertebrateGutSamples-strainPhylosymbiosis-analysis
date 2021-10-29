#!/bin/bash

path_to_file="/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged/metadata_for_conditional_cp.txt"
condition_desired="Actinopterygii"
input_dir="/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged/consensus_markers"
output_dir="/panfs/panfs1.ucsd.edu/panscratch/jhc103/VertMetaphlan-frmerged/consensus_markers_nonMammallianHost"

mkdir -p $output_dir

while read -r line; do
	condition=$(echo $line | awk '{print $3}')
	file=$(echo $line | awk '{print $1}')
	if [ $condition = $condition_desired ]; then
		echo "copying $input_dir/$file* ....."
		cp $input_dir/$file* $output_dir
	fi
done < $path_to_file
