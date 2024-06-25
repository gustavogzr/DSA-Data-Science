# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# Help
?sample
args(sample)
args(mean) # média
args(sd) # desvio padrão

# Funções built-in do R (base)
abs(-43) # valor absoluto
sum(c(1:100)) # soma
mean(c(1:100)) # média
round(c(1.1:5.8)) # arredondamento
rev(c(1:10)) # reversão
seq(1:10) # sequência
sort(rev(c(1:10))) # ordenação
append(c(1:10), 11) # adicionar elemento

vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)
vec2

# Funções dentro de funções
plot(rnorm(20))
mean(c(abs(vec1), abs(vec2)))

# Criando funções
myfunc <- function(x) { x + x }
myfunc(10)
class(myfunc)

myfunc2 <- function(a, b) {
    valor = a ^ b
    print(valor)
}
myfunc2(3, 4)

jogando_dados <- function() {
    num <- sample(1:6, size = 1) # 1 dado
    num
}

jogando_dados()

# Escopo de variáveis
print(num)
num <- c(1:6)
num # variável global

# Funções sem número definido de argumentos
vec1 <- (10:13)
vec2 <- c('a', 'b', 'c', 'd')
vec3 <- c(6.5, 9.2, 11.9, 5.1)

myfunc3 <- function(...) {
    df = data.frame(cbind(...))
    print(df)
}

myfunc3(vec1)

myfunc3(vec2, vec3)

myfunc3(vec1, vec2, vec3)

# Priorizar a utilização das funções built-in do R

x <- 1:100000000

# Função que calcula a raiz quadrada de cada elemento do vetor
minha_funcao_sqrt <- function(numeros) {
    resp <- numeric(length(numeros))
    for(i in seq_along(numeros)) {
        resp[i] <- sqrt(numeros[i])
    }
    return(resp)
}

system.time(x2a <- minha_funcao_sqrt(x))

system.time(x2b <- sqrt(x))

# A minha função para apresentar resultados diferentes por conta da precisão do cálculo
identical(x2a, x2b)