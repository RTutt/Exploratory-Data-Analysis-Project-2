# Assignment Plot 3

library(dplyr)
library(ggplot2)
library(ggthemes)

setwd("C:\\Users\\RTutt\\Desktop\\Exploratory Data Analysis\\Assignment 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

balt <- subset(NEI, fips == "24510")

yearlyemissions <- balt %>%
  group_by(year, type) %>%
  summarise(Emissions = sum(Emissions))

yearlyemissions$type <- as.factor(yearlyemissions$type)

png("plot3.png", width=700, height=500)

ggplot(yearlyemissions, aes(x = year, y = Emissions, col = type)) +
  geom_line(size = 1) +
  ggtitle('Total Emissions Per Type In Baltimore') +
  labs(x = 'Year',
       y = 'Total PM2.5 Emissions',
       color = 'Type') +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
        axis.title.x = element_text(size = 10),
        axis.title.y = element_text(size = 10)) +
  scale_color_tableau()

dev.off()
