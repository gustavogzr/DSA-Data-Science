# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# Criando variáveis
var1 = 100
var1
mode(var1)
help("mode")
sqrt(var1)

# Podemos atribuir o valor de uma variável a outra variável
var2 = var1
var2
mode(var2)
typeof(var2)
help("typeof")

# Uma variável pode ser uma lista de elementos
var3 = c('primeiro', 'segundo', 'terceiro')
var3
mode(var3)

# Uma variável pode ser uma função
var4 = function(x) {x+3}
var4
mode(var4)

# Podemos também mudar o modo do dado
var5 = as.character(var1)
var5
mode(var5)

# Atribuindo valores a objetos
x <- c(1,2,3)
x
c(1,2,3) -> y
y
assign("x", c(6.3,4,-2))
x

# Verificando o valor em uma posição específica
x[1]

# Verificar objetos (listar)
ls()
objects()

# Remover objetos
rm(x)
ls()
x