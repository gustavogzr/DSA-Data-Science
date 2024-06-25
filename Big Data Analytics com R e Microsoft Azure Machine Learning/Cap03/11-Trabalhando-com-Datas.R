# Configurando o diretório de trabalho
username_dir = Sys.getenv("USERNAME")
setwd(paste("C:/Users/", username_dir, "/DSA-Data-Science/Big Data Analytics com R e Microsoft Azure Machine Learning/Cap02", sep = ""))
getwd()

# buscar horas e datas do sistema
hoje <- Sys.Date()
hoje
class(hoje)
Sys.time() # data e hora do sistema
Sys.timezone() # fuso horário do sistema

# Data é representada por Date
# Date é armazenado como o número de dias desde 1 de janeiro de 1970

# Time - representado por POSIXct
# POSIXct é armazenado como o número de segundos desde 1 de janeiro de 1970

# Formatando datas:
# %d - dia do mês em 2 dígitos - Exemplo: 01, 02, 03, ..., 31
# %m - mês em 2 dígitos - Exemplo: 01, 02, 03, ..., 12
# %y - ano em 2 dígitos - Exemplo: 01, 02, 03, ..., 99
# %Y - ano em 4 dígitos - Exemplo: 2001, 2002, 2003, ..., 2099
# %a - dia da semana abreviado - Exemplo: Sun, Mon, Tue, Wed, Thu, Fri, Sat
# %A - dia da semana completo - Exemplo: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
# %b - mês abreviado - Exemplo: Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
# %B - mês completo - Exemplo: January, February, March, April, May, June, July, August, September, October, November, December

# Formatando horas:
# %H - hora em 24 horas - Exemplo: 00, 01, 02, ..., 23
# %I - hora em 12 horas - Exemplo: 01, 02, 03, ..., 12
# %p - AM/PM - Exemplo: AM, PM
# %M - minuto em 2 dígitos - Exemplo: 00, 01, 02, ..., 59
# %S - segundo em 2 dígitos - Exemplo: 00, 01, 02, ..., 59
# %T - hora, minuto e segundo - Exemplo: 00:00:00, 01:01:01, ..., 23:59:59
?strptime

# Formatando a saída - as.Date()
as.Date("2023-12-10")
as.Date("Dez-10-23", format = "%b-%d-%y")
as.Date('10 Dezembro, 2023', format = '%d %B, %Y')

# Usando o format()
Sys.Date()
?format
format(Sys.Date(), format = '%d %B, %Y')
format(Sys.Date(), format = 'Hoje é %A')

# Convertendo datas - as.POSIXct()
date1 <- "Jun 13, '96 hours:23 minutes:01 seconds:45"
date1_convert <- as.POSIXct(date1, format = "%b %d, '%y hours:%H minutes:%M seconds:%S")
date1_convert

# Operações com datas
data_de_hoje <- as.Date('2016-06-25', format = '%Y-%m-%d')
data_de_hoje
data_de_hoje + 1 # adiciona 1 dia

my_time <- as.POSIXct('2016-05-14 11:24:134')
my_time
my_time + 1 # adiciona 1 segundo

data_de_hoje - as.Date(my_time)
data_de_hoje - my_time # dá erro pois não é possível fazer operações entre Date e POSIXct

# Convertendo data em formato específico
dts = c(1127056501,1104295502,1129233601,1113547501,1119826801,1132519502,1125298801,1113289201)
mydates = dts

class(mydates) = c('POSIXt','POSIXct')
mydates
class(mydates) # POSIXct é um subconjunto de POSIXt

mydates = structure(dts, class = c('POSIXt','POSIXct')) # outra forma de converter
mydates

# Função ISODate = converte data em formato ISO - Exemplo: 2011-03-23 12:00:00 GMT
b1 <- ISOdate(2011, 3, 23)
b1
b2 <- ISOdate(2012, 9, 19)
b2
b2 - b1 # diferença entre as datas em dias

difftime(b2, b1, units = 'weeks') # diferença entre as datas b1 e b2 em semanas

# Pacote lubridate - facilita a manipulação de datas
?lubridate
install.packages('lubridate')
require(lubridate)

ymd("20180604")
mdy("06-04-2018")
dmy("04/06/2018")

chegada <- ymd_hms('2016-06-04 12:00:00', tz = 'Pacific/Auckland')
partida <- ymd_hms('2011-08-10 14:00:00', tz = 'Pacific/Auckland')

chegada
partida

second(chegada)
second(chegada) <- 23 # altera o segundo da data
chegada
wday(chegada) # dia da semana
wday(chegada, label = TRUE) # dia da semana abreviado
wday(chegada, label = TRUE, abbr = FALSE) # dia da semana completo
class(chegada)

# Cria um objeto que especifica a data de início e data de fim
interval(chegada, partida)

tm1.lub <- ymd_hms('2020-05-24 23:55:26')
tm1.lub

tm2.lub <- mdy_hm('05/25/20 08:32')
tm2.lub

year(tm1.lub)
week(tm1.lub) # semana do ano

tm1.dechr <- hour(tm1.lub) + minute(tm1.lub)/60 + second(tm1.lub)/3600 # converte para decimal
tm1.dechr

force_tz(tm1.lub, tzone = 'Pacific/Auckland') # força a conversão para o fuso horário especificado

# Gerando um dataframe com datas
sono <- data.frame(bed.time = ymd_hms("2013-09-01 23:05:24", "2013-09-02 22:51:09","2013-09-04 00:09:16", "2013-09-04 23:43:31", "2013-09-06 00:17:41", "2013-09-06 22:42:27", 
                                       "2013-09-08 00:22:27"), rise.time = ymd_hms("2013-09-02 08:03:29", "2013-09-03 07:34:21", 
                                                                                   "2013-09-04 07:45:06", "2013-09-05 07:07:17", "2013-09-06 08:17:13", "2013-09-07 06:52:11", 
                                                                                   "2013-09-08 07:15:19"), sleep.time = dhours(c(6.74, 7.92, 7.01, 6.23, 6.34, 7.42, 6.45)))
sono
sono$eficiencia <- round(100 * sono$sleep.time / (sono$rise.time - sono$bed.time), 1)
sono

# Gerar um plot a partir de datas
par(mar = c(5, 4, 4, 4))
plot(round_date(sono$rise.time, 'day'), sono$eficiencia, type = 'o', col = 'blue', xlab = 'Manhã', ylab = NA)
par(new = TRUE)
plot(round_date(sono$rise.time, 'day'), sono$sleep.time / 3600,type = 'o', col = 'red', axes = FALSE, xlab = NA, ylab = NA)
axis(side = 4)
mtext(side = 4, line = 2.5, col = 'red', 'Duração do sono (horas)')
mtext(side = 2, line = 2.5, col = 'blue', 'Eficiência do sono (%)')