# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# Vetor de strings
vetor_caracter = c('Data', 'Science', 'Academy')
vetor_caracter

# Vetor de floats
vetor_numerico = c(1.90, 45.3, 300.5)
vetor_numerico

# Vetor de valores complexos
vetor_complexo = c(5.2+3i, 3.8+4i)
vetor_complexo

# Vetor de valores lógicos
vetor_logico = c(TRUE, FALSE, TRUE, FALSE, FALSE)
vetor_logico

# Vetor de números inteiros
vetor_integer = c(2, 4, 6)
vetor_integer

# Utilizando a função seq()
vetor1 = seq(1:10)
vetor1
is.vector(vetor1)

# Utilizando a função rep()
vetor2 = rep(1:5)
vetor2
is.vector(vetor2)

# Indexição de vetores
a <- c(1,2,3,4,5)
a
a[1]
a[6]

b <- c('Data', 'Science', 'Academy')
b
b[1]
b[2]
b[3]
b[4]

# Combinando vetores
v1 = c(2, 3 , 5)
v2 = c('aa', 'bb', 'cc', 'dd', 'ee')
c(v1, v2)

# Operações com vetores
x = c(1, 3, 5, 7)
y = c(2, 4, 6, 8)

x * 5
x + y
x - y
x * y
x / y

# Somando vetores com números diferentes de elementos
alfa = c(10, 20, 30)
beta = c(1:9)
alfa + beta

# Vetor nomeado
v = c('Nelson', 'Mandela')
v
names(v) = c('Nome', 'Sobrenome')
v
v['Nome']