#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 16
#SBATCH --mem=4g
#SBATCH -N 1
#SBATCH --array=10-96%10
#SBATCH -D /home/a-m/henganl2/Results_re/porechop_re
#SBATCH --mail-user henganl2@illinois.edu
#SBATCH --mail-type BEGIN,END,FAIL
# ----------------Load Modules--------------------
module load FASTX-Toolkit/0.0.14-IGB-gcc-4.9.4
# ----------------Commands------------------------
fastq_to_fasta -i BC${SLURM_ARRAY_TASK_ID}.q.n.fastq -o ../cleanfasta_re/BC${SLURM_ARRAY_TASK_ID}.q.n.fasta -n

