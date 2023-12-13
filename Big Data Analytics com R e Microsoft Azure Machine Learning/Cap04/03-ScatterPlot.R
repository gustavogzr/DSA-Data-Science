# Configurando o diretório de trabalho
setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap04")
getwd()
windows(width = 15, height = 10)

# Definindo os dados
set.seed(67)
x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)

# Cria o plot
plot(x, y, col = 123, pch = 10, main = "Multi Scatterplot",
    col.main = "red", cex.main = 1.5, xlab = "Variável Independente",
    ylab = "Variável Dependente", cex = 2)

# Adiciona outros dados
points(z, t, col = "blue", pch = 4, cex = 2)

# Adiciona outros dados
points(y, t, col = 777, pch = 9, cex = 2)

# Adiciona legenda
legend(-6, 5.9, legend = c("Nível 1", "Nível 2", "Nível 3"),
       col = c(123, "blue", 777), pch = c(10, 4, 9), cex = 1.5, bty = "n")
