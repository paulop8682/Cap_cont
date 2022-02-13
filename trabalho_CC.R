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
 



