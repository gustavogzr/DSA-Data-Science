# Configurando o diretório de trabalho
setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02")
getwd()

# Nome dos Contributors
contributors()

# Licença
license()

# Informações sobre  a sessão
sessionInfo()

# Imprimir na tela
print('Estou iniciando o curso de Big Data Analytics com R e Microsoft Azure Machine Learning')

# Criar gráficos
plot(1:25)

# Instalar pacotes
install.packages('randomForest')
install.packages("ggplot2")
install.packages("dplyr")
install.packages('devtools')
install.packages('caret')

# Carregar o pacote
library(ggplot2)

# Descarregar o pacote
detach(package:ggplot2)

# Dúvidas sobre uma função
help(mean)
?mean

# Para buscar mais opções sobre uma função. usar o pacote SOS
install.packages('sos')
library(sos)
findFn('fread')

# Se não souber o nome da função
help.search('randomForest')
help.search('matplot')
??matplot
RSiteSearch('matplot')
example(matplot)