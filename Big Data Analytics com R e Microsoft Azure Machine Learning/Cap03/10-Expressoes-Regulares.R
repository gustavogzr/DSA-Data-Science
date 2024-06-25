# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap03", sep = ""))
getwd()

str <- c("Expressões", "regulares", "em linguagem R",
        "permitem a busca de padrões", "e exploração de textos",
        "podemos buscar padrões em dígitos",
        "como por exemplo",
        "10992452180")

length(str)
str

# usando grep
?grep
grep("ex", str, value = F) # retorna a(s) posição(ões) da(s) string(s) que contém "ex"
grep("ex", str, value = T) # retorna a(s) string(s) que contém "ex"
grep("\\d", str, value = F) # retorna a(s) posição(ões) da(s) string(s) que contém dígitos
grep("\\d", str, value = T) # retorna a(s) string(s) que contém dígitos

# usando grepl - retorna um vetor lógico (TRUE ou FALSE)
?grepl
grepl('\\d+', str)
grepl('\\D', str)

# usando gsub - substitui a string que é encontrada (padrão)
gsub('em', '***', str)
gsub('ex', 'EX', str, ignore.case = T)

# usando sub
sub('em', 'EM', str)

# usando regexpr - retorna a posição da primeira ocorrência do padrão
frase <-"Isso é uma string de teste"
regexpr(pattern = "s", frase)

# usando gregexpr - retorna a posição de todas as ocorrências do padrão
gregexpr(pattern = "s", frase)

str2 <- c('2678 é maior que 45 - @???!§$',
        'Vamos escrever 14 scripts R')

str2

# usar gsub para remover caracteres especiais
gsub('\\d', '', str2) # remove dígitos
gsub('\\D', '', str2) # remove não dígitos
gsub('\\s', '', str2) # remove espaços
gsub('[iot]',' ', str2) # remove as letras i, o e t
gsub('[[:punct:]]', '', str2) # remove pontuação
gsub('[[:alpha:]]', '', str2) # remove letras
gsub('[[:alnum:]]', '', str2) # remove letras e dígitos
gsub('[[:lower:]]', '', str2) # remove letras minúsculas
gsub('[[:upper:]]', '', str2) # remove letras maiúsculas