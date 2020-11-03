#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 1
#SBATCH --mem=1g
#SBATCH -N 1
#SBATCH --array=1-9%1
#SBATCH -D /home/a-m/henganl2/Results_re/OTU_ID88_re
#SBATCH --mail-user henganl2@illinois.edu
#SBATCH --mail-type BEGIN,END,FAIL
# ----------------Commands------------------------
awk '{gsub("centroid=","")}1' BC0${SLURM_ARRAY_TASK_ID}.q.n.OTU.ID88.fasta >BC0${SLURM_ARRAY_TASK_ID}.temp.txt 
awk 'BEGIN{RS=">";OFS="";}NR>1{$1=$1;print ">"$1}' BC0${SLURM_ARRAY_TASK_ID}.temp.txt >BC0${SLURM_ARRAY_TASK_ID}.temp1.txt 
awk '{gsub(/\;|\=/," ")}1' BC0${SLURM_ARRAY_TASK_ID}.temp1.txt >BC0${SLURM_ARRAY_TASK_ID}.temp2.txt 
awk '!($2=$3=$4="")' BC0${SLURM_ARRAY_TASK_ID}.temp2.txt >BC0${SLURM_ARRAY_TASK_ID}.temp3.txt 
awk '{gsub(/>/,"")}1' BC0${SLURM_ARRAY_TASK_ID}.temp3.txt >BC0${SLURM_ARRAY_TASK_ID}.temp4.txt
awk 'BEGIN{print " ","BC0${SLURM_ARRAY_TASK_ID}"}; {print}' BC0${SLURM_ARRAY_TASK_ID}.temp4.txt >../phyloseq_input_frequencytable/BC0${SLURM_ARRAY_TASK_ID}.frequencytable.txt
rm BC0${SLURM_ARRAY_TASK_ID}.temp.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp1.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp2.txt 
rm BC0${SLURM_ARRAY_TASK_ID}.temp3.txt
rm BC0${SLURM_ARRAY_TASK_ID}.temp4.txt
