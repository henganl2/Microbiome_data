#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 1
#SBATCH --mem=1g
#SBATCH -N 1
#SBATCH --array=1-9%1
#SBATCH -D /home/a-m/henganl2/Results_re/blast_from_OTU_ITS
#SBATCH --mail-user henganl2@illinois.edu
#SBATCH --mail-type BEGIN,END,FAIL
# ----------------Commands------------------------
sort -t $'\t' -k1,1 -k14,14nr -k13,13n BC0${SLURM_ARRAY_TASK_ID}.ITS.1e-5.tab | sort -u -k1,1 --merge >BC0${SLURM_ARRAY_TASK_ID}.ITS.1e-5.besthit
awk -F"\t" '{gsub(/.*\|/,"",$2);gsub(/;/,";\t",$2);print $1 "\t" $2}' BC0${SLURM_ARRAY_TASK_ID}.ITS.1e-5.besthit >BC0${SLURM_ARRAY_TASK_ID}.temp.txt
awk '{gsub(/\"|\;/,"\t")}1' BC0${SLURM_ARRAY_TASK_ID}.temp.txt >BC0${SLURM_ARRAY_TASK_ID}.temp2.txt 
awk '!($2="")' BC0${SLURM_ARRAY_TASK_ID}.temp2.txt >BC0${SLURM_ARRAY_TASK_ID}.temp3.txt 
awk '!($2="")' BC0${SLURM_ARRAY_TASK_ID}.temp3.txt >BC0${SLURM_ARRAY_TASK_ID}.temp4.txt
awk '!($2="")' BC0${SLURM_ARRAY_TASK_ID}.temp4.txt >BC0${SLURM_ARRAY_TASK_ID}.temp5.txt 
awk '{gsub("centroid=","")}1' BC0${SLURM_ARRAY_TASK_ID}.temp5.txt >BC0${SLURM_ARRAY_TASK_ID}.temp6.txt 
awk 'function GSUB(F) {gsub(/\__/," ",$F)} {GSUB(2);GSUB(3);GSUB(4);GSUB(5);GSUB(6);GSUB(7)}1' BC0${SLURM_ARRAY_TASK_ID}.temp6.txt >BC0${SLURM_ARRAY_TASK_ID}.temp7.txt 
awk '{sub(/\__/," ",$14)}1' BC0${SLURM_ARRAY_TASK_ID}.temp7.txt >BC0${SLURM_ARRAY_TASK_ID}.temp8.txt 
awk '{$2=$4=$6=$8=$10=$12=$14=" "; print $0}' BC0${SLURM_ARRAY_TASK_ID}.temp8.txt >BC0${SLURM_ARRAY_TASK_ID}.temp9.txt 
awk -F'\t' 'BEGIN{print " " "Domain","Phylum","Class","Order","Family","Genus","Species"}; {print}' BC0${SLURM_ARRAY_TASK_ID}.temp9.txt >../phyloseq_input/BC0${SLURM_ARRAY_TASK_ID}.featuretable.ID88.txt
rm BC0${SLURM_ARRAY_TASK_ID}.temp.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp2.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp3.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp4.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp5.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp6.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp7.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp8.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp9.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp10.txt
