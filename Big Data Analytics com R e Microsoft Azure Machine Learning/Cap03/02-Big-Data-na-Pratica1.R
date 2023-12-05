# Analisar a temperatura média nas cidades brasileiras

# Configurando o diretório de trabalho
setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap03")
getwd()

# Instalar e carregar pacotes
install.packages("readr")
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplot2")
library(readr)
library(data.table)
library(dplyr)
library(ggplot2)
library(scales)

# Usar read.csv2() para carregar os arquivos
system.time(
  df_teste1 <- read.csv2("TemperaturasGlobais/TemperaturasGlobais.csv")
)

# Usar read.table() para carregar os arquivos
system.time(
  df_teste2 <- read.table("TemperaturasGlobais/TemperaturasGlobais.csv")
)

# Usar fread() para carregar os arquivos
?fread
system.time(
  df <- fread("TemperaturasGlobais/TemperaturasGlobais.csv")
)
# fread é o mais rápido, eficente e correto para carregar arquivos

# eliminar dados não utilizados na memória RAM
gc()

# Mostrar nomes das colunas do dataframe
names(df)

# Criar subsets dos dados carregados
cidadesBrasil <- subset(df, Country == "Brazil")
cidadesBrasil <- na.omit(cidadesBrasil)
head(cidadesBrasil)
View(head(cidadesBrasil))
View(slice_sample(cidadesBrasil, n = 20))
nrow(df)
nrow(cidadesBrasil)
dim(cidadesBrasil)

# Fazer pré-processamento dos dados

# Coverter datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format = "%Y-%m-%d")
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt) 
View(head(cidadesBrasil))

# Criar subsets para cidades específicas
palmas <- subset(cidadesBrasil, City == "Palmas")
palmas <- subset(palmas, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

curitiba <- subset(cidadesBrasil, City == "Curitiba")
curitiba <- subset(curitiba, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

recife <- subset(cidadesBrasil, City == "Recife")
recife <- subset(recife, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

# Construir gráficos
plot_palmas <- ggplot(palmas, aes(x=(Month), y=AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, linewidth  = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Palmas") +
  theme(plot.title = element_text(size = 18))

plot_curitiba <- ggplot(curitiba, aes(x=(Month), y=AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, linewidth  = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Curitiba") +
  theme(plot.title = element_text(size = 18))

plot_recife <- ggplot(recife, aes(x=(Month), y=AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, linewidth  = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Recife") +
  theme(plot.title = element_text(size = 18))

# Plotar gráficos
plot_palmas
plot_curitiba
plot_recife
