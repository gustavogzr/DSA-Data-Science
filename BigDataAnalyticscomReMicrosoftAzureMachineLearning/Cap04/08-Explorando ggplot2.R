username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/BigDataAnalyticscomReMicrosoftAzureMachineLearning/Cap04", sep = ""))
getwd()
windows(width = 15, height = 10)

# Instalando ggplot2
install.packages("ggplot2")
library(ggplot2)

# Plotando um gráfico básico com qplot
data(tips, package = "reshape2") # Carrega o dataset tips
View(tips) # Visualiza o dataset
qplot(total_bill, tip, data = tips, geom = "point") # Cria um gráfico de 

# Construir um gráfico camada por camada

# Camada 1
camada1 <- geom_point(
    mapping = aes(x = total_bill, y = tip, color = sex), # Mapeamento dos dados
    data = tips, # Dataset
    size = 3 # Tamanho dos pontos
)
ggplot() + camada1 # Adiciona a camada 1 ao gráfico

?aes # aes é uma função que mapeia variáveis para atributos visuais
??aes

# Construir um modelo de regressão linear
modelo_base <- lm(tip ~ total_bill, data = tips) # Cria um modelo de regressão linear
modelo_fit <- data.frame(
    total_bill = tips$total_bill, # Variável independente. $ é usado para acessar uma coluna de um dataframe
    predict(modelo_base, interval = "confidence") # Predição do modelo. Intervalo de confiança de 95%
)

head(modelo_fit) # Visualiza as primeiras linhas do dataframe

# Camada 2 - Modelo de regressão linear
camada2 <- geom_line(
    mapping = aes(x = total_bill, y = fit),
    data = modelo_fit,
    color = "darkred"
)
ggplot() + camada1 + camada2 # Adiciona a camada 2 ao gráfico

# Camada 3 - Intervalo de confiança
camada3 <- geom_ribbon( # geom_ribbon é uma função que cria uma faixa de dados
    mapping = aes(x = total_bill, ymin = lwr, ymax = upr),
    data = modelo_fit,
    alpha = 0.3, # Transparência
    fill = "darkred"
)
ggplot() + camada1 + camada2 + camada3 # Adiciona a camada 3 ao gráfico

# Versão final otiimizada
ggplot(data = tips, aes(x = total_bill, y = tip)) + # Cria um gráfico
    geom_point(aes(color = sex)) + # Adiciona pontos
    geom_smooth(method = "lm") # Adiciona uma linha de regressão

# Gravando o gráfico em um arquivo
my_plot <- ggplot(data = tips, aes(x = total_bill, y = tip)) + # Cria um gráfico
    geom_point(aes(color = sex)) + # Adiciona pontos
    geom_smooth(method = "lm") # Adiciona uma linha de regressão

class(my_plot) # Verifica a classe do objeto
print(my_plot) # Imprime o gráfico

# Scatterplot com linha de regressão

# Dados
data = data.frame(cond = rep(c("Obs1","Obs2"), each = 10),
                    var1 = 1:100 + rnorm(100, sd = 9),
                    var2 = 1:100 + rnorm(100, sd = 16))
head(data)

ggplot(data, aes(x = var1, y = var2, color = cond)) + # Cria um gráfico
    geom_point(shape = 1) + # Adiciona pontos
    geom_smooth(method = "lm", color = "red", se = FALSE) # Adiciona uma linha de regressão. se = FALSE remove o intervalo de confiança

?lm # lm é uma função que ajusta um modelo linear

# Barplot

# Dados
data = data.frame(grupo = c("A", "B", "C", "D"),
                    valor = c(33, 62, 56, 67),
                    num_obs = c(100, 500, 459, 342))
head(data)

# Gerando massa de dados
data$right = cumsum(data$num_obs) + 30 * c(0:(nrow(data)-1))
data$left = data$right - data$num_obs

# Plot
ggplot(data, aes(ymin=0)) +
        geom_rect(aes(xmin = left, xmax = right, ymax = valor, colour = grupo, fill = grupo)) +
        xlab("Número de Observações") + ylab("Valor")

# Usando mtcars como exemplo
head(mtcars)
ggplot(data= mtcars, aes(x = disp, y = mpg)) + geom_point()

# Podemos adicionar cor aos pontos com base em uma variável categórica
ggplot(data = mtcars, aes(x = disp, y = mpg, color = as.factor(am))) + geom_point()
# am: 0 é automático e am = 1 é manual

# Podemos adicionar cor aos pontos com base em uma variável numérica
ggplot(data = mtcars, aes(x = disp, y = mpg, color = cyl)) + geom_point()

# Podemos adicionar tamanho aos pontos com base em uma variável numérica
ggplot(data = mtcars, aes(x = disp, y = mpg, color = cyl, size = wt)) + geom_point()

# O geom define o tipo de gráfico que queremos criar
ggplot(data = mtcars, aes(x = as.factor(cyl), y = mpg)) + geom_boxplot()
# mpg significa milhas por galão

# Histograma
ggplot(data = mtcars, aes(x = mpg), binwidth = 30) + geom_histogram()

# Gráfico de barras
ggplot(data = mtcars, aes(x = as.factor(cyl))) + geom_bar()

# Personalizando o gráfico
colors() # Lista de cores disponíveis
ggplot(data = mtcars, aes(x = as.factor(cyl), y = mpg,
        colour = as.factor(cyl))) + geom_boxplot()

ggplot(data = mtcars, aes(x = as.factor(cyl), y = mpg,
        fill = as.factor(cyl))) + geom_boxplot()

ggplot(data = mtcars, aes(x = as.factor(cyl), y = mpg)) +
        geom_boxplot(fill = "seagreen4", color = "blue")

# Podemos alterar os eixos
ggplot(data = mtcars, aes(x = mpg)) + geom_histogram() + xlab("Milhas por galão") + ylab("Frequência")

# Legendas
ggplot(data = mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
geom_bar() + labs(fill = 'cyl')

# Trocando a posição da legenda
ggplot(data = mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
geom_bar() + labs(fill = 'cyl') + theme(legend.position = "top")

# Sem legenda
ggplot(data = mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl))) + 
geom_bar() + guides(fill = "none")

# Facets: visualização de subconjuntos de dados
ggplot(data = mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
geom_point() + facet_grid(am~.) # Facetado por am

ggplot(data = mtcars, aes(x = mpg, y = disp, colour = as.factor(cyl))) +
geom_point() + facet_grid(.~am) # Facetado por am

# Plots diferentes juntos (diferente de facet)
install.packages("gridExtra")
library(gridExtra)
library(ggplot2)

data(diamonds) # Carrega o dataset diamonds
head(diamonds) # Visualiza as primeiras linhas do dataset

# Histograma como plot1
plot1 <- qplot(price, data = diamonds, binwidth = 1000) + ggtitle("Histograma de Preço")

# Scatterplot como plot2
plot2 <- qplot(carat, price, data = diamonds, colour = cut) + ggtitle("Dispersão de Carat x Preço")

# Combina os dois gráficos
grid.arrange(plot1, plot2, ncol = 1)

# Gráfico de Densidade
ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
geom_density(adjust = 1.5) + ggtitle("Densidade de Preço") # adjust é um fator de suavização

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
geom_density(adjust = 1.5, alpha = 0.2) + ggtitle("Densidade de Preço") # adjust é um fator de suavização

ggplot(data = diamonds, aes(x = price, group = cut, fill = cut)) +
geom_density(adjust = 1.5, position = "fill") + ggtitle("Densidade de Preço") # adjust é um fator de suavização

# Facets com reshape
install.packages("reshape2")
install.packages("plotly")
library(reshape2)
library(plotly)

sp <- ggplot(tips, aes(x = total_bill, y = tip/total_bill)) + geom_point(shape = 1)
sp + facet_grid(sex ~ .)
ggplotly()
sp + facet_grid(. ~ sex)
ggplotly()
sp + facet_wrap(~day, ncol=2) # facet_wrap permite que você especifique o número de colunas
ggplotly()

ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~manufacturer)
ggplotly()
