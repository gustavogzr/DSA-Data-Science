# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap03", sep = ""))
getwd()

vec1 <- c(1001, 1002, 1003, 1004, 1005)
vec2 <- c(0, 1, 1, 0, 2)
vec3 <- c('Verde', 'Laranja', 'Azul', 'Laranja', 'Verde')

# unir os 3 vetores em um dataframe
df <- data.frame(vec1, vec2, vec3)
df

# transformar a coluna vec3 em um fator
df$vec3 = as.factor(df$vec3)
df

# Verificar o tipo de objeto
str(df)

# Verificar níveis do fator
levels(df$vec3)

# Cirar uma nova coluna e atrubuir labels
df$cat1 <- factor(df$vec3, labels = c('cor2', 'cor1', 'cor3'))
df

str(df) 

# Criar uma nova coluna e atribuir labels
df$cat2 <- factor(df$vec2, labels = c('Divorciado', 'Casado', 'Solteiro'))
df
str(df)
levels(df$cat2)