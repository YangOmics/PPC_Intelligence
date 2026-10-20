library(MAGMA.Celltyping)

path_formatted <- "./IQ.tsv"

# 明确指定你自己的 GRCh37 gene location 文件
gene_loc <- "/storage/xutianLab/yangxusheng/PPC/2026_review/01.MAGMA_Celltyping/01.map_to_gene/00.reference/NCBI37.3.gene.loc.MAGMA_Celltyping"

# 当前 R 临时目录
tmp <- tempdir()

# 关键：必须复制成 MAGMA.Celltyping 期望的文件名
file.copy(
    gene_loc,
    file.path(tmp, "NCBI37.3.gene.loc"),
    overwrite = TRUE
)

# 检查复制是否成功
print(file.exists(file.path(tmp, "NCBI37.3.gene.loc")))

# 检查 MD5
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
