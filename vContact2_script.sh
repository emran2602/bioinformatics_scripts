#!/bin/bash
#SBATCH --account p31737
#SBATCH --partition normal
#SBATCH --nodes=1
#SABTCH --ntasks-per-node=13
#SBATCH -t 8:00:00
#SBATCH --mem=10gb
#SBATCH --mail-user=emranmajidy2025@u.northwestern.edu
#SBATCH --mail-type=All
#SBATCH --output=/projects/p31737/paired_read/vContact_output.out
#SBATCH --error=/projects/p31737/paired_read/vContact_output.er
#SBATCH --job-name="vContact"

module load anaconda3
module load vcontact2

cd /projects/p31737/paired_read/vibes_output


vcontact2 --raw-proteins scaffolds.phages_combined.simple.faa  --proteins-fp VIBRANT_genome2genome.csv --db 'ProkaryoticViralRefSeq94-Merged' --output-dir /projects/p31737/paired_read/vcontact2_output


