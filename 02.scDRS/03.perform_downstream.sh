#!/bin/bash
#SBATCH --job-name=IQ_scDRS_full
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
#SBATCH --time=04:00:00
#SBATCH --output=slurm-%j.out


# ===============================
# Environment
# ===============================

SCDRS=/home/xutianLab/yangxusheng/miniconda3/envs/scDRS/bin/scdrs


$SCDRS --version

scdrs perform-downstream \
    --h5ad-file F1_M2_M3_scDRS_Neighbor.h5ad \
    --score-file IQ_scDRS_result_full/IQ.full_score.gz \
    --out-folder IQ_downstream \
    --group-analysis levelclass \
    --flag-filter-data False \
    --flag-raw-count False
