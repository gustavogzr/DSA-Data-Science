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

# Dados dos Top 10 shows da Netflix por país
dados_top10 <- read_excel(".arquivos_DSA/datasets_originais/top_10_shows_netflix.xlsx")
View(dados_top10)

# Dados de assinantes da Netflix em Julho de 2021
dados_sub <- read.csv(".arquivos_DSA/datasets_originais/assinantes_netflix_jul_2021.csv")
View(dados_sub)

# Dados de códigos ISO de países
country_code <- read.csv(".arquivos_DSA/datasets_originais/wikipedia-iso-country-codes.csv")
View(country_code)

# Limpeza e preparação dos dados

# Criar coluna com diferença entre plano_standard e plano_basic
dados_netflix$basic_standard_diff <- (dados_netflix$Cost.Per.Month...Standard.... - dados_netflix$Cost.Per.Month...Basic....)

# Criar coluna com diferença entre plano_premium e plano_standard
dados_netflix$standard_premium_diff <- (dados_netflix$Cost.Per.Month...Premium.... - dados_netflix$Cost.Per.Month...Standard....)

# Combinar dados_netflix com dados do PIB
names(dados_pib)[names(dados_pib) == 'V1'] = 'Country' # Renomear coluna V1 para Country
dados_netflix_pib <- merge(dados_netflix, dados_pib, by = "Country")

# Extrair PIB de 2020
dados_netflix_pib2020 <- dados_netflix_pib[-c(11:72, 74, 75)] # Remover colunas desnecessárias
names(dados_netflix_pib2020)[names(dados_netflix_pib2020) == 'V64'] <- '2020 GDP (World Bank)'

