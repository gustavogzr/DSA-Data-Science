# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# Criando uma matriz

# Número de linhas
matrix (c(1,2,3,4,5,6), nr = 2)
matrix (c(1,2,3,4,5,6), nr = 3)
matrix (c(1,2,3,4,5,6), nr = 6)

# Número de colunas
matrix (c(1,2,3,4,5,6), nc = 2)

# Help
?matrix

# Matrizes precisam ter um número de elementos que seja múltiplo do número de linhas e colunas
matrix (c(1,2,3,4,5), nr = 2)

# Criando matrizes a partir de vetores e preenchendo a partir das linhas
meus_dados = c(1:10)
matrix(data = meus_dados, nr = 5, nc = 2, byrow = TRUE)
matrix(data = meus_dados, nr = 5, nc = 2)

# Fatiando a matriz (subdividindo)
mat <- matrix(c(2,3,4,5), nr = 2)
mat
mat[1,2]
mat[2,2]
mat[1,3]
mat[,2]

# Criando uma matriz diagonal
matriz = 1:3
diag(matriz)

# Extraindo vetor de uma matriz diagonal
vetor = diag(matriz)
diag(vetor)

# Transposta da matriz
W <- matrix(c(2,4,8,12), nr = 2)
W
t(W)
U <- t(W)
U

# Obtendo uma matriz inversa
solve(W)

# Multiplicação de matrizes
mat1 <- matrix(c(2,3,4,5), nr = 2)
mat1
mat2 <- matrix(c(6,7,8,9), nr = 2)
mat2
mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2

# Multiplicando Matriz com Vetor
x = c(1:4)
x
y <- matrix(c(2,3,4,5), nr = 2)
x * y

# Nomeando a Matriz
mat3 <- matrix(c('Terra', 'Marte', 'Júpiter', 'Saturno'), nr = 2)
mat3
dimnames(mat3) = (list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2")))
mat3

# Identificando linhas e colunas no momento da criação da Matriz
matrix(c(1,2,3,4), nr = 2, dimnames = list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2")))

# Combinando matrizes
mat4 <- matrix(c(2,3,4,5), nr = 2)
mat4
mat5 <- matrix(c(6,7,8,9), nr = 2)
mat5
cbind(mat4, mat5)
rbind(mat4, mat5)

# Desconstruindo a matriz
c(mat4)