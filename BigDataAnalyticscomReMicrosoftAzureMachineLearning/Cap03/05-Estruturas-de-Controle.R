# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap03", sep = ""))
getwd()

# If
x = 25
if (x < 30) { 
  print("x é menor que 30")
}

# as chaves não são obrigatórias, mas são recomendadas
if (x < 30)
  print("x é menor que 30")

# If-Else
if (x < 7) {
  print("x é menor que 7")
} else {
  print("x é maior que 7")
}

# Comandos podem ser aninhados
x = 7
if (x < 7) {
  print("x é menor que 7")
} else if (x == 7) {
  print("x é igual a 7")
} else {
  print("x é maior que 7")
}

# ifelse
x = 5
ifelse(x < 6, "x é menor que 6", "x não é menor que 6")

x = 9
ifelse(x < 6, "x é menor que 6", "x não é menor que 6")

# Expressões ifelse também podem ser aninhadas
x = c(7,5,4)
ifelse(x < 5, "x é menor que 5", ifelse(x == 5, "x é igual a 5", "x é maior que 5"))

# Estruturas if dentro de funções
func1 <- function(x,y) {
    ifelse(y < 7, x + y, "Não encontrado")
}

func1(4,2)
func1(40,7)

# Rep
rep(rnorm(10),5)

# Repeat
x = 1
repeat {
    x = x + 3
    if (x > 99) {
        break
    }
    print(x)
}

# Loop for
for (i in 1:20) {print(i)}
for (q in rnorm(10)) {print(q)}

# Podemos ignorar elementos dentro de um loop
for (i in 1:22) {
    if (i == 13 || i == 15) {
        next
    }
    print(i)
}

# Podemos interromper um loop
for (i in 1:22) {
    if (i == 13) {
        break
    }
    print(i)
}

# Loop While
x = 1
while (x < 5) {
    x = x + 1
    print(x)
}

# o loop while pode não ser executado
y = 6
while (y < 5) {
    y = y + 10
    print(y)
}