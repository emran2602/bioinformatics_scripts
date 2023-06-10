#!/bin/bash
#SBATCH --account p31737
#SBATCH --partition normal
#SBATCH --nodes=1
#SABTCH --ntasks-per-node=1
#SBATCH -t 8:00:00
#SBATCH --mem=0
#SBATCH --mail-user=emranmajidy2025@u.northwestern.edu
#SBATCH --mail-type=All
#SBATCH --output=/projects/p31737/paired_read/spades_output.out
#SBATCH --error=/projects/p31737/paired_read/spades_output.er
#SBATCH --job-name="spades module"

module purge all
module load anaconda3
module load fastqc
module load multiqc
module load spades

source /software/anaconda2/etc/profile.d/conda.sh

mkdir spades_output_second
spades.py -1 second_out.R1.fq.gz -2 second_out.R2.fq.gz -o spades_output -t 40 -m 100 --meta

 
