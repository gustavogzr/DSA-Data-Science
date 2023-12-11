# Configurando o diretório de trabalho
setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap03")
getwd()

vec1 = 1:4
vec2 <- 1:4

class(vec1)
class(vec2)

typeof(vec1)
typeof(vec2)

mean(x = 1:10)
x # dá erro porque x não foi definido

mean(x <- 1:10)
x # x foi definido