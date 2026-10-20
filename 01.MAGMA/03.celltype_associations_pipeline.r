magma_dirs <- "../../01.map_to_gene/01.IQ/MAGMA_Files/IQ.tsv.10UP.1.5DOWN"
load("CellTypeData_f+m_v3.rda")

res <- MAGMA.Celltyping::celltype_associations_pipeline(
    ctd = ctd,
    ctd_levels = 1,
    ctd_name = "IQ",
    ctd_species = "mouse",
    upstream_kb = 10,
    downstream_kb = 1.5,
    magma_dirs = magma_dirs
)
