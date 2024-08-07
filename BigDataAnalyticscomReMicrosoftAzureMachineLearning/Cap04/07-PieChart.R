username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/BigDataAnalyticscomReMicrosoftAzureMachineLearning/Cap04", sep = ""))
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
# labels = paises: adiciona os labels
# main = "Distribuição de Vendas": adiciona o título
# cex = 2: aumenta o tamanho dos labels
# cex.main = 2: aumenta o tamanho do título
# col = c("darksalmon", "gainsboro", "lemonchiffon4"): adiciona cores às fatias

# Construindo um gráfico a partir de um dataframe
attach(iris)
Values = table(Species) # Conta a quantidade de espécies
labels = paste(names(Values))
pie(Values, labels = labels, main = "Distribuição de Espécies", cex = 2, cex.main = 2)

# Construindo um gráfico de pizza 3D
install.packages("plotrix") # Instala o pacote plotrix
library(plotrix) # Carrega o pacote plotrix
?pie3D
pie3D(fatias, labels = paises, main = "Distribuição de Vendas",
    cex = 2, cex.main = 2, explode = 0.2, theta = 0.8,
    col = c("steelblue1", "tomato2", "goldenrod2"))
# explode = 0.2: afasta as fatias
# theta = 0.8: inclina o gráfico