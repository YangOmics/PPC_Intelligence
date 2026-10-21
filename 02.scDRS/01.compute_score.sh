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


# ===============================
# Input
# ===============================

H5AD=F1_M2_M3_scDRS.h5ad

GS=IQ.gs


# ===============================
# Output
# ===============================

OUT=IQ_scDRS_result_full

mkdir -p ${OUT}


# ===============================
# Compute scDRS score
# ===============================

$SCDRS compute-score \
    --h5ad-file ${H5AD} \
    --h5ad-species mouse \
    --gs-file ${GS} \
    --gs-species mouse \
    --out-folder ${OUT} \
    --flag-filter-data False \
    --flag-raw-count False \
    --n-ctrl 1000 \
    --flag-return-ctrl-raw-score True \
    --flag-return-ctrl-norm-score True


echo "DONE"
