library(ggplot2) # Data visualization
library(readr) # CSV file I/O, e.g. the read_csv function
library(ggpubr) # Arrange data
library(rworldmap) # Display a worldmap


df <- read.csv("new_2016.csv", TRUE, ",")
head(df)

d1 <- data.frame(country=df$Country, value=df$Economy_GDP_per_Capita)

n1 <- joinCountryData2Map(d1, joinCode="NAME", nameJoinColumn="country")
mapCountryData(n1, nameColumnToPlot="value", mapTitle="World Map for GDP per Capita-2016",
               colourPalette="terrain")

d2 <- data.frame(country=df$Country, value=df$Freedom)

n2 <- joinCountryData2Map(d2, joinCode="NAME", nameJoinColumn="country")
mapCountryData(n2, nameColumnToPlot="value", mapTitle="World Map for freedom-2016",
               colourPalette="heat",borderCol='black')

gg <- ggplot(df , aes(x = Region, y = Happiness_Score)) +
  geom_boxplot(aes(fill=Region)) + theme(axis.title = element_text(family = "Helvetica", size = (8)))
gg
