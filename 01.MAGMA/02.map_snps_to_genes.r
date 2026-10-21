library(MAGMA.Celltyping)

path_formatted <- "./IQ.tsv"

gene_loc <- "/storage/xutianLab/yangxusheng/PPC/2026_review/01.MAGMA_Celltyping/01.map_to_gene/00.reference/NCBI37.3.gene.loc.MAGMA_Celltyping"

tmp <- tempdir()

file.copy(
    gene_loc,
    file.path(tmp, "NCBI37.3.gene.loc"),
    overwrite = TRUE
)

print(file.exists(file.path(tmp, "NCBI37.3.gene.loc")))

print(tools::md5sum(gene_loc))
print(tools::md5sum(file.path(tmp, "NCBI37.3.gene.loc")))

genesOutPath <- MAGMA.Celltyping::map_snps_to_genes(
    path_formatted = path_formatted,
    genome_build = "GRCh37",
    upstream_kb = 10,
    downstream_kb = 1.5,
    genome_ref_path = "/storage/xutianLab/yangxusheng/PPC/2026_review/01.MAGMA_Celltyping/01.map_to_gene/00.reference/g1000_eur",
    N = 269867
)
