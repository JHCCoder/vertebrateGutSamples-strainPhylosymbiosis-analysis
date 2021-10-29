---------------Some notes on scripting------------------

create a list of directories given a list of dir name in a txt file: 
xargs mkdir < list.txt

Count number of rows: 
cat file | wc -l 

Count number of columns:
awk '{print NF}' file | sort -nu | tail -n 1

List the total number of columns among the rows:
awk '{print NF}' file | sort -nu

IDo some operation to each files specified in a file:
while read -r i; do ls consensus_markers/$i* 1>> stdout_ls.txt 2>>stderr_ls.txt; done < ./samples_e_coli.txt

How to add your metadata to your tree
One of the identifier column has to be named SampleID
The command goes as follows --> 
add_metadata.py -t your_tree.tre -f your_metadata.txt -m your_column_name

How to use quick empress visualization: 
empress tree-plot -t tree.nwk -fm metadata.txt -o outputDir

Strainphlan command:
1. activate conda environment 
2. strainphlan -s consensus_markers_E_coli_mammallianHost/* -m db_markers/s__Escherichia_coli.fna -r reference_genomes_E_coli/* -o output_E_coli_mammalian_default_all_reference/ -c s__Escherichia_coli --phylophlan_mod accurate
