username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/MachineLearning/Cap02", sep = ""))
getwd()
# windows(width = 15, height = 10)

# Carregar os dados
dataset_bank <- read.table(".arquivos_DSA/bank/bank-full.csv", header = TRUE, sep = ";")
