# Lista de Exercícios - Capítulo 2

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros
vetor_inteiros <- c(1:30)
vetor_inteiros

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
matriz_inteiros <- matrix(1:16, nrow = 4, ncol = 4, byrow = TRUE)
matriz_inteiros

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lista <- list(vetor_inteiros, matriz_inteiros)
lista

# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat
df_effort <- read.table("effort.dat", header = TRUE)
class(df_effort)
df_effort

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")
names(df_effort) <- c("config", "esfc", "chang")
df_effort

# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset
iris
class(iris)
dim(iris)
summary(iris)
str(iris)

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
# criar um gráfico de dispersão com as colunas Sepal.Length e Sepal.Width
plot(iris$Sepal.Length, iris$Sepal.Width)

# Exercício 8 - Usando a função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()
?subset
df_subset_iris <- subset(iris, Sepal.Length > 7)
df_subset_iris

# Exercícios 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()
library(dplyr)
?slice()
df_iris <- iris
df_iris_slice <- slice_sample(df_iris, n = 15)
df_iris_slice

# Exercícios 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter
RSiteSearch("filter")
df_iris_slice_filter <- filter(df_iris_slice, Sepal.Length > 6)
df_iris_slice_filter