#!/bin/bash
#SBATCH --account p31737
#SBATCH --partition normal
#SBATCH --nodes=1
#SABTCH --ntasks-per-node=13
#SBATCH -t 8:00:00
#SBATCH --mem=10gb
#SBATCH --mail-user=emranmajidy2025@u.northwestern.edu
#SBATCH --mail-type=All
#SBATCH --output=/projects/p31737/paired_read/vibe_output.out
#SBATCH --error=/projects/p31737/paired_read/vibe_output.er
#SBATCH --job-name="vibes"

module purge all
module load anaconda3
module load prodigal
module load hmmer 

source activate /projects/p31750/conda_envs/vibrant
cd /projects/p31737/paired_read
mkdir vibes_output
# get the input file
cd spades_output

# dont run python3 when envrionment is already activated
# If error runs saying VIBRANT error: could not identify KEGG HMM files in database directory. Please run VIBRANT_setup.py
# Add the -d argument specifying where the database is
VIBRANT_run.py -i scaffolds.fasta -folder ../vibes_output -d /projects/p31750/conda_envs/path/to/store/databases/databases

source deactivate ~/projects/p31750/conda_envs/vibrant
