# Configurando o diretório de trabalho
setwd("C:/Users/gusta/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02")
getwd()

# Numeric - Todos os números criados em R são do modo numeric
# São armazenados como números decimais (double)
num1 <- 7
num1
class(num1)
mode(num1)
typeof(num1)

num2 = 16.82
num2
class(num2)
mode(num2)
typeof(num2)

# Integer - Números inteiros
# Covertemos tipos numeric para integer com a função as.integer()
is.integer(num2)
y = as.integer(num2)
class(y)
mode(y)
typeof(y)

as.integer('3.17')
as.integer("Joe")
as.integer('Joe')
as.integer(TRUE)
as.integer(FALSE)
as.integer('TRUE')

# Character - Strings
char1 = 'A'
char1
class(char1)
mode(char1)
typeof(char1)

char2 = "Big Data"
char2
class(char2)
mode(char2)
typeof(char2)

char3 = c('Data', 'Science', 'Academy')
char3
class(char3)
mode(char3)
typeof(char3)

# Complex - Números complexos
comp1 = 2.5 + 4i
comp1
class(comp1)
mode(comp1)
typeof(comp1)

sqrt(-1)
sqrt(-1 + 0i)
sqrt(as.complex(-1))

# Logical - Valores lógicos
x = 1
y = 2
z = x > y
z
class(z)
mode(z)
typeof(z)

u = TRUE
v = FALSE
class(u)
u & v
u | v
!u

# Operações com zero
5/0
-5/0
0/5

# Erro
'5'/5