setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap04")
getwd()
windows(width = 15, height = 10)

# Criando fatias
fatias = c(40, 20, 40)

# Nomeando as fatias
paises = c("Brasil", "Argentina", "Chile")

# Unindo países e fatias
paises = paste(paises, fatias)
paises

# Incluindo mais detalhes no label
paises = paste(paises, "%", sep = "")
paises

# Construindo um gráfico
pie(fatias, labels = paises, main = "Distribuição de Vendas", cex = 2, cex.main = 2,
    col = c("darksalmon", "gainsboro", "lemonchiffon4"))

# Construindo um gráfico a partir de um dataframe
attach(iris)
Values = table(Species)
labels = paste(names(Values))
pie(Values, labels = labels, main = "Distribuição de Espécies", cex = 2, cex.main = 2)

# Construindo um gráfico de pizza 3D
library(plotrix)
?pie3D
pie3D(fatias, labels = paises, main = "Distribuição de Vendas",
    cex = 2, cex.main = 2, explode = 0.2, theta = 0.8,
    col = c("steelblue1", "tomato2", "goldenrod2"))