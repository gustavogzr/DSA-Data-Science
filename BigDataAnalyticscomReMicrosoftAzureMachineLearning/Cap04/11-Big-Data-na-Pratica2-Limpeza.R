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
# View(dados_IMDB) - muito pesado!

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

# Limpeza do dataframe de designualdade salarial
dados_salario <- dados_salario[,c(1:3)] # Selecionar colunas relevantes
dados_salario_ano <- dados_salario %>% # 
  group_by(country) %>% # Agrupar por país
  summarise(max = max(year, na.rm = TRUE)) # Obter o ano mais recente

# Combinar os dataframes
dados_salario <- merge(dados_salario, dados_salario_ano,
by.x = c("country", "year"), by.y = c("country", "max"))

dados_netflix_pib2020 <- merge(
    dados_netflix_pib2020,
    dados_salario,
    by.x = c("Country"),
    by.y = c("country"))

# Limpar o dataset de faturamento e combinar com o dataframe anterior
dados_sub <- dados_sub[,c(1,23,24)] # Selecionar colunas relevantes
complete <- merge(
    dados_netflix_pib2020,
    dados_sub,
    by = c("Country"))

# Merge com country_code
country_code <- country_code[,c(1,3)] # Selecionar colunas relevantes
complete <- merge(
    complete,
    country_code,
    by.x = c("Country"),
    by.y = c("English.short.name.lower.case"))

# Gravar o dataset completo
write.csv(complete, file = ".arquivos_DSA/datasets_limpos/dataset1.csv", row.names = FALSE)
# row.names = FALSE para não gravar o índice

##### Limpeza de dados do IMDB #####

genero <- dados_IMDB[,-c(1, 4:8)] # Selecionar colunas relevantes
names(genero)[names(genero) == 'primaryTitle'] <- 'show_title' # Renomear coluna

# Associar o gênero aos TOP 10 shows da Netflix
topgenero <- merge(
    dados_top10,
    genero,
    by = "show_title")

# Filtrar o dataframe para manter apenas 1 entrada para cada top 10
topgenero <- topgenero[
    (topgenero$category == "Films" & topgenero$titleType == "movie") |
    (topgenero$category == "TV" & topgenero$titleType == "tvSeries"),]
topgenero <- distinct( # Remover duplicatas
    topgenero, # Dataframe
    show_title, # Coluna para remover duplicatas
    week, # Coluna para remover duplicatas
    country_name, # Coluna para remover duplicatas
    category, # Coluna para remover duplicatas
    titleType, # Coluna para remover duplicatas
    cumulative_weeks_in_top_10, # Coluna para remover duplicatas
    .keep_all = TRUE) # Manter todas as colunas

# Manter apenas a informação de gênero por país
topgenerospaises <- topgenero[,-c(1,3:9)]

# Pivot do dataframe
topgenerospaises <- separate(
    topgenerospaises, # Dataframe
    genres, # Coluna a ser separada
    c("genre1", "genre2", "genre3"), # nome das novas colunas
    sep = ",") # Separador

topgenerospaises <- pivot_longer( # Transformar o dataframe de wide para long
    topgenerospaises, # Dataframe
    cols = c("genre1", "genre2", "genre3"), # Colunas a serem transformadas
    names_to = "genero123", # Nome da nova coluna
    values_to = "genres") # Nome da nova coluna

# Contar o número de gêneros
generocounty <- count(
    topgenerospaises, # Dataframe
    country_name, # Coluna para contar
    genres) # Coluna para contar
generocounty <- na.omit(generocounty) # Remover NA
generocounty <- subset( # Remover linhas com valores nulos
    generocounty, # Dataframe
    genres !=  "\\N") # Valor nulo
generocounty$n <- as.numeric(generocounty$n) # Converter para numérico
View(generocounty)

# Gravar o dataset completo
write.csv(generocounty, file = ".arquivos_DSA/datasets_limpos/dataset2.csv", row.names = FALSE)

##### Limpeza de dados do Terceiro Dataset #####

sunburst <- rename( # Renomear colunas
    generocounty, # Dataframe
    label = country_name, # Renomear coluna
)
# Remover traços e espaços
sunburst$genres <- sub("-", " ", sunburst$genres)

# Ajustar nomes
sunburst$parent = c("Total -")
sunburst$parent <- paste(sunburst$parent, sunburst$genres)
sunburst$id = c(" - ")
sunburst$id <- paste(sunburst$parent, sunburst$id)
sunburst$id <- paste(sunburst$id, sunburst$label)
sunburst$n <- as.numeric(sunburst$n)
View(sunburst)

# Agregação de dados
added <- aggregate( # Agregar dados
    sunburst$n, # Coluna a ser agregada
    list(sunburst$genres), # Coluna para agregar
    FUN = sum) # Função de agregação
added <- rename(added, label = Group.1) # Renomear coluna
added <- rename(added, n = x) # Renomear coluna
added$n <- as.numeric(added$n) # Converter para numérico
added$genres <- c(NA)
added$parent <- c("total")
added$id <- c(" - ")
added$id <- paste(added$parent, added$id)
added$id <- paste(added$id, added$label)
View(added)

# Calcular o total
total = sum(added$n)
total

# Combinar tudo em um dataframe final
sunburst <- rbind(added, sunburst) # Combinar dataframes
sunburst <- rbind(c("total", total, NA, NA, "total"), sunburst) # Adicionar total
sunburst <- sunburst[,-c(3)] # remover coluna
sunburst$n <- as.numeric(sunburst$n) # Converter para numérico
View(sunburst)

# Gravar o dataset completo
write.csv(sunburst, file = ".arquivos_DSA/datasets_limpos/dataset3.csv", row.names = FALSE)

##### Limpeza de dados do Quarto Dataset #####

# Vamos trabalhar com TOP 10 para evitar problemas de performance dos gráficos
top10sunburst <-  sunburst[-c(1:28),]
top10sunburst$n <- as.numeric(top10sunburst$n) # Converter para numérico
View(top10sunburst)

# Top 10 gêneros por país
top10sunburst <- top10sunburst %>% # 
  group_by(label) %>% # Agrupar por país
  top_n(10, n) # Obter os 10 maiores valores
View(top10sunburst)

# Com o cálculo dos top 10, precisamos recalcular o total
top10add <- aggregate(
    top10sunburst$n, # Coluna a ser agregada
    list(top10sunburst$parent), # Coluna para agregar
    FUN = sum) # Função de agregação
top10add <- rename(top10add, id = Group.1) # Renomear coluna
top10add <- rename(top10add, n = x) # Renomear coluna
top10add$label <- sub("total - ", "", top10add$id)
top10add$parent <- c("total")
top10add$n <- as.numeric(top10add$n) # Converter para numérico
total = sum(top10add$n)
top10sunburst <- rbind(top10add, top10sunburst) # Combinar dataframes
top10sunburst <- rbind(c("total", total, NA, NA, "total"), top10sunburst) # Adicionar total
top10sunburst$n <- as.numeric(top10sunburst$n) # Converter para numérico
View(top10sunburst)

# Gravar o dataset completo
write.csv(top10sunburst, file = ".arquivos_DSA/datasets_limpos/dataset4.csv", row.names = FALSE)

#### Limpeza de dados do Quinto Dataset ####

# Filtrar dataframe anterior e criar um novo
nototal <- sunburst[-c(1),]
nototal$parent = sub("total - ", "", nototal$parent)
nototal$parent = sub("total", NA, nototal$parent)
nototal$id = sub("total - ", "", nototal$id)
View(nototal)

# Gravar o dataset completo
write.csv(nototal, file = ".arquivos_DSA/datasets_limpos/dataset5.csv", row.names = FALSE)

#### Limpeza de dados do Sexto Dataset ####

# Filtrar dataframe anterior e criar um novo
countrytree <- nototal[-c(1:27),]
countrytree <- rename(countrytree, parents = label)
countrytree <- rename(countrytree, labels = parent)
countrytree$id <- c(" - ")
countrytree$id <- paste(countrytree$parents, countrytree$id)
countrytree$id <- paste(countrytree$id, countrytree$labels)
countries <- aggregate(
    countrytree$n, # Coluna a ser agregada
    list(countrytree$parents), # Coluna para agregar
    FUN = sum) # Função de agregação
countries <- rename(countries, labels = Group.1) # Renomear coluna
countries <- rename(countries, n = x) # Renomear coluna
countries$n <- as.numeric(countries$n) # Converter para numérico
countries$id <- countries$labels
countries$parents <- c(NA)
countrytree <- rbind(countrytree, countries) # Combinar dataframes
View(countrytree)

# Gravar o dataset completo
write.csv(countrytree, file = ".arquivos_DSA/datasets_limpos/dataset6.csv", row.names = FALSE)
