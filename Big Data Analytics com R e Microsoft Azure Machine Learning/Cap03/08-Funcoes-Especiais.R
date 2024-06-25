# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# usando unlist() - produz um vetor com os elementos da lista
?unlist

lst1 <- list(6, "b", 15)
lst1
class(lst1)

unlist(lst1)
vec1 <- unlist(lst1)
class(vec1)
vec1

lst2 <- list(v1 = 6, v2 = list(381, 2190), v3 = c(30, 217))
lst2

unlist(lst2)
class(unlist(lst2))
mean(unlist(lst2))
round(mean(unlist(lst2)))

# usando do.call() - aplica uma função a um objeto inteiro
?do.call

data <- list()
N <- 100

for (n in 1:N) {
    data[[n]] = data.frame(index = n, char = sample(letters, 1), z = rnorm(1))
}

head(data)

do.call(rbind, data)
class(do.call(rbind, data))

# lapply() vs do.call()
y <- list(1:3, 4:6, 7:9)
y

lapply(y, sum)
sapply(y, sum)
do.call(sum, y)

# o resultado de lapply() pode ser obtido de outras formas.
# Pacote plyr
install.packages("plyr")
library(plyr)

y <- list(1:3, 4:6, 7:9)
y

ldply(y, sum)

# conhecer agora a função strsplit() - divide uma string em substrings

texto <- "Big Data Analytics com R e Microsoft Azure Machine Learning"
strsplit(texto, " ")

texto2 <- "Data Science Academy"
strsplit(texto2, "") # divide a string em caracteres

dates <- c("1998-05-23", "2008-12-30", "2009-11-29")
temp <- strsplit(dates, "-")
temp
class(temp)

# Transformar a lista de datas em uma matriz, fazendo antes um unlist()
matrix(unlist(temp), ncol = 3, byrow = TRUE)

Names <- c("Brin, Sergey", "Page, Larry",
           "Dorsey, Jack", "Glass, Noah",
            "Williams, Evan", "Stone, Biz")

temp <- strsplit(Names, ", ")
temp

frase <- "Até a pé nós iremos, para o que der e vier"
palavras <- strsplit(frase, " ")[[1]]
palavras
class(palavras)
unique(tolower(palavras))

antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua', 'pao_e_agua_2'))
antes
strsplit(as.character(antes$tipo), '_e_')

library(stringr)
str_split_fixed(antes$tipo, "_e_", 2)

# Usando do.call()
antes = data.frame(attr = c(1,30,4,6), tipo = c('pao_e_agua', 'pao_e_agua_2'))
antes
depois <- strsplit(as.character(antes$tipo), '_e_')
depois
do.call(rbind, depois)

# usando dplyr e tidyr
library(dplyr)
library(tidyr)

antes<- data.frame(
    attr = c(1,30,4,6),
    tipo = c('pao_e_agua', 'pao_e_agua_2')
)

antes %>%
    separate(tipo, c('pao', 'agua'), sep = '_e_') # sintaxe do dplyr
