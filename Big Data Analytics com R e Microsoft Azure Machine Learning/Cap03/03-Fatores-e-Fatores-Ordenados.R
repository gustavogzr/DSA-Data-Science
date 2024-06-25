# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap03", sep = ""))
getwd()

vec1 <- c("Macho", "Femea", "Femea", "Macho", "Macho")
vec1
fac_vec1 <- factor(vec1)
fac_vec1
class(vec1)
class(fac_vec1)

# Variáveis categoricas nominais -> não existe uma ordem implícita
animais <- c("Zebra", "Pantera", "Rinoceronte", "Macaco", "Tigre")
animais
class(animais)
fac_animais <- factor(animais)
fac_animais
class(fac_animais)
levels(fac_animais)

# Variáveis categóricas ordinais -> possuem uma ordem natural
graduacao <- c("Mestrado", "Doutorado", "Bacharelado", "Mestrado", "Mestrado")
graduacao
fac_graduacao <- factor(graduacao, order = TRUE, levels = c("Doutorado", "Mestrado", "Bacharelado"))
fac_graduacao
levels(fac_graduacao)

# Sumarizar os dados fornece uma visão geral dos dados
summary(fac_graduacao)
summary(graduacao)

vec2 <- c("M", "F", "F", "M", "M", "M", "F", "F", "M", "M", "M", "F", "F", "M", "M")
vec2
fac_vec2 = factor(vec2)
fac_vec2
levels(fac_vec2) <- c("Femea", "Macho")
fac_vec2
summary(fac_vec2)
summary(vec2)

data = c(1,2,2,3,1,2,3,3,1,2,3,3,1)
fdata = factor(data)
fdata

rdata = factor(data, labels = c("I", "II", "III"))
rdata

# Fatores não ordenados
set1 <- c("AA", "B", "BA", "CC", "CA", "AA", "BA", "CC", "CC")
set1

f.set1 <- factor(set1)
f.set1
class(f.set1)
is.ordered(f.set1)

# Forçando ordenamento no factor
o.set1 <- factor(   
                set1,
                levels = c("CA", "BA", "AA", "CC", "B"),
                ordered = TRUE
                )
o.set1
is.ordered(o.set1)
as.numeric(o.set1)
table(o.set1)

df_etnias <- read.csv2("etnias.csv", sep = ",")
View(df_etnias)

# Verificar tipos das variáveis do dataframe
str(df_etnias)

# Variável original (antes da transformação)
levels(df_etnias$Etnia) # será NULL porque não é um factor
summary(df_etnias$Etnia)

# Criar um factor
df_etnias$Etnia <- as.factor(df_etnias$Etnia)
levels(df_etnias$Etnia)
summary(df_etnias$Etnia)

# realizar plot de dados
boxplot(df_etnias$Idade ~ df_etnias$Etnia, xlab = "Etnia", ylab = "Idade", main = "Idade por Etnia")

# Realizar um regressão linear
summary(lm(Idade ~ Etnia, data = df_etnias))

# Converter uma coluna em variável categórica, criando um factor não ordenado
df_etnias
str(df_etnias)
df_etnias$Estado_Civil.cat <- factor(df_etnias$Estado_Civil, labels = c("Solteiro", "Casado", "Divorciado"))
df_etnias
str(df_etnias)
