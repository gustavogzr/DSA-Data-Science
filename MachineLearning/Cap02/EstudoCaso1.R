username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/MachineLearning/Cap02", sep = ""))
getwd()
windows(width = 15, height = 10)

# Carregar os dados
dataset_bank <- read.table(".arquivos_DSA/bank/bank-full.csv", header = TRUE, sep = ";")
View(dataset_bank)

table(dataset_bank$job) # Contagem de valores únicos por profissão

library(dplyr)
library(ggplot2)

dataset_bank %>% # %>% é um operador do pacote dplyr
  group_by(job) %>% # group_by agrupa os dados por profissão
  summarise(n = n()) %>% # summarise realiza a contagem de valores únicos
  ggplot(aes(x = job, y = n)) +
  geom_bar(stat = "identity") + # geom_bar cria o gráfico de barras. stat = "identity" é utilizado para que o gráfico seja plotado com a contagem de valores únicos
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) # theme personaliza o gráfico. Angle = 90 é utilizado para rotacionar o texto do eixo x em 90 graus. hjust = 1 é utilizado para alinhar o texto do eixo x

dataset_bank <- dataset_bank %>%
    mutate(technology_use =
        case_when(
            job == 'admin' ~ 'medio',
            job == 'blue-collar' ~ 'baixo',
            job == 'entrepreneur' ~ 'alto',
            job == 'housemaid' ~ 'baixo',
            job == 'management' ~ 'medio',
            job == 'retired' ~ 'baixo',
            job == 'self-employed' ~ 'baixo',
            job == 'services' ~ 'medio',
            job == 'student' ~ 'alto',
            job == 'technician' ~ 'alto',
            job == 'unemployed' ~ 'baixo',
            job == 'unknown' ~ 'baixo',
        )
    )
View(dataset_bank)

table(dataset_bank$technology_use) # Contagem de valores únicos por uso de tecnologia

# Apresentar em percentual
round(prop.table(table(dataset_bank$technology_use)) * 100, 2) # prop.table calcula a proporção de valores únicos.

# Variável dummy
dataset_bank <- dataset_bank %>%
    mutate(defaulted = ifelse(default == 'yes', 1, 0))
View(dataset_bank)

# One-Hot Encoding (Transformação de variáveis categóricas em variáveis dummy)
library(caret) # Biblioteca para Machine Learning
dmy <- dummyVars("~ .", data = dataset_bank) # dummyVars cria variáveis dummy
bank.dummies <- data.frame(predict(dmy, newdata = dataset_bank)) # predict aplica a transformação de variáveis dummy
View(bank.dummies)
str(bank.dummies) # Exibir a estrutura do dataset

# Combinando recursos
dataset_bank %>%
    group_by(job, marital) %>%
    summarise(n = n()) # Contagem de valores únicos por profissão e estado civil

# Visualizando em gráfico
dataset_bank %>%
    group_by(job, marital) %>%
    summarise(n = n()) %>%
    ggplot(aes(x = job, y = n, fill = marital)) +
    geom_bar(stat = "identity", position = "dodge") + # position = "dodge" é utilizado para separar as barras
    theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Combinando recursos
dmy <- dummyVars("~ job:marital", data = dataset_bank)
bank.cross <- predict(dmy, newdata = dataset_bank)
View(bank.cross)