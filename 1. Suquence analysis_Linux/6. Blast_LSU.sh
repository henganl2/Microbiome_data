#!/bin/bash
# ----------------SLURM Parameters---------------- 
#SBATCH -p normal 
#SBATCH -n 4 
#SBATCH --mem=16g 
#SBATCH -N 1 
#SBATCH -D/home/a-m/henganl2/Results_re/ITSx_re 
#SBATCH --mail-user henganl2@illinois.edu 
#SBATCH --mail-type BEGIN,END,FAIL
# ----------------Load Modules--------------------
module load BLAST+/2.9.0-IGB-gcc-4.9.4
# ----------------Commands------------------------
blastn -query all.q.n.OTU.ID92.remove_s_d.LSU.fasta -db /home/a-m/henganl2/RDP/RDP_Blast -evalue 1e-5 -outfmt 11 -num_threads 4 -out ../Blast_LSU/all.LSU.1e-5.asn1 
blast_formatter -archive ../Blast_LSU/all.LSU.1e-5.asn1 -outfmt '6 qseqid sseqid pident length qlen slen mismatch gapopen qstart qend sstart send evalue bitscore' -out ../Blast_LSU/all.LSU.1e-5.tab -max_target_seqs 5

