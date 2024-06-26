# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# Vetor: possui 1 dimensão e 1 tipo de dado

vetor1 <- c(1:20)
vetor1
length(vetor1)
class(vetor1)
mode(vetor1)
typeof(vetor1)

# Matriz: possui 2 dimensões e 1 tipo de dado

matriz1 <- matrix(1:20, nrow = 2)
matriz1
length(matriz1)
class(matriz1)
mode(matriz1)
typeof(matriz1)

# Array: possui 2 ou mais dimensões e 1 tipo de dado

array1 <- array(1:5, dim = c(3,3,3))
array1
length(array1)
class(array1)
mode(array1)
typeof(array1)

# Data Frame: dados de diferentes tipos
# Maneira mais fácil de explicar data frames: é uma matriz de diferentes tipos de dados

View(iris)
length(iris)
class(iris)
mode(iris)
typeof(iris)

# Listas: coleção de diferentes objetos
# Diferentes tipos de dados são possíveis e comuns

lista1 <- list(a = matriz1, b = vetor1)
lista1
length(lista1)
class(lista1)
mode(lista1)
typeof(lista1)

# Funções também são vistas como objetos em R

func1 <- function(x) {
    var1 <- x * x
    return(var1)
}

func1(5)
class(func1)

# Removendo objetos
objects()
rm(array1, func1)
objects()
