library(readxl)
library(tidyverse)
KOFGI_2020 <- read_excel("Faculdade/KOFGI_2020.xlsx")

kof <- KOFGI_2020[,1:4]

t <- filter(kof, country == am)
am <- c("Latin America and Caribbean" ,
        "Brazil", 
        "World", 
        "North America",
        "Middle East and North Africa")

#NAC North America
#MEA Middle East and North Africa
#LCN Latin America and Caribbean

ggplot(t, aes(year, KOFGI, color = code)) + 
  geom_line(size = 1.2) +
  theme_light()
 
table_kof <- na.omit(KOFGI_2020[,1:4]) %>% 
  group_by(code, country) %>% summarise(mean(KOFGI))

top_n(table_kof, -5)

AL <- c("ARG", "BRA", "CHL", "CUB", "VEN", "COL", "CRI",
        "ECU", "GTM", "HND", "HTI", "MEX", "NIC", "PAN",
        "PRY", "PER", "URY")

func_al <- function(x) {
  fca <- filter(table_kof, code == x)
  return(fca)
}

AL <- data.frame(vari = rbind(func_al("ARG"), func_al("BRA"), func_al("CHL"), func_al("CUB"),
                        func_al("VEN"), func_al("COL"), func_al("CRI"), func_al("ECU"),
                        func_al("GTM"), func_al("HND"), func_al("HTI"), func_al("MEX"),
                        func_al("NIC"), func_al("PAN"), func_al("PRY"), func_al("PER"), 
                        func_al("URY"),))

names(AL) <- c("Code", "Country", "KOFGI")
AL$KOFGI <- round(AL$KOFGI, 2)

ggplot(AL, aes(Code, KOFGI)) + 
  geom_col(fill = "darkred", color = "black") +
  theme_classic(base_size = 18) + 
  ggtitle("Índice KOF da América Latina",
          subtitle = "Média de 1970 à 2016") +
  xlab("")


library(DT)
datatable(AL)













