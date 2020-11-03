#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 16
#SBATCH --mem=4g
#SBATCH -N 1
#SBATCH --array=10-96%10
#SBATCH -D /home/a-m/henganl2/Rawfasq_re
#SBATCH --mail-user henganl2@illinois.edu
#SBATCH --mail-type BEGIN,END,FAIL
# ----------------Load Modules--------------------
module load Biopython/1.68-IGB-gcc-4.9.4-Python-3.6.1
module load Porechop/0.2.3-IGB-gcc-4.9.4-Python-3.6.1
module load nanopack/1.0.0-IGB-gcc-4.9.4-Python-3.6.1
# ----------------Commands------------------------
porechop --discard_middle -i BC${SLURM_ARRAY_TASK_ID}.fastq --threads 16 2> ../Results_re/porechop_re/BC${SLURM_ARRAY_TASK_ID}.porechop.log | NanoFilt -l 250 --maxlength 2000 > ../Results_re/porechop_re/BC${SLURM_ARRAY_TASK_ID}.q.n.fastq

