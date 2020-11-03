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
blastn -query all.q.n.OTU.ID92.remove_s_d.full.fasta -db /home/a-m/henganl2/Unite/UniteBlast -evalue 1e-5 -outfmt 11 -num_threads 4 -out ../Blast_ITS/all.ITS.1e-5.asn1 
blast_formatter -archive ../Blast_ITS/all.ITS.1e-5.asn1 -outfmt '6 qseqid sseqid pident length qlen slen mismatch gapopen qstart qend sstart send evalue bitscore qcovs qcovhsp' -out ../Blast_ITS/all.ITS.1e-5.tab -max_target_seqs 5
sort -t $'\t' -k1,1 -k14,14nr -k13,13n ../Blast_ITS/all.ITS.1e-5.tab | sort -u -k1,1 --merge >all.ITS.1e-5.besthit






## get coverage 
qcovs qcovhsp