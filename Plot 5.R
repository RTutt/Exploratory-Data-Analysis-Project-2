# Plot 5

library(dplyr)
library(ggplot2)
library(ggthemes)

setwd("C:\\Users\\RTutt\\Desktop\\Exploratory Data Analysis\\Assignment 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

yearlyemissions <- vehicle %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

png("plot5.png", width=700, height=500)

ggplot(yearlyemissions, aes(x = year, y = Emissions)) +
  geom_line(colour = "firebrick", size = 1) +
  geom_point(size = 3) +
  labs(title = "Total Emissions From Motor Vechile Sources: Baltimore City",
       x = 'Year') +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10),
        legend.position='none') +
  geom_text(aes(label=round(Emissions), size=2, hjust = .4, vjust=-1))

dev.off()
