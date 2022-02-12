library(readxl)
library(tidyverse)

tabelaec <- read_excel("Faculdade/tabelaec.xls", skip = 3)

tabelaec <- tabelaec[2:15] %>%  mutate_all(as.integer)

datas_mes    <- seq(from=as.Date("2010-01-01"), to=as.Date("2021-12-11"), by="month")
tabelaec["data"] <- seq(from=as.Date("2010-01-01"), to=as.Date("2021-12-11"), by="month")
tabelaec <- select(tabelaec, data, 2:15)
glimpse(tabelaec)          

names(tabelaec)[6:13] <- c("comercio", "industria", "servicos", 
                           "outros", "MEI", "EI", "SL", "demais")


tabelaec <- na.omit(tabelaec)