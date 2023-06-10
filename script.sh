#!/bin/bash
#SBATCH --account p31737
#SBATCH --partition short
#SBATCH --nodes=1
#SABTCH --ntasks-per-node=12
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name="paired_read up to assembly"

mkdir trial4
cd trial4

module purge all
module load anaconda3
module load fastqc
module load multiqc
module load spades


source /software/anaconda2/etc/profile.d/conda.sh
conda activate paired_read
fastp -i ../NTM00014_S55_R1_001.fastq.gz -I ../NTM00014_S55_R2_001.fastq.gz -o second_out.R1.fq.gz -O second_out.R2.fq.gz --detect_adapter_for_pe --thread 16 --length_required 50

mkdir fastqc
mv second_out.R1.fq.gz second_out.R2.fq.gz fastqc
cd fastqc

fastqc -t 10 *fq.gz 
multiqc .


mkdir spades_second_time

spades.py -1 second_out.R1.fq.gz  -2 second_out.R2.fq.gz -o spades_second_time  -t 40 -m 100

mv spades_second_time ../../


