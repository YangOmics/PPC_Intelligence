library(EWCE) 

male_female <- read.csv("/storage/xutianLab/yangxusheng/ppc/ppc_data/male_female.csv",header = T, row.names = 1)
annot <- read.csv("/storage/xutianLab/yangxusheng/ppc/ppc_data/male_female_cell.csv",header = T)
l2 <- annot$levelclass

annotLevels <- list(l2 = l2)
fNames_ALLCELLS <- EWCE::generate_celltype_data(
    exp = male_female,
    annotLevels = annotLevels,
    savePath = "/storage/xutianLab/yangxusheng/ppc/ppc_data/",
    groupName = "male_female"
)
