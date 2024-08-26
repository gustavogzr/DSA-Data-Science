username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/BigDataAnalyticscomReMicrosoftAzureMachineLearning/Cap04", sep = ""))
getwd()
# windows(width = 15, height = 10)]

# Carregar pacotes
library(dplyr) # Manipulação de dados
library(tidyr) # Manipulação de dados
library(readxl) # Leitura de arquivos excel
library(readr) # Leitura de arquivos

# Carregar dados

# Dados da Netflix
dados_netflix <- read.csv(".arquivos_DSA/datasets_originais/dados_netflix_Dec_2021.csv")
View(dados_netflix)

# Dados do World Bank
dados_pib <- read.csv(".arquivos_DSA/datasets_originais/dados_world_bank.csv",
header = FALSE) # Não tem cabeçalho
View(dados_pib)

# Dados de Desigualdade Salarial
dados_salario <- read.csv(".arquivos_DSA/datasets_originais/dados_desigualdade_salarial_harvard.csv")
View(dados_salario)

# Dados do IMDB (Internet Movie Database)
dados_IMDB <- read_tsv(".arquivos_DSA/datasets_originais/dados_IMDB.tsv")
View(dados_IMDB)
