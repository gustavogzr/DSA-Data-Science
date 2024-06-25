# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
?list.files
list.files(getwd())
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
vec1 <- c("a", "b", "c")
vec2 <- c(TRUE, FALSE, TRUE)
vec3 <- c(1, 2, 3)
df1 <- data.frame(vec1, vec2, vec3)
df1
str(df1)

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

# Loop
for (i in vec1) {
    if (i > 10) {
        print(paste("O número", i, "é maior que 10"))
    } else {
        print(paste("O número", i, "é menor que 10"))
    }
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2

# Loop
for (i in lst2) {
    print(i)
}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat1 * mat2

# Multiplicação de matrizes
mat1 %*% mat2

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
vec1 <- c(1, 2, 3)
names(vec1) <- c("Elem1", "Elem2", "Elem3")
vec1

mat1 = matrix(1:9, nrow = 3, byrow = T)
rownames(mat1) <- c("Linha1", "Linha2", "Linha3")
colnames(mat1) <- c("Coluna1", "Coluna2", "Coluna3")
mat1
# Alternativa - usar dimnames()
dimnames(mat1) <- list(c("Lin1", "Lin2", "Lin3"), c("Col1", "Col2", "Col3"))
mat1

list1 = list(1, 'a', TRUE)
names(list1) <- c("Numeric", "Char", "Logical")
list1

vec1 = c(1, 2, 3)
vec2 = c("a", "b", "c")
vec3 = c(TRUE, FALSE, TRUE)

df1 = data.frame(vec1, vec2, vec3)
colnames(df1) <- c("Numeric", "Char", "Logical")
rownames(df1) <- c("Lin1", "Lin2", "Lin3")
df1

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

# Atribuindo valores NA
mat2[sample(1:90, 50)] <- NA
mat2

# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

# Soma por linha
rowSums(mat1)

# Soma por coluna
colSums(mat1)

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a

# Ordenando em ordem crescente
sort(a)

# Alternativa - usando a função order()
order(a)
a[order(a)]

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

# Imprimindo os elementos maiores que 15
mat1[mat1 > 15]

# alternativa - usando for
for (i in mat1) {
    if (i > 15) {
        print(i)
    }
}