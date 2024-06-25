# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

search() # mostra os pacotes instalados

install.packages(c('ggvis', 'tm', 'dplyr'))
library(ggvis)
library(tm)
require(dplyr)

search()

?require # mostra a documentação do pacote
detach(package:dplyr) # remove o pacote da memória
search()

# listar conteúdo dos pacotes
?ls
ls(pos = "package:tm")
ls(getNamespace("tm"), all.names = TRUE)

# lista as funções de um pacote
lsf.str("package:tm")
lsf.str("package:ggplot2")
library(ggplot2)
lsf.str("package:ggplot2")

# R possui um conjunto de datasets pré-instalados

library(MASS)
data()

?lynx # mostra a documentação do dataset
head(lynx) # mostra as primeiras linhas do dataset
head(iris)
tail(lynx)
summary(lynx)

plot(lynx)
hist(lynx)
head(iris)
iris$Sepal.Length
sum(Sepal.Length) # dá erro porque não possui "iris" no Search Path

?attach # adiciona objetos ao PATH
attach(iris)
sum(Sepal.Length) # agora dá certo porque iris foi incluído no Search Path