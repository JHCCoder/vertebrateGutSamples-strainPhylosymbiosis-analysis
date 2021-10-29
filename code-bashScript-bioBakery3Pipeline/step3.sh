#!/bin/bash

# Run this script within the conda environment mpa3-py37
mkdir -p db_markers
extract_markers.py -c s__Pseudomonas_yamanorum -o db_markers
extract_markers.py -c s__Escherichia_coli -o db_markers
extract_markers.py -c s__Clostridium_perfringens -o db_markers
extract_markers.py -c s__Bacteroides_fragilis -o db_markers
extract_markers.py -c s__Ruthernibacterium_lactatiformans -o db_markers
extract_markers.py -c s__Bacteroides_uniformis -o db_markers
extract_markers.py -c s__Bacteroides_vulgatus -o db_markers
extract_markers.py -c s__Enterococcus_faecalis -o db_markers
extract_markers.py -c s__Bacteroides_thetaitaomicron -o db_markers
extract_markers.py -c s__Desulfovibrio_piger -o db_markers
