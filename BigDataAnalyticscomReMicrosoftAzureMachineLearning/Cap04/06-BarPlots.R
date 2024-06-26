username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap04", sep = ""))
getwd()
windows(width = 15, height = 10)

# Criando dados
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = TRUE)
dados

# Nomeando as linhas e colunas
colnames(dados) <- c("0", "1-150", "151-300", ">300")
rownames(dados) <- c("Jovem", "Adulto", "Idoso")
dados

# Criando o gráfico
barplot(dados, beside = TRUE) # o parâmetro beside define se as barras serão empilhadas (FALSE) ou não (TRUE)

barplot(dados, col = c("black", "white", "dodgerblue3")) # barras empilhadas (padrão) e com cores personalizadas

# Adicionando legendas
barplot(dados, col = c("black", "white", "dodgerblue3"), legend.text = rownames(dados), args.legend = list(cex = 2, bty = "n"))

# Agora vamos criar um gráfico de barras lado a lado
barplot(dados, beside = TRUE, col = c("black", "white", "dodgerblue3"), legend.text = rownames(dados), args.legend = list(cex = 2, bty = "n"))

# Com a transposta da matriz, invertemos as posições entre faixas etárias e faixas de quantidade
barplot(t(dados), beside = TRUE, col = c("black", "white", "#0D80BF", "#F8C300"), legend.text = colnames(dados), args.legend = list(cex = 2, bty = "n"))
