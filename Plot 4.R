# Plot 4

library(dplyr)
library(ggplot2)
library(ggthemes)

setwd("C:\\Users\\RTutt\\Desktop\\Exploratory Data Analysis\\Assignment 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)
subSCC <- SCC[coal,]

totaldata <- merge(subSCC, NEI, by = 'SCC')

yearlyemissions <- totaldata %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))


png("plot4.png", width=700, height=500)

ggplot(yearlyemissions, aes(x = year, y = Emissions)) +
  geom_line(colour = "firebrick", size = 1) +
  geom_point(size = 3) +
  labs(title = 'Total Emissions From Coal Sources',
       x = 'Year',
       y = 'Total Emissions') +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face ="bold"),
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        legend.position='none') +
  geom_text(aes(label=format(round(Emissions), big.mark=",",scientific=FALSE) , size=2, hjust = .5, vjust=-1))

dev.off()
