############################################################
# Convert Human gene list to Mouse 1:1 orthologs
############################################################

library(orthogene)

############################################################
# 1. Load human gene list from file
############################################################

input_file_path <- "all_symbols_unique.list"

if (!file.exists(input_file_path)) {
    stop("Error: Gene list file not found: ", input_file_path)
}

mouse_genes <- scan(input_file_path, what = character(), quiet = FALSE)

initial_count <- length(mouse_genes)

cat("========================================\n")
cat("1. Input Data Summary\n")
cat("----------------------------------------\n")
cat("Initial human genes loaded:", initial_count, "\n")
cat("Head of human genes:\n")
print(head(mouse_genes))
cat("========================================\n")

############################################################
# 2. Convert mouse -> human ortholog
############################################################

cat("Starting ortholog conversion using homologene backend...\n")

ortholog_df <- orthogene::convert_orthologs(
    gene_df = mouse_genes,                  
    input_species = "mouse",             
    output_species = "human",             
    method = "homologene",                  
    non121_strategy = "drop_both_species"   
)

ortholog_df$human_gene <- rownames(ortholog_df)
ortholog_df <- ortholog_df[, c("input_gene", "human_gene", setdiff(names(ortholog_df), c("input_gene", "human_gene")))]

final_count <- nrow(ortholog_df)
dropped_count <- initial_count - final_count

############################################################
# 3. Print Detailed Statistics Report
############################################################

cat("\n========================================\n")
cat("2. Ortholog Conversion Statistics Summary\n")
cat("----------------------------------------\n")
cat(sprintf("- Original Human Genes (Input)     : %d\n", initial_count))
cat(sprintf("- Dropped (Non-1:1 or Unmapped)    : %d (%.2f%%)\n", dropped_count, (dropped_count / initial_count) * 100))
cat(sprintf("- Final 1:1 Ortholog Pairs (Output): %d (%.2f%%)\n", final_count, (final_count / initial_count) * 100))
cat("========================================\n")

cat("Head of ortholog mapping result:\n")
print(head(ortholog_df))

############################################################
# 4. Save table
############################################################

output_file <- "human_mouse_ortholog_1to1.csv"
write.csv(
    ortholog_df,
    file = output_file,
    row.names = FALSE
)

cat("Successfully saved to:", output_file, "\n")
cat("Finished!\n")
