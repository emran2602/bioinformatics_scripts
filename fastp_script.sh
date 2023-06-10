#!/bin/bash
#SBATCH --account p31737
#SBATCH --partition short
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=4:00:00
#SBATCH --mem-per-cpu=10gb
#SBATCH --job-name="FastP"

module purge all
module load anaconda3

source /software/anaconda2/etc/profile.d/conda.sh
conda activate paired_read


fastp -i NTM0014_S55_R1.fastq.gz -I NTM00014_S55_R2_001.fastq.gz -o second_out.R1.fq.gz -O second_out.R2.fq.gz --detect_adapter_for_pe --thread 16 --length_required 50

conda deactivate

