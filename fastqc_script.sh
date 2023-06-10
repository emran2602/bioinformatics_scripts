#!/bin/bash
#SBATCH --account p31737
#SBATCH --partition short
#SBATCH --nodes=1
#SABTCH --ntasks-per-node=12
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name=" fastqc check script"

module purge all
module load anaconda
module load fastqc
module load multiqc

fastqc -t 10 *fq.gz
