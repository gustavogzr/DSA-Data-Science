setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap04")
getwd()
windows(width = 15, height = 10)

# Vamos usar o dataset cars
?cars
View(cars)
dados = cars$speed

# Construindo um histograma
?hist
hist(dados)
hist(dados, labels = TRUE) # o parâmetro labels define se os rótulos serão exibidos

hist(dados, breaks = 10, main = "Histograma das Velocidades") # o parâmetro breaks define o número de grupos
hist(dados, labels = TRUE, breaks = c(0,5,10,20,30), main = "Histograma das Velocidades") # o parâmetro breaks define os limites dos grupos
hist(dados, labels = TRUE, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = TRUE, breaks = 10, main = "Histograma das Velocidades", ylim = c(0, 10)) # o parâmetro ylim define os limites do eixo y

# Adicionando linhas ao histograma
grafico <- hist(dados, breaks = 10, main = "Histograma das Velocidades")

xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados)) # calcula a distribuição normal dos dados
yaxis = yaxis * diff(grafico$mids) * length(dados)

lines(xaxis, yaxis, col = "red", lwd = 2)