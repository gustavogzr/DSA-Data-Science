username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/BigDataAnalyticscomReMicrosoftAzureMachineLearning/Cap04", sep = ""))
getwd()
windows(width = 15, height = 10)

# Instalar pacotes
install.packages("ggplot2") # Instala o pacote ggplot2
install.packages("maps") # Instala o pacote maps
install.packages("mapdata") # Instala o pacote mapdata

# Carrega os pacotes
library(ggplot2) # Carrega o pacote ggplot2
library(maps) # Carrega o pacote maps
library(mapdata) # Carrega o pacote mapdata

# Função para buscar as coordenadas dos países
?map_data
mapa <- map_data("world") # Busca as coordenadas dos países

# Visualizando o dataframe
dim(mapa) # Dimensões do dataframe
View(mapa) # Visualiza o dataframe

# Gerando o mapa
ggplot() + geom_polygon(data = mapa, aes(x = long, y = lat, group = group)) + coord_fixed(1.3) # Cria um gráfico de polígono
# coord_fixed é uma função que ajusta a proporção dos eixos x e y

ggplot() +
geom_polygon(data = mapa, aes(x = long, y = lat, group = group),
fill = NA, color = "blue") + coord_fixed(1.3) # Cria um gráfico de polígono

gg1 <- ggplot() +
geom_polygon(data = mapa, aes(x = long, y = lat, group = group),
fill = "seagreen1", color = "blue") + coord_fixed(1.3) # Cria um gráfico de polígono
gg1

# Marcando alguns pontos no mapa
# Podemos usar um shapefile para marcar pontos no mapa.
# Shapefile é um formato de arquivo que armazena dados geoespaciais.
# Podemos encontrar o shapefile do Brasil no site do IBGE.

df_labs <- data.frame(
    long = c(69.24140,-2.8456051),
    lat = c(-78.38995,22.44512),
    names = c("Ponto1", "Ponto2"),
    stringsAsFactors = FALSE # Não transforma as strings em fatores
)
View(df_labs) # Visualiza o dataframe

# Incluir pontos no mapa
gg1 +
geom_point(data = df_labs, aes(x = long, y = lat), color = "black", size = 3) +
geom_point(data = df_labs, aes(x = long, y = lat), color = "yellow", size = 2)

# Divisão por países
ggplot(data = mapa) +
geom_polygon(aes(x = long, y = lat, group = group, fill = region), color = "white") +
coord_fixed(1.3) +
guides(fill = FALSE) # Remove a legenda porque são muitos países