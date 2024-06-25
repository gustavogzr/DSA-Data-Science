# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap03", sep = ""))
getwd()

# Tipos de Apply
# apply() - Aplica uma função a linhas ou colunas de uma matriz
# tapply() - os vetores podem ser divididos em diferentes subsets
# lapply() - Aplica uma função a cada elemento de uma lista e retorna uma lista
# sapply() - Aplica uma função a cada elemento de uma lista e retorna um vetor
# vapply() - Aplica uma função a cada elemento de uma lista e retorna um vetor com o tipo de dados especificado
# rapply() - Aplica uma função a cada elemento de uma lista e retorna uma lista
# eapply() - Aplica uma função a cada elemento de uma lista e retorna uma lista
# mapply() - Aplica uma função a cada elemento de uma lista e retorna um vetor ou matriz
# by() - Aplica uma função a cada elemento de uma lista e retorna um vetor ou matriz

# Se vocë estiver trabalhando com objetos:
# list, numeric, character (list/vector) => sapply ou lapply
# matrix, data.frame (agregação por coluna) => by / tapply
# Operações por linha ou operações específicas => apply

# Usando um loop
lista1 <- list(a = (1:20), b = (35:67))
lista1

# calculando o total de cada elemento da lista com o loop for
valor_a = 0
valor_b = 0

for (i in lista1$a) {
  valor_a = valor_a + i
}

for (j in lista1$b) {
  valor_b = valor_b + j
}

valor_a
valor_b

# calculando cada elemento da lista com saplly
?sapply
sapply(lista1, sum)
sapply(lista1, mean)

# Usando o apply
?apply

x <- matrix(c(20,13,65,32,45,12,76,49,82), nr = 3, byrow = TRUE)
x

apply(x, mean) # não funciona porque falta o argumento MARGIN
apply(x, 1, mean) # calcula a média por linha
apply(x, 2, mean) # calcula a média por coluna
apply(x, 1, plot) # plota cada linha

resultado_apply <- apply(x, 1, mean)
resultado_apply

# Aplicando apply() a um dataframe
escola <- data.frame(
    Aluno = c('Bob', 'Tereza', 'Marta', 'Felipe', 'Zacarias', 'Elton'),
    Fisica = c(91,82,75,97,62,74),
    Matematica = c(99,100,86,92,91,87),
    Quimica = c(56,72,49,68,59,77)
)

escola
escola$Matematica

# calculando a média de cada aluno
escola$Media = NA
escola

escola$Media = apply(escola[,c(2,3,4)], 1, mean)
escola
escola$Media = round(escola$Media)
escola

# Usando o tapply
?gl
tabela_basquete <- data.frame(
    equipe = gl(5, 5, labels = paste("Equipe", LETTERS[1:5])), # cria uma variável com 5 equipes
    jogador = sample(letters, 25), # cria uma variável com 25 jogadores
    num_cestas = floor(runif(25, min = 0, max = 50)) # cria uma variável com o número de cestas
)
View(tabela_basquete)
plot(tabela_basquete$num_cestas)
summary(tabela_basquete)

# como calcular o total ou a média de cestas por equipe?
# tapply() vs sqldf()
install.packages("sqldf")
library(sqldf)

sqldf("select equipe, sum (num_cestas) as Total_de_Cestas from tabela_basquete group by equipe")

tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, sum)
tapply(tabela_basquete$num_cestas, tabela_basquete$equipe, mean)

# usando by()
?by

dat <- data.frame(
    species = c(rep(c(1,2,3), each=5)),
    petal.length = c(rnorm(5, 4.5, 1), rnorm(5, 4.5, 1), rnorm(5, 5.5, 1)),
    petal.width = c(rnorm(5, 2.5, 1), rnorm(5, 2.5, 1), rnorm(5, 4, 1))
)
View(dat)
dat$species <- factor(dat$species)
View(dat)
str(dat)

by(dat, dat$species, function(x){
    # calcular o comprimento médio da pétala para cada espécie
    mean.pl <- mean(x$petal.length)
})

# usando lapply()
?lapply

lista1 <- list(a = (1:10), b = (45:77))
lista1
lapply(lista1, sum) # retorna uma lista com os resultados
sapply(lista1, sum) # retorna um vetor com os resultados

# usando vapply()
?vapply # retorna um tipo de dado específico - mais seguro e rápido que o sapply
vapply(lista1, fivenum, c(Min. = 0, "1stQu." = 0, Median = 0, "3rdQu." = 0, Max. = 0)) # resumo estatístico da lista

# usando replicate()
?replicate
?runif
replicate(7, runif(10))

# usando mapply()
?mapply
mapply(rep, 1:4, 4:1) # repete os números de 1 a 4, 4 vezes

# usando rapply()
?rapply # aplica uma função recursivamente a cada elemento de uma lista

lista2 <- list(a = (1:5), b = (6:10))
lista2
rapply(lista2, sum) # retorna um vetor com os resultados
rapply(lista2, sum, how = "list") # retorna uma lista com os resultados