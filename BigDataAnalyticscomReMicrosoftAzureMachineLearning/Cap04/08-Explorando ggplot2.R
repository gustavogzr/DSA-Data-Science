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


