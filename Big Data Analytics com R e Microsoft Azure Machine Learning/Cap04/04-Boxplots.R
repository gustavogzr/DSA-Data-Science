# Configurando o diretório de trabalho
setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap04")
getwd()
windows(width = 15, height = 10)

# Vamos usar o dataset sleep
?sleep

attach(sleep) # permite usar as variáveis do dataset sem precisar referenciar o dataset
View(sleep)

# Cria o boxplot
sleep_boxplot <- boxplot(extra ~ group, data = sleep, main = "Duração do Sono",
                         col.main = "red", xlab = "Droga", ylab = "Horas")

# Calculando a média
media = by(extra, group, mean)
media

# Adiciona a média ao gráfico
points(media, col = "red", cex = 2)

# Boxplot na horizontal
horizontal_boxplot <- boxplot(extra ~ group, data = sleep, main = "Duração do Sono - Boxplot Horizontal",
                              xlab = "", ylab = "", horizontal = TRUE)

horizontal_boxplot <- boxplot(extra ~ group, data = sleep, main = "Duração do Sono - Boxplot Horizontal",
                              xlab = "", ylab = "", horizontal = TRUE, col = c("indianred", "lightblue"))
