#!/bin/bash
# ----------------SLURM Parameters---------------- 
#SBATCH -p normal 
#SBATCH -n 4 
#SBATCH --mem=16g 
#SBATCH -N 1 
#SBATCH -D/home/a-m/henganl2/Results_re/OTU
#SBATCH --mail-user henganl2@illinois.edu 
#SBATCH --mail-type BEGIN,END,FAIL
# ----------------Load Modules--------------------
module load ITSx/1.1.1-IGB-gcc-4.9.4
# ----------------Commands------------------------
ITSx -i all.q.n.OTU.ID92.remove_s_d.fasta -o ../ITSx_re/all.q.n.OTU.ID92.remove_s_d --graphical -F --positions -F --not_found -F --save_regions ITS1,5.8S,ITS2,LSU -t F -E 1e-5 --cpu 4
