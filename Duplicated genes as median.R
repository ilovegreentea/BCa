library(dplyr)
library(Seurat)
for (df_name in df_list) {
  df <- get(df_name)
  print('aggregating')
#Name = gene symbol, including duplicated genes
  med <- aggregate(.~Name,df[duplicated(df$Name),],median)
  df <- filter(df, !(Name %in%  med$Name ))
  df <- rbind(df,med)
  rownames(df) <- df[,"Name"]
#remove ENSENBL and symbols, should be edit by data
  df <- df[,-1:-2]
  print('creating seurat object')
  seurat <- CreateSeuratObject(as.matrix(df),meta.data = NULL)
  print('saving seurat object as rds')
  saveRDS(seurat, paste0(df_name,'.rds'))
}

