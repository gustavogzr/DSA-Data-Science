# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# Criando um dataframe vazio
df <- data.frame()
class(df)
df

# Criando vetores vazios
nomes <- character()
idades <- numeric()
itens <- numeric()
codigos <- integer()

df <- data.frame(c(nomes, idades, itens, codigos))
df

# Criando vetores
pais = c('Portugal', 'Inglaterra', 'Irlanda', 'Egito', 'Brasil')
nome = c('Bruno', 'Tiago', 'Amanda', 'Bianca', 'Marta')
altura = c(1.88, 1.76, 1.53, 1.69, 1.68)
codigo = c(5001, 2183, 4702, 7965, 8890)

# Criando um dataframe de diversos vetores
pesquisa = data.frame(pais, nome, altura, codigo)
pesquisa

# Adicionando um novo vetor a um dataframe existente
olhos = c('Verde', "Azul", 'Azul', "Castanho", "Castanho")
pesq = cbind(pesquisa, olhos)
pesq

# Informações sobre o dataframe
str(pesq)
dim(pesq)
length(pesq)

# Obtendo um vetor de um dataframe
pesq$pais
pesq$nome

# Extraindo um único valor
pesq[1, 1]
pesq[3, 2]

# Números de linhas e colunas
nrow(pesq)
ncol(pesq)

# Primeiros elementos do dataframe
head(pesq)
head(mtcars)

# Últimos elementos do dataframe
tail(pesq)
tail(mtcars)

# usar help para buscar informações sobre o mtcars
?mtcars
mtcars
dim(mtcars)
View(mtcars)

# Filtro para um subset de dados que atendem a uma condição
pesq[altura < 1.60, ]
pesq[altura < 1.60, c('codigo', 'olhos')]
pesq

# Nomear dataframe
names(pesq) <- c('País', 'Nome', 'Altura', 'Código', 'Olhos')
pesq

colnames(pesq) <- c('Var1', 'Var2', 'Var3', 'Var4', 'Var5')
rownames(pesq) <- c('Obs1', 'Obs2', 'Obs3', 'Obs4', 'Obs5')
pesq

# Carregando um arquivo csv
?read.csv
pacientes <- data.frame(read.csv(file='pacientes.csv', header = TRUE, sep = ','))

# Visualizar o dataframe
View(pacientes)
head(pacientes)
summary(pacientes)

# Visualizar as variáveis do dataframe
pacientes$Diabete
pacientes$status # vai aparecer NULL porque não existe a variável status
pacientes$Status

# Apresentar dado em histograma
hist(pacientes$Idade)

# Combinar dois dataframes
dataset_combinado <- merge(pesq, pacientes)
dataset_combinado

16 %% 3 
