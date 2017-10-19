# Assignment Plot 1

library(dplyr)
library(ggplot2)

setwd("C:\\Users\\RTutt\\Desktop\\Exploratory Data Analysis\\Assignment 2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yearlyemissions <- NEI %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

png("plot1.png", width=700, height=500)

barplot(yearlyemissions$Emissions, names.arg = yearlyemissions$year, col = 4,
        main = 'Total Emissions per Year', xlab = 'Year', ylab = 'Total PM2.5 Emissions')

dev.off()
