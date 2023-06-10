#!/bin/bash
#SBATCH --account p31737
#SBATCH --partition normal
#SBATCH --nodes=1
#SABTCH --ntasks-per-node=13
#SBATCH -t 8:00:00
#SBATCH --mem=10gb
#SBATCH --mail-user=emranmajidy2025@u.northwestern.edu
#SBATCH --mail-type=All
#SBATCH --output=/projects/p31737/paired_read/quast_output.out
#SBATCH --error=/projects/p31737/paired_read/quast_output.er
#SBATCH --job-name="quast running"

module purge all
module load anaconda3

# using environment with quast installed
source /software/anaconda2/etc/profile.d/conda.sh
conda activate quast


cd /projects/p31737/paired_read
mkdir quast_output
cd spades_output

quast.py --threads 12 scaffolds.fasta -o ../quast_output

conda deactivate
