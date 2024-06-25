# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap04", sep = ""))
getwd()
windows(width = 15, height = 10)

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
par() # mostra os parâmetros atuais
par("pch") 
par("lty")

x = 2:4
plot(x, pch = "*")

par(mfrow = c(2, 2), col.axis = "red")
plot(1:8, las = 0, xlab = "xlab", ylab = "ylab", main = "LAS = 0")
plot(1:8, las = 1, xlab = "xlab", ylab = "ylab", main = "LAS = 1")
plot(1:8, las = 2, xlab = "xlab", ylab = "ylab", main = "LAS = 2")
plot(1:8, las = 3, xlab = "xlab", ylab = "ylab", main = "LAS = 3")
legend("topright", pch = 1, col = c("blue", "red"), legend = c("Var1", "Var2"))
par(mfrow = c(1, 1))

colors() # mostra as cores disponíveis

# Salvando gráficos

# png
png("Grafico1.png", width = 800, height = 600, res = 72) # RES = DPI

plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species, main = "Gráfico gerado a partir do Iris")

dev.off() # fecha o arquivo

# pdf
pdf("Grafico1.pdf")

plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species, main = "Gráfico gerado a partir do Iris")

dev.off() # fecha o arquivo

# Estendendo as funções de plotagem
install.packages("plotrix")
library(plotrix)
?plotrix

par(mfrow = c(1, 1), col.axis = "red")
plot(1:6, las = 3, xlab = "lty 1:6", ylab = "", main = "Mais opções de plot")
ablineclip(v=1, lty=1, col = "sienna2", lwd = 2)
ablineclip(v=2, lty=1, col = "sienna2", lwd = 2)
ablineclip(v=3, lty=1, col = "sienna2", lwd = 2)
ablineclip(v=4, lty=1, col = "sienna2", lwd = 2)
ablineclip(v=5, lty=1, col = "sienna2", lwd = 2)
ablineclip(v=6, lty=1, col = "sienna2", lwd = 2)

plot(lynx)
plot(lynx, type="p", main="Type p")
plot(lynx, type="l", main="Type l")
plot(lynx, type="b", main="Type b")
plot(lynx, type="o", main="Type o")
plot(lynx, type="h", main="Type h")
plot(lynx, type="s", main="Type s")
plot(lynx, type="n", main="Type n")

# Dois plots em um gráfico
par(mar = c(4, 3, 3, 3), col.axis = "black")

plot(cars$speed, type = "s", col = "red", bty = "n", xlab = "Cars ID", ylab = "")
text(8, 14, "Velocidade", cex = 0.85, col = "red")
par(new = TRUE)

plot(cars$dist, type = "s", col = "darkblue", bty = "n", ann=F, axes=F)
axis(side = 4)
text(37, 18, "Distância", cex = 0.85, col = "darkblue")

title(main = "Velocidade x Distância")

# Plots a partir de datasets
df <- read.csv("pibpercap.csv", stringsAsFactors = FALSE)
head(df)
df_1982 <- subset(df, ano == 1982)
plot(expectativa ~ pibpercap, data = df_1982, log = "x")
View(df)

# Nome para as colunas
mycol = c(Asia = "tomato", Europe = "chocolate4", Africa = "dodgerblue2", Americas = "darkgoldenrod1", Oceania = "green4")

# Plot com cores diferentes para cada continente
plot(expectativa ~ pibpercap, data = df_1982, log = "x", col = mycol[continente])

# Função para a escala
mycex <- function(var, r, f = sqrt) {
    x = f(var)
    x_scaled = (x - min(x))/(max(x) - min(x))
    r[1] + x_scaled * (r[2] - r[1])
}

# Plot com tamanho dos pontos de acordo com a população
plot(expectativa ~ pibpercap, data = df_1982, log = "x", 
    col = mycol[continente], 
    cex = mycex(pop, r = c(0.4, 20)))
