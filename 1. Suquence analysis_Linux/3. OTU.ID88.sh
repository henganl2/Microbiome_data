#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 4
#SBATCH --mem=32g
#SBATCH -N 1
#SBATCH -D /home/a-m/henganl2/Results_re/pre_OTU
#SBATCH --mail-user henganl2@illinois.edu
#SBATCH --mail-type BEGIN,END,FAIL
# ----------------Load Modules--------------------
module load VSEARCH/2.4.3-IGB-gcc-4.9.4
# ----------------Commands------------------------
vsearch --cluster_size all.preOTU.fasta --relabel OTU --sizein --sizeout --iddef 0 --id 0.88 --minsl 0.9 --consout ../OTU/all.q.n.OTU.ID88.fasta --otutabout ../OTU/all.q.n.ID88.otutab.txt

