#!/bin/bash
# ----------------SLURM Parameters----------------
#SBATCH -p normal
#SBATCH -n 4
#SBATCH --mem=16g
#SBATCH -N 1
#SBATCH --array=1-9
#SBATCH -D /home/a-m/henganl2/Rawfasq_re
# ----------------Load Modules--------------------
module load Biopython/1.68-IGB-gcc-4.9.4-Python-3.6.1
module load Porechop/0.2.3-IGB-gcc-4.9.4-Python-3.6.1
module load nanopack/1.0.0-IGB-gcc-4.9.4-Python-3.6.1
# ----------------Commands------------------------
porechop --discard_middle -i BC0${SLURM_ARRAY_TASK_ID}.fastq --threads 8 2> ../Results_re/porechop_re/BC0${SLURM_ARRAY_TASK_ID}.porechop.log | NanoFilt -l 250 --maxlength 2000 > ../Results_re/porechop_re/BC0${SLURM_ARRAY_TASK_ID}.q.n.fastq
