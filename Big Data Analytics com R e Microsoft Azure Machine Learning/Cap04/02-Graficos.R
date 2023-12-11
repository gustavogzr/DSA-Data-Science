# Configurando o diretório de trabalho
setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap04")
getwd()

search()

# Demo - Gráficos
demo("graphics")

# Plot básico
x = 5:7
y = 8:10
plot(x, y)
?plot

altura <- c(145, 167, 176, 123, 150)
largura <- c(51, 63, 64, 40, 55)
plot(altura, largura)

# Plotando um dataframe
?lynx
plot(lynx)
plot(lynx, ylab = "Plots com Dataframes", xlab = "")
plot(lynx, ylab = "Plots com Dataframes", xlab = "Observações")
plot(lynx, main = "Plots com Dataframes", col = "red")
plot(lynx, main = "Plots com Dataframes", col = "red", col.main = 52, cex.main = 1.5)

library(datasets)
hist(warpbreaks$breaks)

airquality
transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

# Especificando parâmetros de plotagem

# col - cor do gráfico
# lty - tipo de linha
# lwd - largura da linha
# pch - tipo de ponto
# cex - tamanho do ponto
# xlab - rótulo do eixo x
# ylab - rótulo do eixo y
# main - título do gráfico
# las - orientação dos rótulos dos eixos
# xlim - limites do eixo x
# ylim - limites do eixo y
# axes - se os eixos devem ser desenhados
# bg - cor de fundo
# mfrow - número de plots por linha
# mfcol - número de plots por coluna

# Funções básicas de plotagem

# plot() - plotagem de gráficos (scatterplots, linhas, pontos, etc)
# lines() - adiciona linhas a um gráfico
# points() - adiciona pontos a um gráfico
# text() - adiciona texto a um gráfico
# title() - adiciona títulos a um gráfico

?par
par()
par("pch")
par("lty")