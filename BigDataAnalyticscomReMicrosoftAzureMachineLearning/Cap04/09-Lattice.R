username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/BigDataAnalyticscomReMicrosoftAzureMachineLearning/Cap04", sep = ""))
getwd()
windows(width = 15, height = 10)

# A biblioteca lattice é uma alternativa ao ggplot2

# Instalando o Lattice
install.packages("lattice")
library(lattice)

# Scatterplot com Lattice
xyplot(data = iris, groups = Species, Sepal.Length ~ Petal.Length)

# Barplots com dataset Titanic
?Titanic

barchart(
    Class ~ Freq | Sex + Age,
    data = as.data.frame(Titanic),
    groups = Survived,
    stack = TRUE, # Empilha as barras
    layout = c(4, 1), # Layout do gráfico - 4 linhas e 1 coluna
    auto.key = list(title = "Dados Titanic", columns = 2) # Adiciona uma legenda com 2 colunas
)

barchart(
    Class ~ Freq | Sex + Age,
    data = as.data.frame(Titanic),
    groups = Survived,
    stack = TRUE, # Empilha as barras
    layout = c(4, 1), # Layout do gráfico - 4 linhas e 1 coluna
    auto.key = list(title = "Dados Titanic", columns = 2), # Adiciona uma legenda com 2 colunas
    scales = list(x = "free") # Escala livre no eixo x
)

# Contagem de elementos
PetalLength <- equal.count(iris$Petal.Length, 4) # Divide os dados em 4 grupos
PetalLength

xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris)

xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris,
    panel = function(...) { # Função panel
        panel.grid(h = -1, v = -1, col.line = "skyblue") # Adiciona linhas de grade
        panel.xyplot(...) # Adiciona pontos
    })

xyplot(Sepal.Length ~ Sepal.Width | PetalLength, data = iris,
    panel = function(x,y,...) { # Função panel
        panel.grid(h = -1, v = -1, col.line = "skyblue") # Adiciona linhas de grade
        panel.xyplot(x,y,...) # Adiciona pontos
        mylm <- lm(y ~ x) # Cria um modelo de regressão linear
        panel.abline(mylm) # Adiciona uma linha de regressão 
})

# Histograma
histogram(~ Sepal.Length | Species, xlab = "", data = iris, # xlab é o rótulo do eixo x
    layout = c(3, 1), # Layout do gráfico
    type = "density", # Tipo de gráfico
    main = "Histograma Lattice", # Título do gráfico
    sub = "Iris Dataset, Sepal Length"
) # Subtítulo do gráfico

qqmath( # Gráfico QQ: Quantil-Quantil
    ~ Sepal.Length | Species, data = iris, # Variável e dataset
    distribution = qunif # Distribuição
) # Subtítulo do gráfico

# Boxplot
bwplot(Species ~ Sepal.Length, data = iris)

# Violin plot
bwplot(Species ~ Sepal.Length, data = iris, panel = panel.violin)
