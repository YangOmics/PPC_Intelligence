import scanpy as sc

adata = sc.read_h5ad("F1_M2_M3_scDRS.h5ad")

sc.pp.neighbors(adata, n_neighbors=15, n_pcs=20)

adata.write("F1_M2_M3_scDRS_Neighbor.h5ad")
