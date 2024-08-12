#Xenium Explorer annotation with differential_expression.csv file

#Figure Top30 Genes using Log2FC value
DEG_selection <- function(df){
  df_df <- df[,c('Feature.Name',colnames(df)[grepl('Log2',colnames(df))])] 
DEGs <- c()
for( i in 1:c(length(colnames(df_df))-1)) {
 DEGs  <- c(DEGs, df_df %>% arrange(desc(df_df[,colnames(df_df)[i]])) %>% head(n = 30) %>% select(Feature.Name))
 
}
DEGs <- data.frame(DEGs)
colnames(DEGs) <- paste0("C", 1:length(colnames(DEGs)))
return(DEGs) 
}
